import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../main_imports.dart';

/// نوع القيمة، بيحدد شكل العرض (وحدة المساحة، الجنيه، تاريخ، ليستة...)
enum RecommendedFieldKind { text, enumLabel, area, price, date, list, phone }

/// حقل واحد من حقول الوحدة الموصى بها: مفتاح الـAPI + مفتاح الترجمة + نوعه
class RecommendedField {
  const RecommendedField(this.key, this.labelKey,
      [this.kind = RecommendedFieldKind.text]);

  final String key;

  /// مفتاح ترجمة من [LangKeys]، بيتترجم وقت العرض على حسب اللغة المختارة
  final String labelKey;
  final RecommendedFieldKind kind;

  /// اسم الحقل باللغة المختارة
  String get label => labelKey.tr();
}

/// مجموعة حقول بعنوان، بتتعرض كقسم في شيت التفاصيل
class RecommendedFieldGroup {
  const RecommendedFieldGroup(this.titleKey, this.fields);

  /// مفتاح ترجمة من [LangKeys]
  final String titleKey;
  final List<RecommendedField> fields;

  /// عنوان القسم باللغة المختارة
  String get title => titleKey.tr();
}

/// كل حقول الوحدة كمفاتيح ترجمة ومكان كل حقل في العرض.
///
/// الـAPI بيرجّع أكتر من 60 حقل لكل توصية، فبنعرض [highlights] (أهم 10) في
/// الجدول وأول الشيت، وباقي الحقول متقسّمة على [groups]. أي حقل قيمته فاضية
/// أو صفر بيختفي بالكامل عن طريق [DisplayValue].
class RecommendedFields {
  const RecommendedFields._();

  /// أهم 10 حقول بتفرق فعلًا للوسيط وهو بيطابق وحدة على طلب
  static const List<RecommendedField> highlights = [
    RecommendedField(
        'unitOperation', LangKeys.operationType, RecommendedFieldKind.enumLabel),
    RecommendedField('type', LangKeys.unitType, RecommendedFieldKind.enumLabel),
    RecommendedField('unitArea', LangKeys.size, RecommendedFieldKind.area),
    RecommendedField('numberOfRooms', LangKeys.numberOfRooms),
    RecommendedField('numberOfBathrooms', LangKeys.bathrooms),
    RecommendedField(
        'finishingType', LangKeys.finishing, RecommendedFieldKind.enumLabel),
    RecommendedField(
        'deliveryStatus', LangKeys.deliveryStatus, RecommendedFieldKind.enumLabel),
    RecommendedField(
        'totalPriceInCash', LangKeys.totalPriceCash, RecommendedFieldKind.price),
    RecommendedField(
        'pricePerMeterInCash', LangKeys.pricePerMeterCash, RecommendedFieldKind.price),
    RecommendedField('city', LangKeys.city),
  ];

