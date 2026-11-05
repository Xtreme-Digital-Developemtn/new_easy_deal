import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';

import '../../../../main_imports.dart';

/// نوع القيمة، بيحدد شكل العرض (وحدة المساحة، الجنيه، تاريخ، ليستة...)
enum RecommendedFieldKind { text, enumLabel, area, price, date, list, phone }

/// حقل واحد من حقول الوحدة الموصى بها: مفتاح الـAPI + اسمه بالعربي + نوعه
class RecommendedField {
  const RecommendedField(this.key, this.label,
      [this.kind = RecommendedFieldKind.text]);

  final String key;
  final String label;
  final RecommendedFieldKind kind;
}

/// مجموعة حقول بعنوان، بتتعرض كقسم في شيت التفاصيل
class RecommendedFieldGroup {
  const RecommendedFieldGroup(this.title, this.fields);

  final String title;
  final List<RecommendedField> fields;
}

/// كل أسماء حقول الوحدة بالعربي ومكان كل حقل في العرض.
///
/// الـAPI بيرجّع أكتر من 60 حقل لكل توصية، فبنعرض [highlights] (أهم 10) في
/// الجدول وأول الشيت، وباقي الحقول متقسّمة على [groups]. أي حقل قيمته فاضية
/// أو صفر بيختفي بالكامل عن طريق [DisplayValue].
class RecommendedFields {
  const RecommendedFields._();

  /// أهم 10 حقول بتفرق فعلًا للوسيط وهو بيطابق وحدة على طلب
  static const List<RecommendedField> highlights = [
    RecommendedField(
        'unitOperation', 'نوع العملية', RecommendedFieldKind.enumLabel),
    RecommendedField('type', 'نوع الوحدة', RecommendedFieldKind.enumLabel),
    RecommendedField('unitArea', 'المساحة', RecommendedFieldKind.area),
    RecommendedField('numberOfRooms', 'عدد الغرف'),
    RecommendedField('numberOfBathrooms', 'عدد الحمامات'),
    RecommendedField(
        'finishingType', 'التشطيب', RecommendedFieldKind.enumLabel),
    RecommendedField(
        'deliveryStatus', 'حالة التسليم', RecommendedFieldKind.enumLabel),
    RecommendedField(
        'totalPriceInCash', 'السعر الإجمالي كاش', RecommendedFieldKind.price),
    RecommendedField(
        'pricePerMeterInCash', 'سعر المتر كاش', RecommendedFieldKind.price),
    RecommendedField('city', 'المدينة'),
  ];

