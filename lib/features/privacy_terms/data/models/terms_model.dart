
class TermsModel {
  String? status;
  String? message;
  Data? data;

  TermsModel({this.status, this.message, this.data});

  TermsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? type;
  String? content;
  dynamic updatedAt;

  Data({this.type, this.content, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    content = json["content"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["content"] = content;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}