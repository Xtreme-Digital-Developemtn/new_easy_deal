
class UnitPublishAsAdModel {
  String? status;
  String? message;
  Data? data;

  UnitPublishAsAdModel({this.status, this.message, this.data});

  UnitPublishAsAdModel.fromJson(Map<String, dynamic> json) {
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
  dynamic modelCode;
  String? type;
  int? unitArea;
  String? buildingNumber;
  String? unitNumber;
  String? floor;
  Area? area;
  City? city;
  SubArea? subArea;
  List<dynamic>? otherSubAreas;
  String? ownerPhone;
  String? ownerName;
  String? detailedAddress;
  int? dailyRent;
  int? monthlyRent;
  String? deliveryStatus;
  int? numberOfRooms;
  int? numberOfBathrooms;
  String? finishingType;
  String? unitOperation;
  String? compoundType;
  String? status;
  String? view;
  String? deliveryDate;
  dynamic diagram;
  dynamic locationInMasterPlan;
  dynamic location;
  String? paymentSystem;
  int? pricePerMeterInInstallment;
  int? pricePerMeterInCash;
  int? totalPriceInInstallment;
  int? totalPriceInCash;
  List<Advertisers>? advertisers;
  int? isArchived;
  AdditionalDetails? additionalDetails;
  List<String>? otherAccessories;
  dynamic modelId;
  int? brokerId;
  Broker? broker;
  dynamic brokerUserId;
  dynamic brokerUserFullName;
  dynamic brokerUserEmail;
  dynamic brokerUserPhone;
  dynamic brokerUserImage;
  dynamic projectName;
  dynamic developerName;
  dynamic project;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? gallery;
  List<dynamic>? replyLog;

  Data({this.id, this.modelCode, this.type, this.unitArea, this.buildingNumber, this.unitNumber, this.floor, this.area, this.city, this.subArea, this.otherSubAreas, this.ownerPhone, this.ownerName, this.detailedAddress, this.dailyRent, this.monthlyRent, this.deliveryStatus, this.numberOfRooms, this.numberOfBathrooms, this.finishingType, this.unitOperation, this.compoundType, this.status, this.view, this.deliveryDate, this.diagram, this.locationInMasterPlan, this.location, this.paymentSystem, this.pricePerMeterInInstallment, this.pricePerMeterInCash, this.totalPriceInInstallment, this.totalPriceInCash, this.advertisers, this.isArchived, this.additionalDetails, this.otherAccessories, this.modelId, this.brokerId, this.broker, this.brokerUserId, this.brokerUserFullName, this.brokerUserEmail, this.brokerUserPhone, this.brokerUserImage, this.projectName, this.developerName, this.project, this.createdAt, this.updatedAt, this.gallery, this.replyLog});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    modelCode = json["modelCode"];
    type = json["type"];
    unitArea = json["unitArea"];
    buildingNumber = json["buildingNumber"];
    unitNumber = json["unitNumber"];
    floor = json["floor"];
    area = json["area"] == null ? null : Area.fromJson(json["area"]);
    city = json["city"] == null ? null : City.fromJson(json["city"]);
    subArea = json["subArea"] == null ? null : SubArea.fromJson(json["subArea"]);
    otherSubAreas = json["otherSubAreas"] ?? [];
    ownerPhone = json["ownerPhone"];
    ownerName = json["ownerName"];
    detailedAddress = json["detailedAddress"];
    dailyRent = json["dailyRent"];
    monthlyRent = json["monthlyRent"];
    deliveryStatus = json["deliveryStatus"];
    numberOfRooms = json["numberOfRooms"];
    numberOfBathrooms = json["numberOfBathrooms"];
    finishingType = json["finishingType"];
    unitOperation = json["unitOperation"];
    compoundType = json["compoundType"];
    status = json["status"];
    view = json["view"];
    deliveryDate = json["deliveryDate"];
    diagram = json["diagram"];
    locationInMasterPlan = json["locationInMasterPlan"];
    location = json["location"];
    paymentSystem = json["paymentSystem"];
    pricePerMeterInInstallment = json["pricePerMeterInInstallment"];
    pricePerMeterInCash = json["pricePerMeterInCash"];
    totalPriceInInstallment = json["totalPriceInInstallment"];
    totalPriceInCash = json["totalPriceInCash"];
    advertisers = json["advertisers"] == null ? null : (json["advertisers"] as List).map((e) => Advertisers.fromJson(e)).toList();
    isArchived = json["isArchived"];
    additionalDetails = json["additionalDetails"] == null ? null : AdditionalDetails.fromJson(json["additionalDetails"]);
    otherAccessories = json["otherAccessories"] == null ? null : List<String>.from(json["otherAccessories"]);
    modelId = json["modelId"];
    brokerId = json["brokerId"];
    broker = json["broker"] == null ? null : Broker.fromJson(json["broker"]);
    brokerUserId = json["broker_user_id"];
    brokerUserFullName = json["broker_user_full_name"];
    brokerUserEmail = json["broker_user_email"];
    brokerUserPhone = json["broker_user_phone"];
    brokerUserImage = json["broker_user_image"];
    projectName = json["projectName"];
    developerName = json["developerName"];
    project = json["project"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    gallery = json["gallery"] ?? [];
    replyLog = json["replyLog"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["modelCode"] = modelCode;
    _data["type"] = type;
    _data["unitArea"] = unitArea;
    _data["buildingNumber"] = buildingNumber;
    _data["unitNumber"] = unitNumber;
    _data["floor"] = floor;
    if(area != null) {
      _data["area"] = area?.toJson();
    }
    if(city != null) {
      _data["city"] = city?.toJson();
    }
    if(subArea != null) {
      _data["subArea"] = subArea?.toJson();
    }
    if(otherSubAreas != null) {
      _data["otherSubAreas"] = otherSubAreas;
    }
    _data["ownerPhone"] = ownerPhone;
    _data["ownerName"] = ownerName;
    _data["detailedAddress"] = detailedAddress;
    _data["dailyRent"] = dailyRent;
    _data["monthlyRent"] = monthlyRent;
    _data["deliveryStatus"] = deliveryStatus;
    _data["numberOfRooms"] = numberOfRooms;
    _data["numberOfBathrooms"] = numberOfBathrooms;
    _data["finishingType"] = finishingType;
    _data["unitOperation"] = unitOperation;
    _data["compoundType"] = compoundType;
    _data["status"] = status;
    _data["view"] = view;
    _data["deliveryDate"] = deliveryDate;
    _data["diagram"] = diagram;
    _data["locationInMasterPlan"] = locationInMasterPlan;
    _data["location"] = location;
    _data["paymentSystem"] = paymentSystem;
    _data["pricePerMeterInInstallment"] = pricePerMeterInInstallment;
    _data["pricePerMeterInCash"] = pricePerMeterInCash;
    _data["totalPriceInInstallment"] = totalPriceInInstallment;
    _data["totalPriceInCash"] = totalPriceInCash;
    if(advertisers != null) {
      _data["advertisers"] = advertisers?.map((e) => e.toJson()).toList();
    }
    _data["isArchived"] = isArchived;
    if(additionalDetails != null) {
      _data["additionalDetails"] = additionalDetails?.toJson();
    }
    if(otherAccessories != null) {
      _data["otherAccessories"] = otherAccessories;
    }
    _data["modelId"] = modelId;
    _data["brokerId"] = brokerId;
    if(broker != null) {
      _data["broker"] = broker?.toJson();
    }
    _data["broker_user_id"] = brokerUserId;
    _data["broker_user_full_name"] = brokerUserFullName;
    _data["broker_user_email"] = brokerUserEmail;
    _data["broker_user_phone"] = brokerUserPhone;
    _data["broker_user_image"] = brokerUserImage;
    _data["projectName"] = projectName;
    _data["developerName"] = developerName;
    _data["project"] = project;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    if(gallery != null) {
      _data["gallery"] = gallery;
    }
    if(replyLog != null) {
      _data["replyLog"] = replyLog;
    }
    return _data;
  }
}

class Broker {
  int? id;
  String? name;
  String? phone;

  Broker({this.id, this.name, this.phone});

  Broker.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["phone"] = phone;
    return _data;
  }
}

class AdditionalDetails {
  int? groundArea;
  int? buildingArea;
  String? activity;
  String? fitOutCondition;
  String? furnishingStatus;
  String? groundLayoutStatus;
  String? unitDesign;
  String? unitFacing;
  String? legalStatus;

