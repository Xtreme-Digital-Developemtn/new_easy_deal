// broker_units_model.dart

class BrokerUnitsModel {
  String? status;
  String? message;
  List<BrokerUnitData>? data;
  int? count;

  BrokerUnitsModel({this.status, this.message, this.data, this.count});

  BrokerUnitsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"]?.toString();
    message = json["message"]?.toString();
    count = json["count"] is int ? json["count"] : int.tryParse(json["count"]?.toString() ?? '');

    final rawData = json["data"];
    if (rawData is List) {
      data = rawData.map((e) => BrokerUnitData.fromJson(e is Map ? Map<String, dynamic>.from(e) : {})).toList();
    } else if (rawData is Map<String, dynamic> && rawData.containsKey("data")) {
      final innerList = rawData["data"];
      if (innerList is List) {
        data = innerList.map((e) => BrokerUnitData.fromJson(e is Map ? Map<String, dynamic>.from(e) : {})).toList();
      }
      count = rawData["count"] is int ? rawData["count"] : int.tryParse(rawData["count"]?.toString() ?? '');
    } else {
      data = [];
    }
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
  List<OtherSubArea>? otherSubAreas;
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
  List<Advertiser>? advertisers;
  dynamic isArchived;
  AdditionalDetails? additionalDetails;
  List<String>? otherAccessories;
  dynamic modelId;
  dynamic brokerId;
  Broker? broker;
  dynamic brokerUserId;
  dynamic brokerUserFullName;
  dynamic brokerUserEmail;
  dynamic brokerUserPhone;
  dynamic brokerUserImage;
  dynamic projectName;
  dynamic developerName;
  dynamic project;
  dynamic createdAt;
  dynamic updatedAt;
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
    id = json.containsKey("id") ? json["id"] : null;
    modelCode = json.containsKey("modelCode") ? json["modelCode"] : null;
    type = json.containsKey("type") ? json["type"] : null;
    unitArea = json.containsKey("unitArea") ? json["unitArea"] : null;
    buildingNumber = json.containsKey("buildingNumber") ? json["buildingNumber"] : null;
    unitNumber = json.containsKey("unitNumber") ? json["unitNumber"] : null;
    floor = json.containsKey("floor") ? json["floor"] : null;

    area = json.containsKey("area") && json["area"] != null
        ? Area.fromJson(json["area"] is Map ? Map<String, dynamic>.from(json["area"]) : {})
        : null;
    city = json.containsKey("city") && json["city"] != null
        ? City.fromJson(json["city"] is Map ? Map<String, dynamic>.from(json["city"]) : {})
        : null;
    subArea = json.containsKey("subArea") && json["subArea"] != null
        ? SubArea.fromJson(json["subArea"] is Map ? Map<String, dynamic>.from(json["subArea"]) : {})
        : null;

    otherSubAreas = json.containsKey("otherSubAreas") && json["otherSubAreas"] != null
        ? (json["otherSubAreas"] as List?)?.map((e) => OtherSubArea.fromJson(e is Map ? Map<String, dynamic>.from(e) : {})).toList()
        : null;

    ownerPhone = json.containsKey("ownerPhone") ? json["ownerPhone"] : null;
    ownerName = json.containsKey("ownerName") ? json["ownerName"] : null;
    detailedAddress = json.containsKey("detailedAddress") ? json["detailedAddress"] : null;
    dailyRent = json.containsKey("dailyRent") ? json["dailyRent"] : null;
    monthlyRent = json.containsKey("monthlyRent") ? json["monthlyRent"] : null;
    deliveryStatus = json.containsKey("deliveryStatus") ? json["deliveryStatus"] : null;
    numberOfRooms = json.containsKey("numberOfRooms") ? json["numberOfRooms"] : null;
    numberOfBathrooms = json.containsKey("numberOfBathrooms") ? json["numberOfBathrooms"] : null;
    finishingType = json.containsKey("finishingType") ? json["finishingType"] : null;
    unitOperation = json.containsKey("unitOperation") ? json["unitOperation"] : null;
    compoundType = json.containsKey("compoundType") ? json["compoundType"] : null;
    status = json.containsKey("status") ? json["status"] : null;
    view = json.containsKey("view") ? json["view"] : null;
    deliveryDate = json.containsKey("deliveryDate") ? json["deliveryDate"] : null;
    diagram = json.containsKey("diagram") ? json["diagram"] : null;
    locationInMasterPlan = json.containsKey("locationInMasterPlan") ? json["locationInMasterPlan"] : null;
    location = json.containsKey("location") ? json["location"] : null;
    paymentSystem = json.containsKey("paymentSystem") ? json["paymentSystem"] : null;
    pricePerMeterInInstallment = json.containsKey("pricePerMeterInInstallment") ? json["pricePerMeterInInstallment"] : null;
    pricePerMeterInCash = json.containsKey("pricePerMeterInCash") ? json["pricePerMeterInCash"] : null;
    totalPriceInInstallment = json.containsKey("totalPriceInInstallment") ? json["totalPriceInInstallment"] : null;
    totalPriceInCash = json.containsKey("totalPriceInCash") ? json["totalPriceInCash"] : null;