  static const List<RecommendedFieldGroup> groups = [
    RecommendedFieldGroup('الموقع', [
      RecommendedField('area', 'المنطقة'),
      RecommendedField('subArea', 'المنطقة الفرعية'),
      RecommendedField(
          'otherSubAreas', 'مناطق فرعية أخرى', RecommendedFieldKind.list),
      RecommendedField('detailedAddress', 'العنوان التفصيلي'),
      RecommendedField(
          'compoundType', 'نوع الكمبوند', RecommendedFieldKind.enumLabel),
      RecommendedField('compoundName', 'اسم الكمبوند'),
      RecommendedField('villageName', 'اسم القرية'),
      RecommendedField('mallName', 'اسم المول'),
      RecommendedField('projectName', 'اسم المشروع'),
      RecommendedField('developerName', 'اسم المطوّر'),
      RecommendedField('locationInMasterPlan', 'الموقع في الماستر بلان'),
    ]),
    RecommendedFieldGroup('بيانات الوحدة', [
      RecommendedField(
          'subUnitType', 'النوع الفرعي', RecommendedFieldKind.enumLabel),
      RecommendedField('buildingNumber', 'رقم العمارة'),
      RecommendedField('unitNumber', 'رقم الوحدة'),
      RecommendedField('floor', 'الدور', RecommendedFieldKind.enumLabel),
      RecommendedField('floorNumber', 'رقم الدور'),
      RecommendedField('numberOfFloors', 'عدد الأدوار'),
      RecommendedField(
          'unitAreaMin', 'الحد الأدنى للمساحة', RecommendedFieldKind.area),
      RecommendedField(
          'unitAreaMax', 'الحد الأقصى للمساحة', RecommendedFieldKind.area),
      RecommendedField('groundArea', 'مساحة الأرض', RecommendedFieldKind.area),
      RecommendedField('buildingArea', 'مساحة البناء', RecommendedFieldKind.area),
      RecommendedField('gardenArea', 'مساحة الحديقة', RecommendedFieldKind.area),
      RecommendedField('terraceArea', 'مساحة التراس', RecommendedFieldKind.area),
      RecommendedField('view', 'الإطلالة', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'unitFacing', 'اتجاه الوحدة', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'unitDesign', 'تصميم الوحدة', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'unitDescription', 'وصف الوحدة', RecommendedFieldKind.enumLabel),
      RecommendedField('unitLayoutStatus', 'حالة تقسيم الوحدة',
          RecommendedFieldKind.enumLabel),
      RecommendedField('buildingLayoutStatus', 'حالة تقسيم المبنى',
          RecommendedFieldKind.enumLabel),
      RecommendedField('groundLayoutStatus', 'حالة تقسيم الأرض',
          RecommendedFieldKind.enumLabel),
    ]),
    RecommendedFieldGroup('الحالة والتشطيب', [
      RecommendedField('status', 'الحالة', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'deliveryDate', 'تاريخ التسليم', RecommendedFieldKind.date),
      RecommendedField(
          'furnishingStatus', 'حالة الفرش', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'fitOutCondition', 'حالة التجهيز', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'legalStatus', 'الموقف القانوني', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'financialStatus', 'الموقف المالي', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'buildingLicense', 'رخصة البناء', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'buildingDeadline', 'مدة البناء', RecommendedFieldKind.enumLabel),
      RecommendedField('activity', 'النشاط', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'shopActivity', 'نشاط المحل', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'parkingStatus', 'الجراج', RecommendedFieldKind.enumLabel),
      RecommendedField('clubStatus', 'النادي', RecommendedFieldKind.enumLabel),
    ]),
    RecommendedFieldGroup('الأسعار والسداد', [
      RecommendedField('totalPriceInInstallment', 'السعر الإجمالي بالتقسيط',
          RecommendedFieldKind.price),
      RecommendedField('pricePerMeterInInstallment', 'سعر المتر بالتقسيط',
          RecommendedFieldKind.price),
      RecommendedField('unitPrice', 'سعر الوحدة', RecommendedFieldKind.price),
      RecommendedField(
          'unitPriceSuggestions', 'اقتراح سعر الوسيط', RecommendedFieldKind.price),
      RecommendedField('askingPrice', 'السعر المطلوب', RecommendedFieldKind.price),
      RecommendedField(
          'requestedOver', 'المطلوب زيادة', RecommendedFieldKind.price),
      RecommendedField('dailyRent', 'الإيجار اليومي', RecommendedFieldKind.price),
      RecommendedField(
          'monthlyRent', 'الإيجار الشهري', RecommendedFieldKind.price),
      RecommendedField(
          'paymentSystem', 'نظام السداد', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'paymentMethod', 'طريقة السداد', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'rentRecurrence', 'تكرار الإيجار', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'requiredInsurance', 'التأمين المطلوب', RecommendedFieldKind.enumLabel),
      RecommendedField(
          'insuranceValue', 'قيمة التأمين', RecommendedFieldKind.price),
      RecommendedField(
          'otherExpenses', 'مصاريف أخرى', RecommendedFieldKind.list),
      RecommendedField('otherExpensesValue', 'قيمة المصاريف الأخرى',
          RecommendedFieldKind.price),
    ]),
    RecommendedFieldGroup('الإدارة والملاحظات', [
      RecommendedField('managementTeam', 'فريق الإدارة'),
      RecommendedField('projectManagement', 'إدارة المشروع'),
      RecommendedField('projectConstructor', 'المقاول'),
      RecommendedField(
          'otherAccessories', 'ملحقات أخرى', RecommendedFieldKind.list),
      RecommendedField('caption', 'الوصف'),
      RecommendedField('notes', 'ملاحظات'),
    ]),
  ];

