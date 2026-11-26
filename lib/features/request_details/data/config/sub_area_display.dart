import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';

import '../../../../main_imports.dart';

/// المناطق الفرعية جايه جوه كل عنصر في `locations[].areas` بالشكل:
/// `{"area": {...}, "sub_areas": [{"name_ar": "...", "name_en": "...",
///   "other_sub_areas": [{"name": "..."}]}]}`
///
/// الكلاس ده بيستخرج أسماء المناطق الفرعية بلغة التطبيق، ولو المنطقة الفرعية
/// "أخرى" وجواها أسماء مخصصة في `other_sub_areas` بيعرض الأسماء المخصصة.
class SubAreaDisplay {
  const SubAreaDisplay._();

  /// فاصل عربي للغة العربية وفاصل لاتيني للإنجليزية
  static String _separator(BuildContext context) =>
      context.isArabic ? '، ' : ', ';

  /// أسماء المناطق الفرعية لأول location في الطلب، أو `null` لو مفيش
  /// (الصف بيختفي بالكامل في الحالة دي).
  static String? fromLocations(
    BuildContext context,
    List<Locations>? locations,
  ) {
    if (locations == null || locations.isEmpty) return null;
    return fromAreas(context, locations.first.areas);
  }

  static String? fromAreas(BuildContext context, List<dynamic>? areas) {
    if (areas == null || areas.isEmpty) return null;

    final names = <String>{}; // Set يمنع تكرار نفس المنطقة الفرعية
    for (final area in areas) {
      if (area is! Map) continue;
      final subAreas = area['sub_areas'] ?? area['subAreas'];
      if (subAreas is! Iterable) continue;
      for (final subArea in subAreas) {
        names.addAll(_namesOf(context, subArea));
      }
    }

    if (names.isEmpty) return null;
    return names.join(_separator(context));
  }

  static List<String> _namesOf(BuildContext context, dynamic subArea) {
    if (subArea == null) return const [];

    if (subArea is String) {
      final name = _text(subArea);
      return name == null ? const [] : [name];
    }

    // ids لوحدها مش اسم يتعرض للمستخدم
    if (subArea is num) return const [];
    if (subArea is! Map) return const [];

    // "أخرى" + أسماء مخصصة => بنعرض المخصص بدل كلمة "أخرى"
    final others = subArea['other_sub_areas'] ?? subArea['otherSubAreas'];
    if (others is Iterable) {
      final customs = <String>[];
      for (final other in others) {
        final name = other is Map
            ? _text(other['name'] ?? other['name_ar'] ?? other['nameAr'])
            : _text(other);
        if (name != null) customs.add(name);
      }
      if (customs.isNotEmpty) return customs;
    }

    final ar = _text(subArea['name_ar'] ?? subArea['nameAr']);
    final en = _text(subArea['name_en'] ?? subArea['nameEn']);
    final plain = _text(subArea['name'] ?? subArea['title']);

    final resolved = context.isArabic ? (ar ?? plain ?? en) : (en ?? plain ?? ar);
    return resolved == null ? const [] : [resolved];
  }

  static String? _text(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    if (text.isEmpty || text == 'null') return null;
    return text;
  }
}
