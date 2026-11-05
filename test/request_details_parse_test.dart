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

  test('يقرأ حالة التسليم من attributes.deliveryStatus', () {
    final model = RequestDetailsModel.fromJson({
      'data': {
        'attributes': {'deliveryStatus': 'immediate_delivery'},
      },
    });

    expect(model.data!.attributes!.deliveryStatus, 'immediate_delivery');

    final empty = RequestDetailsModel.fromJson({
      'data': {
        'attributes': {'deliveryStatus': '  '},
      },
    });

    expect(empty.data!.attributes!.deliveryStatus, isNull);
  });

  test('يقرأ مفاتيح الطلبات الحقيقية (مدى المساحة والسعر و bathRooms)', () {
    final model = RequestDetailsModel.fromJson({
      'data': {
        'attributes': {
          'unitAreaMin': '120',
          'unitAreaMax': 180.5,
          'bathRooms': '2',
          'averageUnitPriceMin': '1500000',
          'averageUnitPriceMax': 2500000,
          'paymentMethod': 'cash',
        },
      },
    });

    final attr = model.data!.attributes!;
    expect(attr.unitAreaMin, 120);
    expect(attr.unitAreaMax, 180.5);
    expect(attr.bathrooms, 2);
    expect(attr.averageUnitPriceMin, 1500000);
    expect(attr.averageUnitPriceMax, 2500000);
    expect(attr.paymentMethod, 'cash');
  });

  test('مفاتيح الوحدات القديمة لسه بتشتغل كـfallback', () {
    final model = RequestDetailsModel.fromJson({
      'data': {
        'attributes': {
          'unitArea': '150',
          'bathrooms': 3,
          'unitPrice': '900000',
          'unitPriceSuggestions': 950000,
        },
      },
    });

    final attr = model.data!.attributes!;
    expect(attr.unitAreaMin, 150);
    expect(attr.unitAreaMax, 150);
    expect(attr.bathrooms, 3);
    expect(attr.averageUnitPriceMin, 900000);
    expect(attr.averageUnitPriceMax, 950000);
  });
}
