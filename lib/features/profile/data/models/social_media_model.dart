
class SocialMediaModel {
  String? status;
  String? message;
  Data? data;

  SocialMediaModel({this.status, this.message, this.data});

  SocialMediaModel.fromJson(Map<String, dynamic> json) {
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
  String? facebook;
  String? twitter;
  String? instagram;
  String? linkedin;
  dynamic updatedAt;

  Data({this.facebook, this.twitter, this.instagram, this.linkedin, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    facebook = json["facebook"];
    twitter = json["twitter"];
    instagram = json["instagram"];
    linkedin = json["linkedin"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["facebook"] = facebook;
    _data["twitter"] = twitter;
    _data["instagram"] = instagram;
    _data["linkedin"] = linkedin;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}