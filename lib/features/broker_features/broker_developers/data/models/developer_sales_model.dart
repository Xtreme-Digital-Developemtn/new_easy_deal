
class DeveloperSalesModel {
  String? status;
  String? message;
  List<Data>? data;
  int? count;

  DeveloperSalesModel({this.status, this.message, this.data, this.count});

  DeveloperSalesModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["count"] = count;
    return _data;
  }
}

class Data {
  int? id;
  int? developerId;
  int? projectId;
  String? name;
  dynamic email;
  String? phone;
  String? whatsappPhone;
  Project? project;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.developerId, this.projectId, this.name, this.email, this.phone, this.whatsappPhone, this.project, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    developerId = json["developer_id"];
    projectId = json["project_id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    whatsappPhone = json["whatsapp_phone"];
    project = json["project"] == null ? null : Project.fromJson(json["project"]);
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["developer_id"] = developerId;
    _data["project_id"] = projectId;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["whatsapp_phone"] = whatsappPhone;
    if(project != null) {
      _data["project"] = project?.toJson();
    }
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Project {
  int? id;
  String? name;

  Project({this.id, this.name});

  Project.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}