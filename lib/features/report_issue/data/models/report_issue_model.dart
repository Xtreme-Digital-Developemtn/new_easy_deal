
class ReportIssueModel {
  String? status;
  String? message;
  Data? data;
  int? count;

  ReportIssueModel({this.status, this.message, this.data, this.count});

  ReportIssueModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["count"] = count;
    return _data;
  }
}

class Data {
  String? type;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? contactEmail;
  String? contactPhone;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({this.type, this.titleAr, this.titleEn, this.descriptionAr, this.descriptionEn, this.contactEmail, this.contactPhone, this.updatedAt, this.createdAt, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
    descriptionAr = json["description_ar"];
    descriptionEn = json["description_en"];
    contactEmail = json["contact_email"];
    contactPhone = json["contact_phone"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["description_ar"] = descriptionAr;
    _data["description_en"] = descriptionEn;
    _data["contact_email"] = contactEmail;
    _data["contact_phone"] = contactPhone;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}