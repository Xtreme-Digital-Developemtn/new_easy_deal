
class LoginModel {
  String? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? fullName;
  String? email;
  String? phone;
  bool? isActive;
  bool? isVerified;
  String? image;
  String? role;
  List<String>? permissions;
  dynamic parentId;
  String? authToken;
  String? gender;

  Data({this.id, this.fullName, this.email, this.phone, this.isActive, this.isVerified, this.image, this.role, this.permissions, this.parentId, this.authToken, this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullName = json["fullName"];
    email = json["email"];
    phone = json["phone"];
    isActive = json["isActive"];
    isVerified = json["isVerified"];
    image = json["image"];
    role = json["role"];
    permissions = json["permissions"] == null ? null : List<String>.from(json["permissions"]);
    parentId = json["parentId"];
    authToken = json["authToken"];
    gender = json["gender"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["isActive"] = isActive;
    _data["isVerified"] = isVerified;
    _data["image"] = image;
    _data["role"] = role;
    if(permissions != null) {
      _data["permissions"] = permissions;
    }
    _data["parentId"] = parentId;
    _data["authToken"] = authToken;
    _data["gender"] = gender;
    return _data;
  }
}