  /// حقول التواصل لوحدها عشان أرقام التليفون بتبقى قابلة للاتصال والواتساب
  static const List<RecommendedField> contacts = [
    RecommendedField('ownerName', 'اسم المالك'),
    RecommendedField('ownerPhone', 'رقم المالك', RecommendedFieldKind.phone),
  ];

  /// بيدوّر على المفتاح في الـjson الأصلي، وجوه `additionalDetails`،
  /// وبصيغة snake_case كمان لأن الـAPI مش متسق في التسمية.
  static dynamic rawValue(Map<String, dynamic>? json, String key) {
    if (json == null) return null;
    final candidates = <String>{key, _snake(key)};
    for (final candidate in candidates) {
      if (json[candidate] != null) return json[candidate];
    }
    final extra = json['additionalDetails'];
    if (extra is Map) {
      for (final candidate in candidates) {
        if (extra[candidate] != null) return extra[candidate];
      }
    }
    return null;
  }

  /// النص الجاهز للعرض، أو `null` لو الحقل لازم يختفي
  static String? display(
    BuildContext context,
    Map<String, dynamic>? json,
    RecommendedField field,
  ) {
    final raw = rawValue(json, field.key);
    if (raw == null) return null;

    switch (field.kind) {
      case RecommendedFieldKind.area:
        return DisplayValue.withSuffix(raw, 'م²');
      case RecommendedFieldKind.price:
        final price = DisplayValue.text(raw);
        return price == null ? null : '$price جنيه';
      case RecommendedFieldKind.enumLabel:
        return DisplayValue.mapped(
          raw,
          (value) => ApOptions.label(value?.toString(), context.isArabic),
        );
      case RecommendedFieldKind.date:
        return _date(raw);
      case RecommendedFieldKind.list:
      case RecommendedFieldKind.phone:
      case RecommendedFieldKind.text:
        final names = _names(context, raw);
        return names.isEmpty ? null : names.join('، ');
    }
  }

  /// بيحوّل القيمة لنصوص: الـobjects بتاخد الاسم العربي أو الإنجليزي،
  /// والـids لوحدها مش اسم يتعرض للمستخدم.
  static List<String> _names(BuildContext context, dynamic value) {
    if (value is List) {
      return value.expand((item) => _names(context, item)).toSet().toList();
    }
    if (value is Map) {
      final ar = DisplayValue.text(value['name_ar'] ?? value['nameAr']);
      final en = DisplayValue.text(value['name_en'] ?? value['nameEn']);
      final plain = DisplayValue.text(value['name'] ?? value['title']);
      final resolved =
          context.isArabic ? (ar ?? plain ?? en) : (en ?? plain ?? ar);
      return resolved == null ? const [] : [resolved];
    }
    final text = DisplayValue.text(value);
    return text == null ? const [] : [text];
  }

  static String? _date(dynamic value) {
    final text = DisplayValue.text(value);
    if (text == null) return null;
    final parsed = DateTime.tryParse(text);
    if (parsed == null) return text;
    final month = parsed.month.toString().padLeft(2, '0');
    final day = parsed.day.toString().padLeft(2, '0');
    return '${parsed.year}/$month/$day';
  }

  static String _snake(String key) => key
      .replaceAllMapped(RegExp(r'[A-Z]'), (m) => '_${m[0]!.toLowerCase()}')
      .replaceAll(RegExp(r'^_'), '');
}
