import 'package:easy_deal/features/create_request/data/stepper_config/stepper_constants.dart';

import '../../main_imports.dart';

/// نفس داتا الويب (specializationDisplayMap): كل تخصص فرعي والوحدات اللي جواه
/// بالعربي والإنجليزي - منقولة زي ما هي عشان الموبايل والويب يعرضوا نفس الكلام.
class SpecializationDisplayData {
  const SpecializationDisplayData._();

  static const Map<String, Map<String, String>> displayMap = {
    'purchasing_sell_residential_outside_compound': {
      'en': 'Apartments - duplexes - penthouses - roof - basements - studio',
      'ar': 'شقق - دوبلكس - بنتهاوس - روف - بدروم - استوديو',
    },
    'purchasing_sell_national_housing_projects_outside_compound': {
      'en':
          'National Housing - Mixed Housing - Youth Housing - Ganet Masr - Dar Masr - Sakan Masr',
      'ar':
          'الإسكان القومي - الإسكان المختلط - إسكان الشباب - جنة مصر - دار مصر - سكن مصر',
    },
    'purchasing_sell_administrative_commercial_units_outside_compound': {
      'en': 'Administrative Units - Commercial - Pharmacies - Clinics - Shops',
      'ar': 'وحدات إدارية - تجارية - صيدليات - عيادات - محلات',
    },
    'purchasing_sell_industrial_and_warehousing_outside_compound': {
      'en': 'Factories - Warehouses - Industrial Lands - Warehouse Lands',
      'ar': 'مصانع - مخازن - أراضي صناعية - أراضي مخازن',
    },
    'purchasing_sell_lands_and_ready_projects_outside_compound': {
      'en':
          'Administrative & Commercial Lands - Commercial Administrative Malls',
      'ar': 'أراضي إدارية وتجارية - مولات إدارية تجارية',
    },
    'purchasing_sell_villas_and_buildings_outside_compound': {
      'en': 'Villas - Full Buildings - Residential Lands - Concrete Structure',
      'ar': 'فيلات - مباني كاملة - أراضي سكنية - هيكل خرساني',
    },
    'purchasing_sell_vacation_units_outside_compound': {
      'en': 'Chalet - Vacation Units Outside Compound',
      'ar': 'شاليهات - فيلات مصيفية خارج كومباوند',
    },
    'purchasing_sell_residential_inside_compound': {
      'en': 'Apartments - duplexes - penthouses - i villa - studio',
      'ar': 'شقق - دوبلكس - بنتهاوس - آي فيلا - استوديو',
    },
    'purchasing_sell_villas_inside_compound': {
      'en': 'Villas - Standalone - town house - twin house',
      'ar': 'فيلات - منفصلة - تاون هاوس - توين هاوس',
    },
    'purchasing_sell_administrative_commercial_units_inside_compound': {
      'en': 'Administrative Units - Commercial - Pharmacies - Clinics - Shops',
      'ar': 'وحدات إدارية - تجارية - صيدليات - عيادات - محلات',
    },
    'purchasing_sell_vacation_units_inside_compound': {
      'en': 'Chalet - Vacation Units Inside Compound',
      'ar': 'شاليهات - فيلات مصيفية داخل كومباوند',
    },
    'rent_residential_inside_compound': {
      'en': 'Apartments - duplexes - penthouses - i villa - villas - studio',
      'ar': 'شقق - دوبلكس - بنتهاوس - آي فيلا - فيلات - استوديو',
    },
    'rent_hotel_vacation_units_inside_compound': {
      'en': 'Hotel - Vacation Units',
      'ar': 'وحدات فندقية و مصيفية داخل كومباند',
    },
    'rent_administrative_commercial_units_inside_compound': {
      'en': 'Administrative Units - Commercial - Pharmacies - Clinics - Shops',
      'ar': 'وحدات إدارية - تجارية - صيدليات - عيادات - محلات',
    },
    'rent_residential_outside_compound': {
      'en':
          'Apartments - duplexes - penthouses - roof - basements - villas - studio',
      'ar': 'شقق - دوبلكس - بنتهاوس - روف - بدروم - فيلات - استوديو',
    },
    'rent_national_housing_projects_outside_compound': {
      'en':
          'National Housing - Mixed Housing - Youth Housing - Ganet Masr - Dar Masr - Sakan Masr',
      'ar': 'ايجار اسكان قومى منازل مشاريع خارج كومباوند',
    },
    'rent_administrative_commercial_units_outside_compound': {
      'en':
          'Administrative Units - Commercial - Pharmacies - Clinics - Shops - full buildings',
      'ar': 'وحدات إدارية - تجارية - صيدليات - عيادات - محلات - مباني كاملة',
    },
    'rent_industrial_and_warehousing_outside_compound': {
      'en': 'Factories - Warehouses',
      'ar': 'مصانع - مخازن',
    },
    'rent_hotel_vacation_units_outside_compound': {
      'en': 'Hotel - Vacation Units',
      'ar': 'ايجار وحدات فندقية و مصيفية خارج كومباوند',
    },
    'rent_national_housing_projects_compound': {
      'en':
          'National Housing - Mixed Housing - Youth Housing - Ganet Masr - Dar Masr - Sakan Masr',
      'ar': 'ايجار اسكان قومى منازل مشاريع خارج كومباوند',
    },
  };

  /// بيوحّد شكل المفتاح الجاي من السيرفر (مسافات / شرط مايل / حروف كبيرة)
  static String normalizeKey(String? raw) {
    if (raw == null) return '';
    return raw
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll('/', '_');
  }

  /// نص وحدات التخصص الفرعي كامل زي الويب، أو فاضي لو المفتاح مش معروف
  static String displayText(BuildContext context, String? specialization) {
    final entry = displayMap[normalizeKey(specialization)];
    if (entry == null) return '';
    return (context.isArabic ? entry['ar'] : entry['en']) ?? '';
  }

  /// نفس النص بس مقسّم لوحدات منفصلة عشان يتعرض شيبس
  static List<String> units(BuildContext context, String? specialization) {
    final text = displayText(context, specialization);
    if (text.isEmpty) return const [];
    return text
        .split('-')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  /// وحدات التخصص الأساسي (specializationScope) كاملة من الملف الثابت:
  /// تجميع وحدات كل التخصصات الفرعية اللي تحته بدون تكرار. بتستخدم لما
  /// نعرض النطاق لوحده من غير تخصصات الوسيط.
  static List<String> scopeUnits(BuildContext context, String? scope) {
    final key = normalizeKey(scope);
    final subs = specializationScopeSubOptions[key];
    if (subs == null) return const [];

    return mergeUnits(subs.map((sub) => units(context, sub)));
  }

  /// بيدمج قوائم وحدات مع بعض بدون تكرار وبنفس الترتيب
  static List<String> mergeUnits(Iterable<List<String>> lists) {
    final result = <String>[];
    for (final list in lists) {
      for (final unit in list) {
        if (!result.contains(unit)) result.add(unit);
      }
    }
    return result;
  }
}