  static const List<RecommendedFieldGroup> groups = [
    RecommendedFieldGroup(LangKeys.location, [
      RecommendedField('area', LangKeys.area),
      RecommendedField('subArea', LangKeys.subArea),
      RecommendedField(
          'otherSubAreas', LangKeys.otherSubAreas, RecommendedFieldKind.list),
      RecommendedField('detailedAddress', LangKeys.detailedAddress),
      RecommendedField(
          'compoundType', LangKeys.compoundKind, RecommendedFieldKind.enumLabel),
      RecommendedField('compoundName', LangKeys.compoundName),
      RecommendedField('villageName', LangKeys.villageName),
      RecommendedField('mallName', LangKeys.mallName),
      RecommendedField('projectName', LangKeys.projectName),
      RecommendedField('developerName', LangKeys.developerName),
      RecommendedField('locationInMasterPlan', LangKeys.masterPlanLocation),
    ]),
    RecommendedFieldGroup(LangKeys.unitData, [
      RecommendedField(
          'subUnitType', LangKeys.subType, RecommendedFieldKind.enumLabel),
      RecommendedField('buildingNumber', LangKeys.buildingNumber),
      RecommendedField('unitNumber', LangKeys.unitNumber),
      RecommendedField('floor', LangKeys.floor, RecommendedFieldKind.enumLabel),
      RecommendedField('floorNumber', LangKeys.floorNumber),
      RecommendedField('numberOfFloors', LangKeys.floors),
      RecommendedField(
          'unitAreaMin', LangKeys.minimumArea, RecommendedFieldKind.area),
      RecommendedField(
          'unitAreaMax', LangKeys.maximumArea, RecommendedFieldKind.area),
      RecommendedField('groundArea', LangKeys.landingArea, RecommendedFieldKind.area),
      RecommendedField('buildingArea', LangKeys.buildingArea, RecommendedFieldKind.area),
      RecommendedField('gardenArea', LangKeys.gardenArea, RecommendedFieldKind.area),
      RecommendedField('terraceArea', LangKeys.terraceArea, RecommendedFieldKind.area),
      RecommendedField('view', LangKeys.theView, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'unitFacing', LangKeys.unitFacing, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'unitDesign', LangKeys.unitDesign, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'unitDescription', LangKeys.unitDescription, RecommendedFieldKind.enumLabel),
      RecommendedField('unitLayoutStatus', LangKeys.unitDivisionStatus,
          RecommendedFieldKind.enumLabel),
      RecommendedField('buildingLayoutStatus', LangKeys.buildingDivisionStatus,
          RecommendedFieldKind.enumLabel),
      RecommendedField('groundLayoutStatus', LangKeys.landDivisionStatus,
          RecommendedFieldKind.enumLabel),
    ]),
    RecommendedFieldGroup(LangKeys.conditionAndFinishing, [
      RecommendedField('status', LangKeys.status, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'deliveryDate', LangKeys.deliveryDate, RecommendedFieldKind.date),
      RecommendedField(
          'furnishingStatus', LangKeys.furnishingStatus, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'fitOutCondition', LangKeys.fitOutCondition, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'legalStatus', LangKeys.legalStatus, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'financialStatus', LangKeys.financialStatus, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'buildingLicense', LangKeys.buildingLicense, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'buildingDeadline', LangKeys.constructionDuration, RecommendedFieldKind.enumLabel),
      RecommendedField('activity', LangKeys.activity, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'shopActivity', LangKeys.shopActivity, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'parkingStatus', LangKeys.garage, RecommendedFieldKind.enumLabel),
      RecommendedField('clubStatus', LangKeys.club, RecommendedFieldKind.enumLabel),
    ]),
    RecommendedFieldGroup(LangKeys.pricesAndPayment, [
      RecommendedField('totalPriceInInstallment', LangKeys.totalPriceInstallment,
          RecommendedFieldKind.price),
      RecommendedField('pricePerMeterInInstallment', LangKeys.pricePerMeterInstallment,
          RecommendedFieldKind.price),
      RecommendedField('unitPrice', LangKeys.unitPrice, RecommendedFieldKind.price),
      RecommendedField(
          'unitPriceSuggestions', LangKeys.brokerPriceSuggestion, RecommendedFieldKind.price),
      RecommendedField('askingPrice', LangKeys.askingPrice, RecommendedFieldKind.price),
      RecommendedField(
          'requestedOver', LangKeys.requiredIncrease, RecommendedFieldKind.price),
      RecommendedField('dailyRent', LangKeys.dailyRent, RecommendedFieldKind.price),
      RecommendedField(
          'monthlyRent', LangKeys.monthlyRent, RecommendedFieldKind.price),
      RecommendedField(
          'paymentSystem', LangKeys.paymentSystem, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'paymentMethod', LangKeys.paymentWay, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'rentRecurrence', LangKeys.rentFrequency, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'requiredInsurance', LangKeys.requiredInsurance, RecommendedFieldKind.enumLabel),
      RecommendedField(
          'insuranceValue', LangKeys.insuranceValue, RecommendedFieldKind.price),
      RecommendedField(
          'otherExpenses', LangKeys.otherExpenses, RecommendedFieldKind.list),
      RecommendedField('otherExpensesValue', LangKeys.otherExpensesValue,
          RecommendedFieldKind.price),
    ]),
    RecommendedFieldGroup(LangKeys.managementAndNotes, [
      RecommendedField('managementTeam', LangKeys.managementTeam),
      RecommendedField('projectManagement', LangKeys.projectAdministration),
      RecommendedField('projectConstructor', LangKeys.contractor),
      RecommendedField(
          'otherAccessories', LangKeys.otherAccessories, RecommendedFieldKind.list),
      RecommendedField('caption', LangKeys.description),
      RecommendedField('notes', LangKeys.notes),
    ]),
  ];

  /// حقول التواصل لوحدها عشان أرقام التليفون بتبقى قابلة للاتصال والواتساب
  static const List<RecommendedField> contacts = [
    RecommendedField('ownerName', LangKeys.ownerName),
    RecommendedField('ownerPhone', LangKeys.ownerPhone, RecommendedFieldKind.phone),
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
        return DisplayValue.withSuffix(raw, LangKeys.squareMeter.tr());
      case RecommendedFieldKind.price:
        final price = DisplayValue.text(raw);
        return price == null
            ? null
            : LangKeys.priceWithCurrency.tr(namedArgs: {'price': price});
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
        return names.isEmpty ? null : names.join(LangKeys.listSeparator.tr());
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
