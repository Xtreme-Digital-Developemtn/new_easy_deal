import '../../../search/data/models/areas_model.dart';

class ClientProfileModel {
  String? status;
  String? message;
  Data? data;

  ClientProfileModel({this.status, this.message, this.data});

  ClientProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? brokerId;
  String? fullName;
  String? email;
  String? phone;
  bool? isActive;
  bool? isVerified;
  String? role;
  List<Areas>? areas;
  String? type;
  List<String>? permissions;
  dynamic parentId;
  dynamic gender;
  dynamic operationCount;
  dynamic advertisementCount;
  dynamic specializationsCount;
  dynamic specializationScopesCount;
  /// Images
  dynamic image;
  dynamic idFront;
  dynamic idBack;
  dynamic taxCardImage;
  dynamic commercialRegistryImage;

  Data({this.id, this.brokerId,this.fullName, this.email,
    this.phone, this.isActive, this.isVerified, this.image, this.role, this.type, this.permissions,
    this.parentId, this.gender,
    this.commercialRegistryImage, this.idFront,
    this.idBack, this.taxCardImage, this.areas,
    this.specializationScopesCount, this.specializationsCount,
    this.advertisementCount, this.operationCount,
  });


  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    brokerId = json["brokerId"];
    fullName = json["fullName"];
    email = json["email"];
    phone = json["phone"];
    isActive = json["isActive"];
    isVerified = json["isVerified"];
    image = json["image"];
    specializationScopesCount = json["specializationScopesCount"];
    specializationsCount = json["specializationsCount"];
    advertisementCount = json["advertisementCount"];
    operationCount = json["operationCount"];
    taxCardImage = json["taxCardImage"];
    idBack = json["idBack"];
    idFront = json["idFront"];
    commercialRegistryImage = json["commercialRegistryImage"];
    role = json["role"];
    type = json["type"];
    permissions = json["permissions"] == null ? null : List<String>.from(json["permissions"]);
    parentId = json["parentId"];
    gender = json["gender"];
    areas = json["areas"] == null
        ? null
        : (json["areas"] as List).map((e) => Areas.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["brokerId"] = brokerId;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["isActive"] = isActive;
    _data["isVerified"] = isVerified;
    _data["image"] = image;
    _data["specializationScopesCount"] = specializationScopesCount;
    _data["specializationsCount"] = specializationsCount;
    _data["advertisementCount"] = advertisementCount;
    _data["operationCount"] = operationCount;
    _data["commercialRegistryImage"] = commercialRegistryImage;
    _data["taxCardImage"] = taxCardImage;
    _data["idBack"] = idBack;
    _data["idFront"] = idFront;
    _data["role"] = role;
    if(permissions != null) {
      _data["permissions"] = permissions;
    }
    _data["parentId"] = parentId;
    _data["gender"] = gender;
    if (areas != null) {
      _data["areas"] = areas?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}