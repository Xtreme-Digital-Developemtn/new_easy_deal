class BrokerMapsModel {
  String? status;
  String? message;
  List<MapLocationData>? data;
  int? count;

  BrokerMapsModel({this.status, this.message, this.data, this.count});

  BrokerMapsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    var innerData = json["data"];
    if (innerData != null) {
      data = (innerData["data"] as List?)?.map((e) => MapLocationData.fromJson(e)).toList();
      count = innerData["count"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["data"] = {
      "data": data?.map((e) => e.toJson()).toList(),
      "count": count,
    };
    return _data;
  }
}

class MapLocationData {
  int? id;
  String? name;
  String? image;
  double? latitude;
  double? longitude;
  String? address;
  String? category;
  String? description;
  String? createdAt;
  String? updatedAt;

  MapLocationData({
    this.id,
    this.name,
    this.image,
    this.latitude,
    this.longitude,
    this.address,
    this.category,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  MapLocationData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"] ?? json["title"];
    image = json["image"] ?? json["imageUrl"];
    latitude = (json["latitude"] as num?)?.toDouble();
    longitude = (json["longitude"] as num?)?.toDouble();
    address = json["address"] ?? json["location"];
    category = json["category"] ?? json["type"];
    description = json["description"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["address"] = address;
    _data["category"] = category;
    _data["description"] = description;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}