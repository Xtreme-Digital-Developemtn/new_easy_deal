
class AllUnitsModel {
  String? status;
  String? message;
  List<Data>? data;
  int? count;

  AllUnitsModel({this.status, this.message, this.data, this.count});

  AllUnitsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic id;
  dynamic modelCode;
  dynamic type;
  dynamic unitArea;
  dynamic buildingNumber;
  dynamic unitNumber;
  dynamic floor;
  Area? area;
  City? city;
  SubArea? subArea;
  List<OtherSubAreas>? otherSubAreas;
  dynamic ownerPhone;
  dynamic ownerName;
  dynamic detailedAddress;
  dynamic dailyRent;
  dynamic monthlyRent;
  dynamic deliveryStatus;
  dynamic numberOfRooms;
  dynamic numberOfBathrooms;
  dynamic finishingType;
  dynamic unitOperation;
  dynamic compoundType;
  dynamic status;
  dynamic view;
  dynamic deliveryDate;
  dynamic diagram;
  dynamic locationInMasterPlan;
  dynamic location;
  dynamic paymentSystem;
  dynamic pricePerMeterInInstallment;
  dynamic pricePerMeterInCash;
  dynamic totalPriceInInstallment;
  dynamic totalPriceInCash;
  List<Advertisers>? advertisers;
  dynamic isArchived;
  AdditionalDetails? additionalDetails;
  List<dynamic>? otherAccessories;
  dynamic modelId;
  dynamic brokerId;
  Broker? broker;
  dynamic projectName;
  dynamic developerName;
  dynamic createdAt;
  dynamic updatedAt;
  List<dynamic>? gallery;

  Data({this.id, this.modelCode, this.type, this.unitArea, this.buildingNumber, this.unitNumber, this.floor, this.area, this.city, this.subArea, this.otherSubAreas, this.ownerPhone, this.ownerName, this.detailedAddress, this.dailyRent, this.monthlyRent, this.deliveryStatus, this.numberOfRooms, this.numberOfBathrooms, this.finishingType, this.unitOperation, this.compoundType, this.status, this.view, this.deliveryDate, this.diagram, this.locationInMasterPlan, this.location, this.paymentSystem, this.pricePerMeterInInstallment, this.pricePerMeterInCash, this.totalPriceInInstallment, this.totalPriceInCash, this.advertisers, this.isArchived, this.additionalDetails, this.otherAccessories, this.modelId, this.brokerId, this.broker, this.projectName, this.developerName, this.createdAt, this.updatedAt, this.gallery});

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
    otherSubAreas = json["otherSubAreas"] == null ? null : (json["otherSubAreas"] as List).map((e) => OtherSubAreas.fromJson(e)).toList();
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
    projectName = json["projectName"];
    developerName = json["developerName"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    gallery = json["gallery"] ?? [];
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
      _data["otherSubAreas"] = otherSubAreas?.map((e) => e.toJson()).toList();
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
    _data["projectName"] = projectName;
    _data["developerName"] = developerName;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    if(gallery != null) {
      _data["gallery"] = gallery;
    }
    return _data;
  }
}

class Broker {
  dynamic id;
  dynamic name;
  dynamic phone;

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
  dynamic notes;

  AdditionalDetails({this.notes});

  AdditionalDetails.fromJson(Map<String, dynamic> json) {
    notes = json["notes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["notes"] = notes;
    return _data;
  }
}

class Advertisers {
  dynamic caption;
  dynamic creatorId;
  dynamic advertiserId;
  dynamic advertiserFullName;
  dynamic advertiserEmail;
  dynamic advertiserPhone;
  dynamic createdAt;

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

class OtherSubAreas {
  dynamic id;
  dynamic name;
  dynamic subAreaId;

  OtherSubAreas({this.id, this.name, this.subAreaId});

  OtherSubAreas.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    subAreaId = json["subAreaId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["subAreaId"] = subAreaId;
    return _data;
  }
}

class SubArea {
  dynamic id;
  dynamic nameEn;
  dynamic nameAr;
  dynamic areaId;
  dynamic createdAt;
  dynamic updatedAt;

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
  dynamic id;
  dynamic nameEn;
  dynamic nameAr;
  dynamic createdAt;
  dynamic updatedAt;

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
  dynamic id;
  dynamic nameEn;
  dynamic nameAr;
  dynamic cityId;
  dynamic createdAt;
  dynamic updatedAt;

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