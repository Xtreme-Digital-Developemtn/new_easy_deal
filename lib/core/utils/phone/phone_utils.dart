import 'package:intl_phone_field/countries.dart';

/// بيانات الرقم بعد تفكيكه: كود الدولة ISO (EG) + كود الاتصال (20) + الرقم المحلي.
class ParsedPhone {
  const ParsedPhone({
    required this.isoCode,
    required this.dialCode,
    required this.local,
  });

  final String isoCode;
  final String dialCode;
  final String local;

  /// الشكل اللي الباك اند بيستقبله: مصر بصفر البداية (زي التسجيل والدخول)،
  /// وأي دولة تانية بالشكل الدولي الكامل.
  String get apiValue =>
      dialCode == '20' ? '0$local' : '+$dialCode$local';
}

class PhoneUtils {
  const PhoneUtils._();

  static const String defaultIsoCode = 'EG';
  static const String defaultDialCode = '20';

  /// بتفكّك أي شكل محفوظ للرقم (01012345678 أو +201012345678 أو 00201012345678
  /// أو بمسافات وشرطات) لكود الدولة والرقم المحلي، عشان حقل الهاتف يتعمّر صح
  /// ومينفعش يفضل عامل خطأ "رقم غير صالح" وهو أصلاً رقم المستخدم.
  static ParsedPhone parse(String? raw, {String defaultIso = defaultIsoCode}) {
    final fallback = _countryByIso(defaultIso);

    var value = (raw ?? '').replaceAll(RegExp(r'[^\d+]'), '');
    if (value.isEmpty) {
      return ParsedPhone(
        isoCode: fallback.code,
        dialCode: fallback.dialCode,
        local: '',
      );
    }

    if (value.startsWith('00')) {
      value = '+${value.substring(2)}';
    }

    if (value.startsWith('+')) {
      final digits = value.substring(1);
      // الأطول الأول، عشان كود زي 1242 ميتلغبطش مع 1.
      final sorted = countries.toList()
        ..sort((a, b) => (b.dialCode + b.regionCode)
            .length
            .compareTo((a.dialCode + a.regionCode).length));
      for (final country in sorted) {
        final code = country.dialCode + country.regionCode;
        if (digits.startsWith(code)) {
          return ParsedPhone(
            isoCode: country.code,
            dialCode: country.dialCode,
            local: _stripTrunkZero(digits.substring(code.length), country),
          );
        }
      }
      return ParsedPhone(
        isoCode: fallback.code,
        dialCode: fallback.dialCode,
        local: _stripTrunkZero(digits, fallback),
      );
    }

    // رقم محلي من غير كود دولة: بنعتبره تابع للدولة الافتراضية.
    return ParsedPhone(
      isoCode: fallback.code,
      dialCode: fallback.dialCode,
      local: _stripTrunkZero(value, fallback),
    );
  }

  /// الشكل اللي بيتبعت للباك اند لرقم محلي + كود دولة.
  static String toApiValue({required String dialCode, required String local}) =>
      ParsedPhone(isoCode: '', dialCode: dialCode, local: local).apiValue;

  /// شيل صفر البداية (trunk prefix) لو بيخلي الرقم أطول من طول الدولة.
  static String _stripTrunkZero(String local, Country country) {
    var value = local;
    while (value.startsWith('0') && value.length > country.maxLength) {
      value = value.substring(1);
    }
    return value;
  }

  static Country _countryByIso(String iso) => countries.firstWhere(
        (c) => c.code == iso,
        orElse: () => countries.firstWhere((c) => c.code == defaultIsoCode),
      );
}
