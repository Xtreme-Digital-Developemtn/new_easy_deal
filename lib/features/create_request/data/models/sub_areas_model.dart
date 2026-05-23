class SubAreasModel {
  String? status;
  String? message;
  List<SubArea>? data;
  int? count;

  SubAreasModel({this.status, this.message, this.data, this.count});

  SubAreasModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => SubArea.fromJson(e)).toList();
    count = json["count"];
  }
}

class SubArea {
  int? id;
  String? nameEn;
  String? nameAr;
  dynamic areaId;
  String? createdAt;
  String? updatedAt;

  SubArea({this.id, this.nameEn, this.nameAr, this.areaId, this.createdAt, this.updatedAt});

  SubArea.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameEn = json["name_en"];
    nameAr = json["name_ar"];
    areaId = json["area_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }
}
