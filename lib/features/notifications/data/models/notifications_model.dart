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

    data = json['data'] != null
        ? NotificationData.fromJson(json['data'])
        : null;

    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    requestId = json['request_id'];
    senderName = json['sender_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    json['request_id'] = requestId;
    json['sender_name'] = senderName;

    return json;
  }
}