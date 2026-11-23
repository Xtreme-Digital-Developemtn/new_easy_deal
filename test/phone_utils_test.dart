import 'package:easy_deal/core/utils/phone/phone_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhoneUtils.parse', () {
    test('رقم مصري بصفر البداية بيتحول لرقم محلي 10 أرقام', () {
      final parsed = PhoneUtils.parse('01012345678');
      expect(parsed.isoCode, 'EG');
      expect(parsed.dialCode, '20');
      expect(parsed.local, '1012345678');
      expect(parsed.apiValue, '01012345678');
    });

    test('رقم مصري بكود الدولة', () {
      final parsed = PhoneUtils.parse('+201012345678');
      expect(parsed.isoCode, 'EG');
      expect(parsed.local, '1012345678');
      expect(parsed.apiValue, '01012345678');
    });

    test('رقم بصيغة 00 ومسافات وشرطات', () {
      final parsed = PhoneUtils.parse('0020 101-234-5678');
      expect(parsed.isoCode, 'EG');
      expect(parsed.local, '1012345678');
    });

    test('رقم سعودي بيحدد الدولة الصح', () {
      final parsed = PhoneUtils.parse('+966512345678');
      expect(parsed.isoCode, 'SA');
      expect(parsed.dialCode, '966');
      expect(parsed.local, '512345678');
      expect(parsed.apiValue, '+966512345678');
    });

    test('فاضي بيرجع الدولة الافتراضية ورقم فاضي', () {
      final parsed = PhoneUtils.parse(null);
      expect(parsed.isoCode, 'EG');
      expect(parsed.local, '');
    });

    test('toApiValue بيبني الشكل المطلوب', () {
      expect(
        PhoneUtils.toApiValue(dialCode: '20', local: '1012345678'),
        '01012345678',
      );
      expect(
        PhoneUtils.toApiValue(dialCode: '971', local: '512345678'),
        '+971512345678',
      );
    });
  });
}
