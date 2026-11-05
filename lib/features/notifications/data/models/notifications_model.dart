import 'dart:convert';

class NotificationsModel {
  String? status;
  String? message;
  List<NotificationItem>? data;
  int? count;

  NotificationsModel({
    this.status,
    this.message,
    this.data,
    this.count,
  });

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(NotificationItem.fromJson(v));
      });
    }

    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json['status'] = status;
    json['message'] = message;

    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }

    json['count'] = count;

    return json;
  }
}

class NotificationItem {
  int? id;
  int? brokerId;
  String? type;
  String? title;
  String? body;
  NotificationData? data;
  bool? isRead;
  String? createdAt;
  String? updatedAt;

  NotificationItem({
    this.id,
    this.brokerId,
    this.type,
    this.title,
    this.body,
    this.data,
    this.isRead,
    this.createdAt,
    this.updatedAt,
  });

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brokerId = json['broker_id'];
    type = json['type'];
    title = json['title'];
    body = json['body'];

    data = _parseData(json['data']);

    // بعض الـresponses بترجّع 0/1 بدل true/false
    final rawIsRead = json['is_read'];
    isRead = rawIsRead is bool
        ? rawIsRead
        : rawIsRead == null
            ? null
            : rawIsRead.toString() == '1' || rawIsRead.toString() == 'true';

    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  /// رقم الطلب اللي الإشعار بيشاور عليه، أو null لو الإشعار مش مرتبط بطلب
  int? get requestId => data?.requestId;

  /// `data` بتجي Map في الأغلب، وساعات نص JSON من الـpush payload
  static NotificationData? _parseData(dynamic raw) {
    if (raw == null) return null;
    if (raw is Map) {
      return NotificationData.fromJson(Map<String, dynamic>.from(raw));
    }
    if (raw is String && raw.trim().isNotEmpty) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) {
          return NotificationData.fromJson(Map<String, dynamic>.from(decoded));
        }
      } catch (_) {
        // نص مش JSON - مش سبب نكسر الليستة كلها
      }
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json['id'] = id;
    json['broker_id'] = brokerId;
    json['type'] = type;
    json['title'] = title;
    json['body'] = body;

    if (data != null) {
      json['data'] = data!.toJson();
    }

    json['is_read'] = isRead;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;

    return json;
  }
}

class NotificationData {
  int? requestId;
  String? senderName;

  NotificationData({
    this.requestId,
    this.senderName,
  });

  NotificationData.fromJson(Map<String, dynamic> json) {
    // الـAPI بيرجّع الـid ساعات رقم وساعات نص ("70")
    requestId = _toInt(json['request_id'] ?? json['requestId']);
    senderName = json['sender_name']?.toString() ?? json['senderName']?.toString();
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString().trim());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json['request_id'] = requestId;
    json['sender_name'] = senderName;

    return json;
  }
}