
class ContactUsModel {
  String? status;
  String? message;
  Data? data;

  ContactUsModel({this.status, this.message, this.data});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? phone;
  String? address;
  String? whatsapp;
  String? updatedAt;

  Data({this.email, this.phone, this.address, this.whatsapp, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    phone = json["phone"];
    address = json["address"];
    whatsapp = json["whatsapp"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["phone"] = phone;
    _data["address"] = address;
    _data["whatsapp"] = whatsapp;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}