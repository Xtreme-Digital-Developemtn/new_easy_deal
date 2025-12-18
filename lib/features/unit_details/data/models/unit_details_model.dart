
class UnitDetailsModel {
  String? status;
  String? message;
  Data? data;

  UnitDetailsModel({this.status, this.message, this.data});

  UnitDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? modelCode;
  String? type;
  int? unitArea;
  dynamic buildingNumber;
  dynamic unitNumber;
  dynamic floor;
  Area? area;
  City? city;
  SubArea? subArea;
  List<dynamic>? otherSubAreas;
  dynamic ownerPhone;
  dynamic ownerName;
  String? detailedAddress;
  dynamic dailyRent;
  dynamic monthlyRent;
  String? deliveryStatus;
  int? numberOfRooms;
  int? numberOfBathrooms;
  dynamic finishingType;
  String? unitOperation;
  String? compoundType;
  String? status;
  dynamic view;
  String? deliveryDate;
  dynamic diagram;
  dynamic locationInMasterPlan;
  dynamic location;
  String? paymentSystem;
  int? pricePerMeterInInstallment;
  int? pricePerMeterInCash;
  int? totalPriceInInstallment;
  int? totalPriceInCash;
  List<dynamic>? advertisers;
  int? isArchived;
  AdditionalDetails? additionalDetails;
  List<String>? otherAccessories;
  int? modelId;
  dynamic brokerId;
  Broker? broker;
  String? projectName;
  String? developerName;
  String? createdAt;
  String? updatedAt;
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
    advertisers = json["advertisers"] ?? [];
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
      _data["advertisers"] = advertisers;
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
  String? notes;
  String? fitOutCondition;
  int? otherExpensesValue;

  AdditionalDetails({this.notes, this.fitOutCondition, this.otherExpensesValue});

  AdditionalDetails.fromJson(Map<String, dynamic> json) {
    notes = json["notes"];
    fitOutCondition = json["fitOutCondition"];
    otherExpensesValue = json["otherExpensesValue"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["notes"] = notes;
    _data["fitOutCondition"] = fitOutCondition;
    _data["otherExpensesValue"] = otherExpensesValue;
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