  AdditionalDetails({this.groundArea, this.buildingArea, this.activity, this.fitOutCondition, this.furnishingStatus, this.groundLayoutStatus, this.unitDesign, this.unitFacing, this.legalStatus});

  AdditionalDetails.fromJson(Map<String, dynamic> json) {
    groundArea = json["ground_area"];
    buildingArea = json["building_area"];
    activity = json["activity"];
    fitOutCondition = json["fit_out_condition"];
    furnishingStatus = json["furnishing_status"];
    groundLayoutStatus = json["ground_layout_status"];
    unitDesign = json["unit_design"];
    unitFacing = json["unit_facing"];
    legalStatus = json["legal_status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ground_area"] = groundArea;
    _data["building_area"] = buildingArea;
    _data["activity"] = activity;
    _data["fit_out_condition"] = fitOutCondition;
    _data["furnishing_status"] = furnishingStatus;
    _data["ground_layout_status"] = groundLayoutStatus;
    _data["unit_design"] = unitDesign;
    _data["unit_facing"] = unitFacing;
    _data["legal_status"] = legalStatus;
    return _data;
  }
}

class Advertisers {
  String? caption;
  int? creatorId;
  int? advertiserId;
  String? advertiserFullName;
  dynamic advertiserEmail;
  String? advertiserPhone;
  String? createdAt;

  Advertisers({this.caption, this.creatorId, this.advertiserId, this.advertiserFullName, this.advertiserEmail, this.advertiserPhone, this.createdAt});

  Advertisers.fromJson(Map<String, dynamic> json) {
    caption = json["caption"];
    creatorId = json["creatorId"];
    advertiserId = json["advertiserId"];
    advertiserFullName = json["advertiserFullName"];
    advertiserEmail = json["advertiserEmail"];
    advertiserPhone = json["advertiserPhone"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["caption"] = caption;
    _data["creatorId"] = creatorId;
    _data["advertiserId"] = advertiserId;
    _data["advertiserFullName"] = advertiserFullName;
    _data["advertiserEmail"] = advertiserEmail;
    _data["advertiserPhone"] = advertiserPhone;
    _data["createdAt"] = createdAt;
    return _data;
  }
}

class SubArea {
  int? id;
  String? nameEn;
  String? nameAr;
  int? areaId;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    _data["area_id"] = areaId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class City {
  int? id;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;

  City({this.id, this.nameEn, this.nameAr, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameEn = json["name_en"];
    nameAr = json["name_ar"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Area {
  int? id;
  String? nameEn;
  String? nameAr;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  Area({this.id, this.nameEn, this.nameAr, this.cityId, this.createdAt, this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
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