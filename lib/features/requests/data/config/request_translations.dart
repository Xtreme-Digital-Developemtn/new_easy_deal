/// Arabic translations for the raw English enum-like values the requests
/// API returns (type / unit / status / specializationScope). Names (people,
/// companies, addresses) are intentionally not covered here and must be
/// left as-is.
class RequestTranslations {
  static const Map<String, String> _type = {
    'Sell': 'بيع',
    'Purchasing': 'شراء',
    'Rent_in': 'استئجار',
    'Rent_out': 'تأجير',
  };

  static const Map<String, String> _status = {
    'new': 'جديد',
    'in_processing': 'قيد المعالجة',
    'finished': 'مكتمل',
  };

  static const Map<String, String> _specializationScope = {
    'Purchase Sell Outside Compound': 'شراء/بيع خارج الكمبوند',
    'Primary Inside Compound': 'برايمرى داخل كمبوند',
    'Resale Inside Compound': 'ريسيل داخل كمبوند',
    'Rentals Outside Compound': 'ايجارات خارج كمبوند',
    'Rentals Inside Compound': 'ايجارات داخل كمبوند',
  };

  static const Map<String, String> _unit = {
    'Apartments': 'شقق',
    'Pharmacies': 'صيدليات',
    'Duplexes': 'دوبلكس',
    'Vacation_villa': 'فيلا مصيف',
    'I_villa': 'اي فيلا',
    'Warehouse_lands': 'أراضي مخازن',
    'Factory_lands': 'أراضي مصانع',
    'Commercial_administrative_buildings': 'مباني تجارية إدارية',
    'Commercial_stores': 'محلات تجارية',
    'Medical_clinics': 'عيادات طبية',
    'Administrative_units': 'وحدات إدارية',
    'Villas': 'فيلات',
    'Town_houses': 'تاون هاوس',
    'Twin_houses': 'توين هاوس',
    'Standalone_villas': 'فيلات مستقلة',
    'Residential_buildings': 'مباني سكنية',
    'Chalets': 'شاليهات',
    'Hotels': 'فنادق',
    'Basements': 'بيزمنت',
    'Roofs': 'أدوار روف',
    'Studios': 'استوديو',
    'Penthouses': 'بنت هاوس',
    'Residential_lands': 'أراضي سكنية',
    'Commercial_administrative_lands': 'أراضي تجارية إدارية',
  };

  static String type(dynamic raw) => _lookup(_type, raw);

  static String status(dynamic raw) => _lookup(_status, raw);

  static String specializationScope(dynamic raw) =>
      _lookup(_specializationScope, raw);

  static String unit(dynamic raw) => _lookup(_unit, raw);

  /// Builds a display title ("بيع شقق") from the raw type + unit instead of
  /// relying on the raw combined English title string from the API.
  static String title(dynamic rawType, dynamic rawUnit) {
    return '${type(rawType)} ${unit(rawUnit)}'.trim();
  }

  static String _lookup(Map<String, String> map, dynamic raw) {
    if (raw == null) return '';
    final key = raw.toString();
    return map[key] ?? key;
  }
}
