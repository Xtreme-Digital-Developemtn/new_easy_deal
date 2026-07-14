// class BrokerUnitsModel {
//   String? status;
//   String? message;
//   List<BrokerUnitData>? data;
//   int? count;
//
//   BrokerUnitsModel({this.status, this.message, this.data, this.count});
//
//   BrokerUnitsModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     data = json["data"] == null ? null : (json["data"] as List).map((e) => BrokerUnitData.fromJson(e)).toList();
//     count = json["count"];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["status"] = status;
//     _data["message"] = message;
//     if (data != null) {
//       _data["data"] = data?.map((e) => e.toJson()).toList();
//     }
//     _data["count"] = count;
//     return _data;
//   }
// }
//
// class BrokerUnitData {
//   int? id;
//   String? type;
//   int? unitArea;
//   String? buildingNumber;
//   String? unitNumber;
//   String? floor;
//   String? ownerPhone;
//   String? ownerName;
//   String? detailedAddress;
//   String? dailyRent;
//   String? monthlyRent;
//   String? deliveryStatus;
//   int? numberOfRooms;
//   int? numberOfBathrooms;
//   String? finishingType;
//   String? unitOperation;
//   String? compoundType;
//   String? status;
//   String? view;
//   String? paymentSystem;
//   int? totalPriceInCash;
//   int? totalPriceInInstallment;
//   int? pricePerMeterInCash;
//   int? pricePerMeterInInstallment;
//   int? isArchived;
//   List<String>? otherAccessories;
//   String? description;
//   String? diagram;
//   String? location;
//   String? city;
//   String? area;
//   String? notes;
//
//   BrokerUnitData({
//     this.id,
//     this.type,
//     this.unitArea,
//     this.buildingNumber,
//     this.unitNumber,
//     this.floor,
//     this.ownerPhone,
//     this.ownerName,
//     this.detailedAddress,
//     this.dailyRent,
//     this.monthlyRent,
//     this.deliveryStatus,
//     this.numberOfRooms,
//     this.numberOfBathrooms,
//     this.finishingType,
//     this.unitOperation,
//     this.compoundType,
//     this.status,
//     this.view,
//     this.paymentSystem,
//     this.totalPriceInCash,
//     this.totalPriceInInstallment,
//     this.pricePerMeterInCash,
//     this.pricePerMeterInInstallment,
//     this.isArchived,
//     this.otherAccessories,
//     this.description,
//     this.diagram,
//     this.location,
//     this.city,
//     this.area,
//     this.notes,
//   });
//
//   BrokerUnitData.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     type = json["type"];
//     unitArea = json["unitArea"];
//     buildingNumber = json["buildingNumber"];
//     unitNumber = json["unitNumber"];
//     floor = json["floor"];
//     ownerPhone = json["ownerPhone"];
//     ownerName = json["ownerName"];
//     detailedAddress = json["detailedAddress"];
//     dailyRent = json["dailyRent"]?.toString();
//     monthlyRent = json["monthlyRent"]?.toString();
//     deliveryStatus = json["deliveryStatus"];
//     numberOfRooms = json["numberOfRooms"];
//     numberOfBathrooms = json["numberOfBathrooms"];
//     finishingType = json["finishingType"];
//     unitOperation = json["unitOperation"];
//     compoundType = json["compoundType"];
//     status = json["status"];
//     view = json["view"];
//     paymentSystem = json["paymentSystem"];
//     totalPriceInCash = json["totalPriceInCash"];
//     totalPriceInInstallment = json["totalPriceInInstallment"];
//     pricePerMeterInCash = json["pricePerMeterInCash"];
//     pricePerMeterInInstallment = json["pricePerMeterInInstallment"];
//     isArchived = json["isArchived"];
//     otherAccessories = json["otherAccessories"] == null ? null : List<String>.from(json["otherAccessories"]);
//     description = json["description"];
//     diagram = json["diagram"];
//     location = json["location"];
//     city = json["city"] is String ? json["city"] : (json["city"] as Map?)?["nameEn"] ?? (json["city"] as Map?)?["nameAr"];
//     area = json["area"] is String ? json["area"] : (json["area"] as Map?)?["nameEn"] ?? (json["area"] as Map?)?["nameAr"];
//     notes = (json["additionalDetails"] as Map?)?["notes"];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["type"] = type;
//     _data["unitArea"] = unitArea;
//     _data["buildingNumber"] = buildingNumber;
//     _data["unitNumber"] = unitNumber;
//     _data["floor"] = floor;
//     _data["ownerPhone"] = ownerPhone;
//     _data["ownerName"] = ownerName;
//     _data["detailedAddress"] = detailedAddress;
//     _data["dailyRent"] = dailyRent;
//     _data["monthlyRent"] = monthlyRent;
//     _data["deliveryStatus"] = deliveryStatus;
//     _data["numberOfRooms"] = numberOfRooms;
//     _data["numberOfBathrooms"] = numberOfBathrooms;
//     _data["finishingType"] = finishingType;
//     _data["unitOperation"] = unitOperation;
//     _data["compoundType"] = compoundType;
//     _data["status"] = status;
//     _data["view"] = view;
//     _data["paymentSystem"] = paymentSystem;
//     _data["totalPriceInCash"] = totalPriceInCash;
//     _data["totalPriceInInstallment"] = totalPriceInInstallment;
//     _data["pricePerMeterInCash"] = pricePerMeterInCash;
//     _data["pricePerMeterInInstallment"] = pricePerMeterInInstallment;
//     _data["isArchived"] = isArchived;
//     _data["otherAccessories"] = otherAccessories;
//     _data["description"] = description;
//     _data["diagram"] = diagram;
//     _data["location"] = location;
//     _data["city"] = city;
//     _data["area"] = area;
//     _data["notes"] = notes;
//     return _data;
//   }
// }