    advertisers = json.containsKey("advertisers") && json["advertisers"] != null
        ? (json["advertisers"] as List?)?.map((e) => Advertiser.fromJson(e is Map ? Map<String, dynamic>.from(e) : {})).toList()
        : null;

    isArchived = json.containsKey("isArchived") ? json["isArchived"] : null;

    additionalDetails = json.containsKey("additionalDetails") && json["additionalDetails"] != null
        ? AdditionalDetails.fromJson(json["additionalDetails"] is Map ? Map<String, dynamic>.from(json["additionalDetails"]) : {})
        : null;

    otherAccessories = json.containsKey("otherAccessories") && json["otherAccessories"] != null
        ? List<String>.from(json["otherAccessories"])
        : null;

    modelId = json.containsKey("modelId") ? json["modelId"] : null;
    brokerId = json.containsKey("brokerId") ? json["brokerId"] : null;

    broker = json.containsKey("broker") && json["broker"] != null
        ? Broker.fromJson(json["broker"] is Map ? Map<String, dynamic>.from(json["broker"]) : {})
        : null;

    brokerUserId = json.containsKey("broker_user_id") ? json["broker_user_id"] : null;
    brokerUserFullName = json.containsKey("broker_user_full_name") ? json["broker_user_full_name"] : null;
    brokerUserEmail = json.containsKey("broker_user_email") ? json["broker_user_email"] : null;
    brokerUserPhone = json.containsKey("broker_user_phone") ? json["broker_user_phone"] : null;
    brokerUserImage = json.containsKey("broker_user_image") ? json["broker_user_image"] : null;
    projectName = json.containsKey("projectName") ? json["projectName"] : null;
    developerName = json.containsKey("developerName") ? json["developerName"] : null;
    project = json.containsKey("project") ? json["project"] : null;
    createdAt = json.containsKey("createdAt") ? json["createdAt"] : null;
    updatedAt = json.containsKey("updatedAt") ? json["updatedAt"] : null;
    gallery = json.containsKey("gallery") && json["gallery"] != null
        ? List<dynamic>.from(json["gallery"])
        : null;

    replyLog = json.containsKey("replyLog") && json["replyLog"] != null
        ? (json["replyLog"] as List?)?.map((e) {
      if (e is Map) {
        return ReplyLog.fromJson(Map<String, dynamic>.from(e));
      }
      return ReplyLog.fromJson({});
    }).toList()
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
    if (gallery != null) {
      _data["gallery"] = gallery;
    }
    if (replyLog != null) {
      _data["replyLog"] = replyLog?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  // Helper getters
  String get fullAddress {
    String areaName = area?.nameEn?.toString() ?? '';
    String cityName = city?.nameEn?.toString() ?? '';
    if (areaName.isNotEmpty && cityName.isNotEmpty) {
      return '$areaName, $cityName';
    } else if (cityName.isNotEmpty) {
      return cityName;
    }
    return '';
  }

  String get priceDisplay {
    if (totalPriceInCash != null && totalPriceInCash! > 0) {
      return '${totalPriceInCash.toString()} EGP';
    }
    return 'Contact for price';
  }

  String get unitInfo {
    String typeStr = type?.toString() ?? 'Unit';
    String areaStr = unitArea?.toString() ?? '0';
    String roomsStr = numberOfRooms?.toString() ?? '0';
    return '$typeStr • $areaStr m² • $roomsStr rooms';
  }

  bool get isAvailable => status?.toString() == 'available';
  bool get isSold => status?.toString() == 'sold';
  bool get isReserved => status?.toString() == 'reserved';
  bool get isNew => status?.toString() == 'new';
  bool get hasAdvertisers => advertisers != null && advertisers!.isNotEmpty;
  bool get hasReplyLog => replyLog != null && replyLog!.isNotEmpty;
  bool get hasGallery => gallery != null && gallery!.isNotEmpty;
  bool get hasLocation => location != null && location!.toString().isNotEmpty;
  bool get hasDeliveryDate => deliveryDate != null && deliveryDate!.toString().isNotEmpty;
}

// باقي الكلاسات بنفس النمط مع التحويل الآمن للـ Map...
class Area {
  dynamic id;
  dynamic nameEn;
  dynamic nameAr;
  dynamic cityId;
  dynamic createdAt;
  dynamic updatedAt;

