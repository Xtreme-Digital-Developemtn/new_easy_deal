
class RequestsCheckAdvertisementCountModel {
  bool? success;
  Data? data;

  RequestsCheckAdvertisementCountModel({this.success, this.data});

  RequestsCheckAdvertisementCountModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? brokerId;
  int? currentAdvertisementCount;
  int? maxAdvertisements;
  bool? canCreateAdvertisement;
  int? remainingAdvertisements;

  Data({this.brokerId, this.currentAdvertisementCount, this.maxAdvertisements, this.canCreateAdvertisement, this.remainingAdvertisements});

  Data.fromJson(Map<String, dynamic> json) {
    brokerId = json["broker_id"];
    currentAdvertisementCount = json["current_advertisement_count"];
    maxAdvertisements = json["max_advertisements"];
    canCreateAdvertisement = json["can_create_advertisement"];
    remainingAdvertisements = json["remaining_advertisements"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["broker_id"] = brokerId;
    _data["current_advertisement_count"] = currentAdvertisementCount;
    _data["max_advertisements"] = maxAdvertisements;
    _data["can_create_advertisement"] = canCreateAdvertisement;
    _data["remaining_advertisements"] = remainingAdvertisements;
    return _data;
  }
}