// broker_units_model.dart

class BrokerUnitsModel {
  String? status;
  String? message;
  List<BrokerUnitData>? data;
  int? count;

  BrokerUnitsModel({this.status, this.message, this.data, this.count});

  BrokerUnitsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => BrokerUnitData.fromJson(e)).toList();
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["count"] = count;
    return _data;
  }
}

class BrokerUnitData {
  int? id;
  String? modelCode;
  String? type;
  int? unitArea;
  String? buildingNumber;
  String? unitNumber;
  String? floor;
  Area? area;
  City? city;
  SubArea? subArea;
  List<OtherSubArea>? otherSubAreas;
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
  String? diagram;
  String? locationInMasterPlan;
  String? location;
  String? paymentSystem;
  int? pricePerMeterInInstallment;
  int? pricePerMeterInCash;
  int? totalPriceInInstallment;
  int? totalPriceInCash;
  List<Advertiser>? advertisers;
  int? isArchived;
  AdditionalDetails? additionalDetails;
  List<String>? otherAccessories;
  String? modelId;
  int? brokerId;
  Broker? broker;
  String? brokerUserId;
  String? brokerUserFullName;
  String? brokerUserEmail;
  String? brokerUserPhone;
  String? brokerUserImage;
  String? projectName;
  String? developerName;
  String? project;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? gallery;
  List<ReplyLog>? replyLog;

  BrokerUnitData({
    this.id,
    this.modelCode,
    this.type,
    this.unitArea,
    this.buildingNumber,
    this.unitNumber,
    this.floor,
    this.area,
    this.city,
    this.subArea,
    this.otherSubAreas,
    this.ownerPhone,
    this.ownerName,
    this.detailedAddress,
    this.dailyRent,
    this.monthlyRent,
    this.deliveryStatus,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.finishingType,
    this.unitOperation,
    this.compoundType,
    this.status,
    this.view,
    this.deliveryDate,
    this.diagram,
    this.locationInMasterPlan,
    this.location,
    this.paymentSystem,
    this.pricePerMeterInInstallment,
    this.pricePerMeterInCash,
    this.totalPriceInInstallment,
    this.totalPriceInCash,
    this.advertisers,
    this.isArchived,
    this.additionalDetails,
    this.otherAccessories,
    this.modelId,
    this.brokerId,
    this.broker,
    this.brokerUserId,
    this.brokerUserFullName,
    this.brokerUserEmail,
    this.brokerUserPhone,
    this.brokerUserImage,
    this.projectName,
    this.developerName,
    this.project,
    this.createdAt,
    this.updatedAt,
    this.gallery,
    this.replyLog,
  });

