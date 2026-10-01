import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';

import '../../../../main_imports.dart';

/// `areas` جايه من الـAPI كـ `List<dynamic>` وممكن تكون:
/// - `List<String>`            => ["مدينة نصر", "المعادي"]
/// - `List<Map>`               => [{"name_ar": "...", "name_en": "..."}]
/// - `List<Map>` جواها area    => [{"area": {"name_ar": "..."}}]
/// - `List<int>` (ids بس)      => [12, 15]
///
/// الكلاس ده بيحوّلها لنص مقروء بلغة التطبيق بدل الـ`toString()` الخام.
class AreaDisplay {
  const AreaDisplay._();

  static const String _fallback = '-';

  /// فاصل عربي للغة العربية وفاصل لاتيني للإنجليزية
  static String _separator(BuildContext context) =>
      context.isArabic ? '، ' : ', ';

  /// اسم المنطقة/المناطق لأول location في الطلب
  static String fromLocations(
    BuildContext context,
    List<Locations>? locations,
  ) {
    if (locations == null || locations.isEmpty) return _fallback;
    return fromAreas(context, locations.first.areas);
  }

  static String fromAreas(BuildContext context, List<dynamic>? areas) {
    if (areas == null || areas.isEmpty) return _fallback;

    final names = areas
        .map((area) => _nameOf(context, area))
        .where((name) => name != null && name.trim().isNotEmpty)
        .cast<String>()
        .toSet() // يمنع تكرار نفس المنطقة
        .toList();

    if (names.isEmpty) return _fallback;
    return names.join(_separator(context));
  }

  static String? _nameOf(BuildContext context, dynamic area) {
    if (area == null) return null;

    if (area is String) return area.trim();

    // ids لوحدها مش اسم يتعرض للمستخدم
    if (area is num) return null;

    if (area is Map) {
      // بعض الـresponses بتلفّ المنطقة جوه object باسم area
      final nested = area['area'];
      if (nested is Map) {
        final nestedName = _nameOf(context, nested);
        if (nestedName != null && nestedName.isNotEmpty) return nestedName;
      }

      final ar = _text(area['name_ar'] ?? area['nameAr']);
      final en = _text(area['name_en'] ?? area['nameEn']);
      final plain = _text(area['name'] ?? area['title'] ?? area['area_name']);

      if (context.isArabic) {
        return ar ?? plain ?? en;
      }
      return en ?? plain ?? ar;
    }

    return null;
  }

  static String? _text(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    if (text.isEmpty || text == 'null') return null;
    return text;
  }
}
