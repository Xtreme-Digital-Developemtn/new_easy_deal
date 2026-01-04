
class AreasModel {
  String? status;
  String? message;
  List<Areas>? data;
  int? count;

  AreasModel({this.status, this.message, this.data, this.count});

  AreasModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Areas.fromJson(e)).toList();
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

class Areas {
  int? id;
  String? nameEn;
  String? nameAr;
  dynamic cityId;
  String? createdAt;
  String? updatedAt;

  Areas({this.id, this.nameEn, this.nameAr, this.cityId, this.createdAt, this.updatedAt});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameEn = json["name_en"];
    nameAr = json["name_ar"];
    cityId = json["city_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    _data["city_id"] = cityId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}