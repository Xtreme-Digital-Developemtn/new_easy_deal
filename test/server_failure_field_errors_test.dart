import 'package:easy_deal/core/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServerFailure.fromResponse', () {
    test('بتاخد رسالة الحقل من errors بدل الرسالة العامة', () {
      final failure = ServerFailure.fromResponse(422, {
        "message": "The given data was invalid.",
        "errors": {
          "phone": ["رقم الهاتف مستخدم بالفعل من قبل حساب آخر"],
        },
      });
      expect(failure.errMessage, 'رقم الهاتف مستخدم بالفعل من قبل حساب آخر');
    });

    test('بترجع message لو مفيش errors', () {
      final failure = ServerFailure.fromResponse(422, {
        "message": "رسالة من السيرفر",
      });
      expect(failure.errMessage, 'رسالة من السيرفر');
    });

    test('errors بشكل غير متوقع مبتكسرش الاستخراج', () {
      final failure = ServerFailure.fromResponse(422, {
        "message": "رسالة من السيرفر",
        "errors": ["مش ماب"],
      });
      expect(failure.errMessage, 'رسالة من السيرفر');
    });
  });
}
