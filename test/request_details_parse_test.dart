import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('يقرأ الأرقام اللي جايه كـString من الـAPI', () {
    final model = RequestDetailsModel.fromJson({
      'status': 'success',
      'data': {
        'id': '496',
        'numberOfReplies': '4',
        'attributes': {
          'rooms': '3',
          'bathrooms': 2,
          'unitArea': '150.5',
          'unitPrice': '2500000',
          'floor': 3,
        },
      },
    });

    expect(model.data!.id, 496);
    expect(model.data!.numberOfReplies, 4);
    expect(model.data!.attributes!.rooms, 3);
    expect(model.data!.attributes!.bathrooms, 2);
    expect(model.data!.attributes!.unitArea, 150);
    expect(model.data!.attributes!.unitPrice, 2500000);
    expect(model.data!.attributes!.floor, '3');
  });

  test('ما يقعش لما الـobject الفاضي يرجع كـ[] بدل {}', () {
    final model = RequestDetailsModel.fromJson({
      'data': {
        'id': 1,
        'attributes': <dynamic>[],
        'user': <dynamic>[],
        'locations': <dynamic>[],
      },
    });

    expect(model.data!.attributes, isNull);
    expect(model.data!.user, isNull);
    expect(model.data!.locations, isEmpty);
  });

  test('يفلتر العناصر الغلط في otherAccessories و locations', () {
    final model = RequestDetailsModel.fromJson({
      'data': {
        'attributes': {
          'otherAccessories': ['مصعد', 12, null, 'جراج'],
        },
        'locations': [
          {'city': {'id': '5', 'name_ar': 'القاهرة'}, 'areas': ['مدينة نصر']},
          'سطر بايظ',
        ],
      },
    });

    expect(model.data!.attributes!.otherAccessories, ['مصعد', '12', 'جراج']);
    expect(model.data!.locations!.length, 1);
    expect(model.data!.locations!.first.city!.id, 5);
  });
}