  Area({
    this.id,
    this.nameEn,
    this.nameAr,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  Area.fromJson(Map<String, dynamic> json) {
    id = json.containsKey("id") ? json["id"] : null;
    nameEn = json.containsKey("name_en") ? json["name_en"] : null;
    nameAr = json.containsKey("name_ar") ? json["name_ar"] : null;
    cityId = json.containsKey("city_id") ? json["city_id"] : null;
    createdAt = json.containsKey("created_at") ? json["created_at"] : null;
    updatedAt = json.containsKey("updated_at") ? json["updated_at"] : null;
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
  dynamic id;
  dynamic nameEn;
  dynamic nameAr;
  dynamic createdAt;
  dynamic updatedAt;

  City({
    this.id,
    this.nameEn,
    this.nameAr,
    this.createdAt,
    this.updatedAt,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json.containsKey("id") ? json["id"] : null;
    nameEn = json.containsKey("name_en") ? json["name_en"] : null;
    nameAr = json.containsKey("name_ar") ? json["name_ar"] : null;
    createdAt = json.containsKey("created_at") ? json["created_at"] : null;
    updatedAt = json.containsKey("updated_at") ? json["updated_at"] : null;
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
  dynamic id;
  dynamic nameEn;
  dynamic nameAr;
  dynamic areaId;
  dynamic createdAt;
  dynamic updatedAt;

  SubArea({
    this.id,
    this.nameEn,
    this.nameAr,
    this.areaId,
    this.createdAt,
    this.updatedAt,
  });

  SubArea.fromJson(Map<String, dynamic> json) {
    id = json.containsKey("id") ? json["id"] : null;
    nameEn = json.containsKey("name_en") ? json["name_en"] : null;
    nameAr = json.containsKey("name_ar") ? json["name_ar"] : null;
    areaId = json.containsKey("area_id") ? json["area_id"] : null;
    createdAt = json.containsKey("created_at") ? json["created_at"] : null;
    updatedAt = json.containsKey("updated_at") ? json["updated_at"] : null;
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
  dynamic id;
  dynamic name;
  dynamic subAreaId;

  OtherSubArea({
    this.id,
    this.name,
    this.subAreaId,
  });

  OtherSubArea.fromJson(Map<String, dynamic> json) {
    id = json.containsKey("id") ? json["id"] : null;
    name = json.containsKey("name") ? json["name"] : null;
    subAreaId = json.containsKey("subAreaId") ? json["subAreaId"] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["subAreaId"] = subAreaId;
    return _data;
  }
}

class Advertiser {
  String? caption;
  dynamic creatorId;
  dynamic advertiserId;
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
    caption = json.containsKey("caption") ? json["caption"]?.toString() : null;
    creatorId = json.containsKey("creatorId") ? json["creatorId"] : null;
    advertiserId = json.containsKey("advertiserId") ? json["advertiserId"] : null;
    advertiserFullName = json.containsKey("advertiserFullName") ? json["advertiserFullName"]?.toString() : null;
    advertiserEmail = json.containsKey("advertiserEmail") ? json["advertiserEmail"]?.toString() : null;
    advertiserPhone = json.containsKey("advertiserPhone") ? json["advertiserPhone"]?.toString() : null;
    createdAt = json.containsKey("createdAt") ? json["createdAt"]?.toString() : null;
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
  dynamic groundArea;
  String? unitDesign;
  String? unitFacing;
  String? legalStatus;
  dynamic buildingArea;
  String? fitOutCondition;
  String? furnishingStatus;
  String? groundLayoutStatus;

  // حقول إضافية
  dynamic numberOfFloors;
  dynamic otherExpensesValue;

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
    this.numberOfFloors,
    this.otherExpensesValue,
  });

  AdditionalDetails.fromJson(Map<String, dynamic> json) {
    notes = json.containsKey("notes") ? json["notes"]?.toString() : null;
    otherExpenses = json.containsKey("otherExpenses") ? json["otherExpenses"] as List<dynamic>? : null;
    requestedOver = json.containsKey("requestedOver") ? json["requestedOver"]?.toString() : null;
    financialStatus = json.containsKey("financialStatus") ? json["financialStatus"]?.toString() : null;
    activity = json.containsKey("activity") ? json["activity"]?.toString() : null;
    groundArea = json.containsKey("ground_area") ? json["ground_area"] : null;
    unitDesign = json.containsKey("unit_design") ? json["unit_design"]?.toString() : null;
    unitFacing = json.containsKey("unitFacing") ? json["unitFacing"]?.toString() : null;
    legalStatus = json.containsKey("legal_status") ? json["legal_status"]?.toString() : null;
    buildingArea = json.containsKey("building_area") ? json["building_area"] : null;
    fitOutCondition = json.containsKey("fit_out_condition") ? json["fit_out_condition"]?.toString() : null;
    furnishingStatus = json.containsKey("furnishing_status") ? json["furnishing_status"]?.toString() : null;
    groundLayoutStatus = json.containsKey("ground_layout_status") ? json["ground_layout_status"]?.toString() : null;

    numberOfFloors = json.containsKey("numberOfFloors") ? json["numberOfFloors"] : null;
    otherExpensesValue = json.containsKey("otherExpensesValue") ? json["otherExpensesValue"] : null;
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
    _data["unitFacing"] = unitFacing;
    _data["legal_status"] = legalStatus;
    _data["building_area"] = buildingArea;
    _data["fit_out_condition"] = fitOutCondition;
    _data["furnishing_status"] = furnishingStatus;
    _data["ground_layout_status"] = groundLayoutStatus;
    _data["numberOfFloors"] = numberOfFloors;
    _data["otherExpensesValue"] = otherExpensesValue;
    return _data;
  }
}

class ReplyLog {
  String? unitId;
  dynamic senderId;
  dynamic receiverId;
  String? senderName;
  String? senderPhone;
  String? receiverName;
  String? receiverPhone;
  dynamic requestBrokerId;
  dynamic replyId;

  ReplyLog({
    this.unitId,
    this.senderId,
    this.receiverId,
    this.senderName,
    this.senderPhone,
    this.receiverName,
    this.receiverPhone,
    this.requestBrokerId,
    this.replyId,
  });

  ReplyLog.fromJson(Map<String, dynamic> json) {
    unitId = json.containsKey("unit_id") ? json["unit_id"]?.toString() : null;
    senderId = json.containsKey("sender_id") ? json["sender_id"] : null;
    receiverId = json.containsKey("receiver_id") ? json["receiver_id"] : null;
    senderName = json.containsKey("sender_name") ? json["sender_name"]?.toString() : null;
    senderPhone = json.containsKey("sender_phone") ? json["sender_phone"]?.toString() : null;
    receiverName = json.containsKey("receiver_name") ? json["receiver_name"]?.toString() : null;
    receiverPhone = json.containsKey("receiver_phone") ? json["receiver_phone"]?.toString() : null;
    requestBrokerId = json.containsKey("request_broker_id") ? json["request_broker_id"] : null;
    replyId = json.containsKey("reply_id") ? json["reply_id"] : null;
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
    _data["request_broker_id"] = requestBrokerId;
    _data["reply_id"] = replyId;
    return _data;
  }
}

class Broker {
  dynamic id;
  String? name;
  String? phone;

  Broker({
    this.id,
    this.name,
    this.phone,
  });

  Broker.fromJson(Map<String, dynamic> json) {
    id = json.containsKey("id") ? json["id"] : null;
    name = json.containsKey("name") ? json["name"]?.toString() : null;
    phone = json.containsKey("phone") ? json["phone"]?.toString() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["phone"] = phone;
    return _data;
  }
}