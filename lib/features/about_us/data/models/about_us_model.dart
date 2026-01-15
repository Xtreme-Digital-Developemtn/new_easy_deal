
class AboutUsModel {
  String? status;
  String? message;
  Data? data;

  AboutUsModel({this.status, this.message, this.data});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
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
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? missionAr;
  String? missionEn;
  String? visionAr;
  String? visionEn;
  String? valuesAr;
  String? valuesEn;
  String? historyAr;
  String? historyEn;
  String? teamDescriptionAr;
  String? teamDescriptionEn;
  bool? isActive;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.titleAr, this.titleEn, this.descriptionAr, this.descriptionEn, this.missionAr, this.missionEn, this.visionAr, this.visionEn, this.valuesAr, this.valuesEn, this.historyAr, this.historyEn, this.teamDescriptionAr, this.teamDescriptionEn, this.isActive, this.sortOrder, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
    descriptionAr = json["description_ar"];
    descriptionEn = json["description_en"];
    missionAr = json["mission_ar"];
    missionEn = json["mission_en"];
    visionAr = json["vision_ar"];
    visionEn = json["vision_en"];
    valuesAr = json["values_ar"];
    valuesEn = json["values_en"];
    historyAr = json["history_ar"];
    historyEn = json["history_en"];
    teamDescriptionAr = json["team_description_ar"];
    teamDescriptionEn = json["team_description_en"];
    isActive = json["is_active"];
    sortOrder = json["sort_order"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["description_ar"] = descriptionAr;
    _data["description_en"] = descriptionEn;
    _data["mission_ar"] = missionAr;
    _data["mission_en"] = missionEn;
    _data["vision_ar"] = visionAr;
    _data["vision_en"] = visionEn;
    _data["values_ar"] = valuesAr;
    _data["values_en"] = valuesEn;
    _data["history_ar"] = historyAr;
    _data["history_en"] = historyEn;
    _data["team_description_ar"] = teamDescriptionAr;
    _data["team_description_en"] = teamDescriptionEn;
    _data["is_active"] = isActive;
    _data["sort_order"] = sortOrder;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}