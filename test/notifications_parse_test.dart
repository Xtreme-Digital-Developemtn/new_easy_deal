import 'package:easy_deal/features/notifications/data/models/notifications_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('يقرأ request_id من data عشان يفتح تفاصيل الطلب', () {
    final model = NotificationsModel.fromJson({
      'message': 'Notifications retrieved successfully.',
      'data': [
        {
          'id': 1,
          'title': 'طلب جديد',
          'is_read': false,
          'data': {'request_id': 70, 'sender_name': 'Moh Elarbi'},
        },
      ],
    });

    final item = model.data!.first;
    expect(item.requestId, 70);
    expect(item.data!.senderName, 'Moh Elarbi');
  });

  test('بياخد الـid لو جه نص أو الـdata جت نص JSON', () {
    final asText = NotificationItem.fromJson({
      'data': {'request_id': '70'},
    });
    expect(asText.requestId, 70);

    final asJsonString = NotificationItem.fromJson({
      'data': '{"request_id": 70, "sender_name": "Moh"}',
    });
    expect(asJsonString.requestId, 70);
    expect(asJsonString.data!.senderName, 'Moh');
  });

  test('الإشعار اللي مفيهوش طلب بيرجّع null بدل ما يكسر الليستة', () {
    expect(NotificationItem.fromJson({'data': null}).requestId, isNull);
    expect(NotificationItem.fromJson({'data': 'مش JSON'}).requestId, isNull);
    expect(NotificationItem.fromJson({'data': {'sender_name': 'Moh'}}).requestId, isNull);
  });

  test('is_read بيشتغل مع true/false و 0/1', () {
    expect(NotificationItem.fromJson({'is_read': true}).isRead, isTrue);
    expect(NotificationItem.fromJson({'is_read': 1}).isRead, isTrue);
    expect(NotificationItem.fromJson({'is_read': 0}).isRead, isFalse);
    expect(NotificationItem.fromJson({}).isRead, isNull);
  });
}
