class DevelopersModel {
  String? status;
  String? message;
  List<DeveloperData>? data;
  int? count;

  DevelopersModel({this.status, this.message, this.data, this.count});

  DevelopersModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => DeveloperData.fromJson(e)).toList();
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

class DeveloperData {
  int? developerId;
  dynamic contractDuration;
  dynamic contractStartDate;
  dynamic contractEndDate;
  int? numberOfProjects;
  String? phone;
  bool? isActive;
  bool? isVerified;
  String? image;
  String? role;
  int? userId;
  String? fullName;
  String? email;
  List<BrokerMap>? brokers;

  DeveloperData({
    this.developerId,
    this.contractDuration,
    this.contractStartDate,
    this.contractEndDate,
    this.numberOfProjects,
    this.phone,
    this.isActive,
    this.isVerified,
    this.image,
    this.role,
    this.userId,
    this.fullName,
    this.email,
    this.brokers,
  });

  DeveloperData.fromJson(Map<String, dynamic> json) {
    developerId = json["developerId"];
    contractDuration = json["contractDuration"];
    contractStartDate = json["contractStartDate"];
    contractEndDate = json["contractEndDate"];
    numberOfProjects = json["numberOfProjects"];
    phone = json["phone"];
    isActive = json["isActive"];
    isVerified = json["isVerified"];
    image = json["image"];
    role = json["role"];
    userId = json["userId"];
    fullName = json["fullName"];
    email = json["email"];
    brokers = json["brokers"] == null ? null : (json["brokers"] as List).map((e) => BrokerMap.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["developerId"] = developerId;
    _data["contractDuration"] = contractDuration;
    _data["contractStartDate"] = contractStartDate;
    _data["contractEndDate"] = contractEndDate;
    _data["numberOfProjects"] = numberOfProjects;
    _data["phone"] = phone;
    _data["isActive"] = isActive;
    _data["isVerified"] = isVerified;
    _data["image"] = image;
    _data["role"] = role;
    _data["userId"] = userId;
    _data["fullName"] = fullName;
    _data["email"] = email;
    if(brokers != null) {
      _data["brokers"] = brokers?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class BrokerMap {
  int? brokerId;
  int? developerId;
  String? status;

  BrokerMap({this.brokerId, this.developerId, this.status});

  BrokerMap.fromJson(Map<String, dynamic> json) {
    brokerId = json["brokerId"];
    developerId = json["developerId"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["brokerId"] = brokerId;
    _data["developerId"] = developerId;
    _data["status"] = status;
    return _data;
  }
}