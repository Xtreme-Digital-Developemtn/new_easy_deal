class UpdateStatusModel {
  String? status;
  String? message;
  UpdateStatusData? data;

  UpdateStatusModel({this.status, this.message, this.data});

  UpdateStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] == null
        ? null
        : UpdateStatusData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['status'] = status;
    dataMap['message'] = message;
    if (data != null) {
      dataMap['data'] = data?.toJson();
    }
    return dataMap;
  }
}

class UpdateStatusData {
  int? id;
  String? status;

  UpdateStatusData({this.id, this.status});

  UpdateStatusData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['id'] = id;
    dataMap['status'] = status;
    return dataMap;
  }
}