  BrokerUnitData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    modelCode = json["modelCode"];
    type = json["type"];
    unitArea = json["unitArea"];
    buildingNumber = json["buildingNumber"];
    unitNumber = json["unitNumber"];
    floor = json["floor"];
    area = json["area"] != null ? Area.fromJson(json["area"]) : null;
    city = json["city"] != null ? City.fromJson(json["city"]) : null;
    subArea = json["subArea"] != null ? SubArea.fromJson(json["subArea"]) : null;
    otherSubAreas = json["otherSubAreas"] != null
        ? (json["otherSubAreas"] as List).map((e) => OtherSubArea.fromJson(e)).toList()
        : null;
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
    advertisers = json["advertisers"] != null
        ? (json["advertisers"] as List).map((e) => Advertiser.fromJson(e)).toList()
        : null;
    isArchived = json["isArchived"];
    additionalDetails = json["additionalDetails"] != null
        ? AdditionalDetails.fromJson(json["additionalDetails"])
        : null;
    otherAccessories = json["otherAccessories"] != null
        ? List<String>.from(json["otherAccessories"])
        : null;
    modelId = json["modelId"];
    brokerId = json["brokerId"];
    broker = json["broker"] != null ? Broker.fromJson(json["broker"]) : null;
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
    replyLog = json["replyLog"] != null
        ? (json["replyLog"] as List).map((e) => ReplyLog.fromJson(e)).toList()
        : null;
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
    if (area != null) {
      _data["area"] = area?.toJson();
    }
    if (city != null) {
      _data["city"] = city?.toJson();
    }
    if (subArea != null) {
      _data["subArea"] = subArea?.toJson();
    }
    if (otherSubAreas != null) {
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
    if (advertisers != null) {
      _data["advertisers"] = advertisers?.map((e) => e.toJson()).toList();
    }
    _data["isArchived"] = isArchived;
    if (additionalDetails != null) {
      _data["additionalDetails"] = additionalDetails?.toJson();
    }
    _data["otherAccessories"] = otherAccessories;
    _data["modelId"] = modelId;
    _data["brokerId"] = brokerId;
    if (broker != null) {
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
    _data["gallery"] = gallery;
    if (replyLog != null) {
      _data["replyLog"] = replyLog?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  // Helper getters
  String get fullAddress {
    String areaName = area?.nameEn ?? '';
    String cityName = city?.nameEn ?? '';
    return areaName.isNotEmpty && cityName.isNotEmpty ? '$areaName, $cityName' : cityName;
  }

  String get priceDisplay {
    if (totalPriceInCash != null && totalPriceInCash! > 0) {
      return '${totalPriceInCash.toString()} EGP';
    }
    return 'Contact for price';
  }

  String get unitInfo {
    return '$type • $unitArea m² • $numberOfRooms rooms';
  }

  bool get isAvailable => status == 'available';
  bool get isSold => status == 'sold';
  bool get isReserved => status == 'reserved';
  bool get isNew => status == 'new';
  bool get hasAdvertisers => advertisers != null && advertisers!.isNotEmpty;
  bool get hasReplyLog => replyLog != null && replyLog!.isNotEmpty;
  bool get hasGallery => gallery != null && gallery!.isNotEmpty;
  bool get hasLocation => location != null && location!.isNotEmpty;
  bool get hasDeliveryDate => deliveryDate != null && deliveryDate!.isNotEmpty;
}

class Area {
  int? id;
  String? nameEn;
  String? nameAr;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  Area({
    this.id,
    this.nameEn,
    this.nameAr,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

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

class City {
  int? id;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;

  City({
    this.id,
    this.nameEn,
    this.nameAr,
    this.createdAt,
    this.updatedAt,
  });

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

class SubArea {
  int? id;
  String? nameEn;
  String? nameAr;
  int? areaId;
  String? createdAt;
  String? updatedAt;

  SubArea({
    this.id,
    this.nameEn,
    this.nameAr,
    this.areaId,
    this.createdAt,
    this.updatedAt,
  });

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

class OtherSubArea {
  int? id;
  String? name;

  OtherSubArea({
    this.id,
    this.name,
  });

  OtherSubArea.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class Advertiser {
  String? caption;
  int? creatorId;
  int? advertiserId;
  String? advertiserFullName;
  String? advertiserEmail;
  String? advertiserPhone;
  String? createdAt;

  Advertiser({
    this.caption,
    this.creatorId,
    this.advertiserId,
    this.advertiserFullName,
    this.advertiserEmail,
    this.advertiserPhone,
    this.createdAt,
  });

  Advertiser.fromJson(Map<String, dynamic> json) {
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

class AdditionalDetails {
  String? notes;
  List<dynamic>? otherExpenses;
  String? requestedOver;
  String? financialStatus;
  String? activity;
  int? groundArea;
  String? unitDesign;
  String? unitFacing;
  String? legalStatus;
  int? buildingArea;
  String? fitOutCondition;
  String? furnishingStatus;
  String? groundLayoutStatus;

  AdditionalDetails({
    this.notes,
    this.otherExpenses,
    this.requestedOver,
    this.financialStatus,
    this.activity,
    this.groundArea,
    this.unitDesign,
    this.unitFacing,
    this.legalStatus,
    this.buildingArea,
    this.fitOutCondition,
    this.furnishingStatus,
    this.groundLayoutStatus,
  });

  AdditionalDetails.fromJson(Map<String, dynamic> json) {
    notes = json["notes"];
    otherExpenses = json["otherExpenses"];
    requestedOver = json["requestedOver"];
    financialStatus = json["financialStatus"];
    activity = json["activity"];
    groundArea = json["ground_area"];
    unitDesign = json["unit_design"];
    unitFacing = json["unit_facing"];
    legalStatus = json["legal_status"];
    buildingArea = json["building_area"];
    fitOutCondition = json["fit_out_condition"];
    furnishingStatus = json["furnishing_status"];
    groundLayoutStatus = json["ground_layout_status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["notes"] = notes;
    _data["otherExpenses"] = otherExpenses;
    _data["requestedOver"] = requestedOver;
    _data["financialStatus"] = financialStatus;
    _data["activity"] = activity;
    _data["ground_area"] = groundArea;
    _data["unit_design"] = unitDesign;
    _data["unit_facing"] = unitFacing;
    _data["legal_status"] = legalStatus;
    _data["building_area"] = buildingArea;
    _data["fit_out_condition"] = fitOutCondition;
    _data["furnishing_status"] = furnishingStatus;
    _data["ground_layout_status"] = groundLayoutStatus;
    return _data;
  }
}

class ReplyLog {
  String? unitId;
  int? senderId;
  int? receiverId;
  String? senderName;
  String? senderPhone;
  String? receiverName;
  String? receiverPhone;

  ReplyLog({
    this.unitId,
    this.senderId,
    this.receiverId,
    this.senderName,
    this.senderPhone,
    this.receiverName,
    this.receiverPhone,
  });

  ReplyLog.fromJson(Map<String, dynamic> json) {
    unitId = json["unit_id"];
    senderId = json["sender_id"];
    receiverId = json["receiver_id"];
    senderName = json["sender_name"];
    senderPhone = json["sender_phone"];
    receiverName = json["receiver_name"];
    receiverPhone = json["receiver_phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["unit_id"] = unitId;
    _data["sender_id"] = senderId;
    _data["receiver_id"] = receiverId;
    _data["sender_name"] = senderName;
    _data["sender_phone"] = senderPhone;
    _data["receiver_name"] = receiverName;
    _data["receiver_phone"] = receiverPhone;
    return _data;
  }
}

class Broker {
  int? id;
  String? name;

  Broker({
    this.id,
    this.name,
  });

  Broker.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}