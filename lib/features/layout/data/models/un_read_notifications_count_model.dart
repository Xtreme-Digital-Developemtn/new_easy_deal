class UnReadNotificationsCountModel {
  String? status;
  String? message;
  Data? data;

  UnReadNotificationsCountModel({this.status, this.message, this.data});

  UnReadNotificationsCountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? unreadCount;

  Data({this.unreadCount});

  Data.fromJson(Map<String, dynamic> json) {
    unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unread_count'] = this.unreadCount;
    return data;
  }
}
