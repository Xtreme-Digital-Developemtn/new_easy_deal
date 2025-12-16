
class LogoutModel {
  String? status;
  String? message;
  List<dynamic>? data;

  LogoutModel({this.status, this.message, this.data});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}