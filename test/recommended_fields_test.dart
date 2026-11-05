import 'package:easy_deal/features/request_details/data/config/recommended_fields.dart';
import 'package:easy_deal/features/request_details/data/models/recommended_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('بيلاقي المفتاح في الـjson وجوه additionalDetails وبالـsnake_case', () {
    final json = <String, dynamic>{
      'unitArea': 150,
      'additionalDetails': {
        'legal_status': 'registered',
        'numberOfFloors': 4,
      },
    };

    expect(RecommendedFields.rawValue(json, 'unitArea'), 150);
    expect(RecommendedFields.rawValue(json, 'legalStatus'), 'registered');
    expect(RecommendedFields.rawValue(json, 'numberOfFloors'), 4);
    expect(RecommendedFields.rawValue(json, 'mallName'), isNull);
  });

  test('الموديل بيحتفظ بالـjson الأصلي كله', () {
    final item = RecommendedData.fromJson({
      'id': 7,
      'modelCode': 'ED-7',
      // حقل مش معرّف في الموديل بالاسم، ولازم يفضل متاح للعرض
      'mallName': 'سيتي ستارز',
    });

    expect(item.id, 7);
    expect(RecommendedFields.rawValue(item.raw, 'mallName'), 'سيتي ستارز');
  });

  test('أهم الحقول عشرة وكلها ليها أسماء عربية', () {
    expect(RecommendedFields.highlights.length, 10);
    for (final field in RecommendedFields.highlights) {
      expect(field.label.trim(), isNotEmpty);
      expect(field.key.trim(), isNotEmpty);
    }
  });

  test('مفيش حقل مكرر في نفس المجموعة', () {
    for (final group in RecommendedFields.groups) {
      final keys = group.fields.map((f) => f.key).toList();
      expect(keys.toSet().length, keys.length, reason: group.title);
    }
  });
}
