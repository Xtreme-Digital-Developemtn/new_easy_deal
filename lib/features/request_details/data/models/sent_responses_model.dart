class SentResponsesModel {
  String? status;
  String? message;
  List<SentResponseItem>? data;
  int? count;
  // pagination helpers - count is total from server
  int? totalCount;

  SentResponsesModel({this.status, this.message, this.data, this.count, this.totalCount});

  SentResponsesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as String?;
    message = json['message'] as String?;
    if (json['data'] != null) {
      data = <SentResponseItem>[];
      for (var v in (json['data'] as List)) {
        data!.add(SentResponseItem.fromJson(v as Map<String, dynamic>));
      }
    }
    // API returns count as total records
    count = json['count'] is int ? json['count'] as int : int.tryParse(json['count']?.toString() ?? '');
    totalCount = count;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    return map;
  }

  bool get isEmpty => data == null || data!.isEmpty;
  bool get isNotEmpty => data != null && data!.isNotEmpty;
}

class SentResponseItem {
  int? id;
  dynamic modelCode;
  String? type;
  int? unitArea;
  String? buildingNumber;
  String? unitNumber;
  String? floor;

  Area? area;
  City? city;

  dynamic subArea;
  List<dynamic>? otherSubAreas;

  String? ownerPhone;
  String? ownerName;
  String? detailedAddress;

  dynamic dailyRent;
  dynamic monthlyRent;

  String? deliveryStatus;
  int? numberOfRooms;
  int? numberOfBathrooms;
  String? finishingType;
  String? unitOperation;
  String? compoundType;
  String? status;
  String? view;

  dynamic deliveryDate;
  dynamic diagram;
  dynamic locationInMasterPlan;

  String? location;
  String? paymentSystem;

  dynamic pricePerMeterInInstallment;
  int? pricePerMeterInCash;

  dynamic totalPriceInInstallment;
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

  List<ReplyLog>? replyLog;

  SentResponseItem({
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

  SentResponseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] as int : int.tryParse(json['id']?.toString() ?? '');
    modelCode = json['modelCode'];
    type = json['type'] as String?;
    unitArea = json['unitArea'] is int ? json['unitArea'] as int : int.tryParse(json['unitArea']?.toString() ?? '');
    buildingNumber = json['buildingNumber']?.toString();
    unitNumber = json['unitNumber']?.toString();
    floor = json['floor']?.toString();

    area = json['area'] != null ? Area.fromJson(json['area'] as Map<String, dynamic>) : null;
    city = json['city'] != null ? City.fromJson(json['city'] as Map<String, dynamic>) : null;

    subArea = json['subArea'];
    if (json['otherSubAreas'] != null) {
      otherSubAreas = List<dynamic>.from(json['otherSubAreas'] as List);
    }

    ownerPhone = json['ownerPhone']?.toString();
    ownerName = json['ownerName']?.toString();
    detailedAddress = json['detailedAddress']?.toString();

    dailyRent = json['dailyRent'];
    monthlyRent = json['monthlyRent'];

    deliveryStatus = json['deliveryStatus']?.toString();
    numberOfRooms = json['numberOfRooms'] is int ? json['numberOfRooms'] as int : int.tryParse(json['numberOfRooms']?.toString() ?? '');
    numberOfBathrooms = json['numberOfBathrooms'] is int ? json['numberOfBathrooms'] as int : int.tryParse(json['numberOfBathrooms']?.toString() ?? '');
    finishingType = json['finishingType']?.toString();
    unitOperation = json['unitOperation']?.toString();
    compoundType = json['compoundType']?.toString();
    status = json['status']?.toString();
    view = json['view']?.toString();

    deliveryDate = json['deliveryDate'];
    diagram = json['diagram'];
    locationInMasterPlan = json['locationInMasterPlan'];

    location = json['location']?.toString();
    paymentSystem = json['paymentSystem']?.toString();

    pricePerMeterInInstallment = json['pricePerMeterInInstallment'];
    pricePerMeterInCash = json['pricePerMeterInCash'] is int ? json['pricePerMeterInCash'] as int : int.tryParse(json['pricePerMeterInCash']?.toString() ?? '');
    totalPriceInInstallment = json['totalPriceInInstallment'];
    totalPriceInCash = json['totalPriceInCash'] is int ? json['totalPriceInCash'] as int : int.tryParse(json['totalPriceInCash']?.toString() ?? '');

    if (json['advertisers'] != null) {
      advertisers = (json['advertisers'] as List).map((v) => Advertisers.fromJson(v as Map<String, dynamic>)).toList();
    }

    isArchived = json['isArchived'] is int ? json['isArchived'] as int : int.tryParse(json['isArchived']?.toString() ?? '');
    additionalDetails = json['additionalDetails'] != null ? AdditionalDetails.fromJson(json['additionalDetails'] as Map<String, dynamic>) : null;

    if (json['otherAccessories'] != null) {
      otherAccessories = List<String>.from((json['otherAccessories'] as List).map((e) => e.toString()));
    }

    modelId = json['modelId'];
    brokerId = json['brokerId'] is int ? json['brokerId'] as int : int.tryParse(json['brokerId']?.toString() ?? '');
    broker = json['broker'] != null ? Broker.fromJson(json['broker'] as Map<String, dynamic>) : null;

    brokerUserId = json['broker_user_id'];
    brokerUserFullName = json['broker_user_full_name'];
    brokerUserEmail = json['broker_user_email'];
    brokerUserPhone = json['broker_user_phone'];
    brokerUserImage = json['broker_user_image'];

    projectName = json['projectName'];
    developerName = json['developerName'];
    project = json['project'];

    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();

    if (json['gallery'] != null) {
      gallery = List<dynamic>.from(json['gallery'] as List);
    }
    if (json['replyLog'] != null) {
      replyLog = (json['replyLog'] as List).map((v) => ReplyLog.fromJson(v as Map<String, dynamic>)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['modelCode'] = modelCode;
    data['type'] = type;
    data['unitArea'] = unitArea;
    data['buildingNumber'] = buildingNumber;
    data['unitNumber'] = unitNumber;
    data['floor'] = floor;
    if (area != null) data['area'] = area!.toJson();
    if (city != null) data['city'] = city!.toJson();
    data['subArea'] = subArea;
    if (otherSubAreas != null) data['otherSubAreas'] = otherSubAreas;
    data['ownerPhone'] = ownerPhone;
    data['ownerName'] = ownerName;
    data['detailedAddress'] = detailedAddress;
    data['dailyRent'] = dailyRent;
    data['monthlyRent'] = monthlyRent;
    data['deliveryStatus'] = deliveryStatus;
    data['numberOfRooms'] = numberOfRooms;
    data['numberOfBathrooms'] = numberOfBathrooms;
    data['finishingType'] = finishingType;
    data['unitOperation'] = unitOperation;
    data['compoundType'] = compoundType;
    data['status'] = status;
    data['view'] = view;
    data['deliveryDate'] = deliveryDate;
    data['diagram'] = diagram;
    data['locationInMasterPlan'] = locationInMasterPlan;
    data['location'] = location;
    data['paymentSystem'] = paymentSystem;
    data['pricePerMeterInInstallment'] = pricePerMeterInInstallment;
    data['pricePerMeterInCash'] = pricePerMeterInCash;
    data['totalPriceInInstallment'] = totalPriceInInstallment;
    data['totalPriceInCash'] = totalPriceInCash;
    if (advertisers != null) data['advertisers'] = advertisers!.map((v) => v.toJson()).toList();
    data['isArchived'] = isArchived;
    if (additionalDetails != null) data['additionalDetails'] = additionalDetails!.toJson();
    data['otherAccessories'] = otherAccessories;
    data['modelId'] = modelId;
    data['brokerId'] = brokerId;
    if (broker != null) data['broker'] = broker!.toJson();
    data['broker_user_id'] = brokerUserId;
    data['broker_user_full_name'] = brokerUserFullName;
    data['broker_user_email'] = brokerUserEmail;
    data['broker_user_phone'] = brokerUserPhone;
    data['broker_user_image'] = brokerUserImage;
    data['projectName'] = projectName;
    data['developerName'] = developerName;
    data['project'] = project;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (gallery != null) data['gallery'] = gallery;
    if (replyLog != null) data['replyLog'] = replyLog!.map((v) => v.toJson()).toList();
    return data;
  }

  // Convenience getters for table UI
  String get displayUnitCode => modelCode?.toString() ?? id?.toString() ?? '-';
  String get displayBrokerName => broker?.name?.toString() ?? brokerUserFullName?.toString() ?? '-';
  String get displayFinishing => finishingType?.toString() ?? '-';
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
    id = json['id'] is int ? json['id'] as int : int.tryParse(json['id']?.toString() ?? '');
    nameEn = json['name_en']?.toString();
    nameAr = json['name_ar']?.toString();
    cityId = json['city_id'] is int ? json['city_id'] as int : int.tryParse(json['city_id']?.toString() ?? '');
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
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
    id = json['id'] is int ? json['id'] as int : int.tryParse(json['id']?.toString() ?? '');
    nameEn = json['name_en']?.toString();
    nameAr = json['name_ar']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Advertisers {
  String? caption;
  int? creatorId;
  int? advertiserId;
  String? advertiserFullName;
  String? advertiserEmail;
  String? advertiserPhone;
  String? createdAt;

  Advertisers({this.caption, this.creatorId, this.advertiserId, this.advertiserFullName, this.advertiserEmail, this.advertiserPhone, this.createdAt});

  Advertisers.fromJson(Map<String, dynamic> json) {
    caption = json['caption']?.toString();
    creatorId = json['creatorId'] is int ? json['creatorId'] as int : int.tryParse(json['creatorId']?.toString() ?? '');
    advertiserId = json['advertiserId'] is int ? json['advertiserId'] as int : int.tryParse(json['advertiserId']?.toString() ?? '');
    advertiserFullName = json['advertiserFullName']?.toString();
    advertiserEmail = json['advertiserEmail']?.toString();
    advertiserPhone = json['advertiserPhone']?.toString();
    createdAt = json['createdAt']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['caption'] = caption;
    data['creatorId'] = creatorId;
    data['advertiserId'] = advertiserId;
    data['advertiserFullName'] = advertiserFullName;
    data['advertiserEmail'] = advertiserEmail;
    data['advertiserPhone'] = advertiserPhone;
    data['createdAt'] = createdAt;
    return data;
  }
}

class AdditionalDetails {
  String? unitFacing;
  String? legalStatus;

  AdditionalDetails({this.unitFacing, this.legalStatus});

  AdditionalDetails.fromJson(Map<String, dynamic> json) {
    unitFacing = json['unitFacing']?.toString();
    legalStatus = json['legalStatus']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unitFacing'] = unitFacing;
    data['legalStatus'] = legalStatus;
    return data;
  }
}

class Broker {
  int? id;
  String? name;
  String? phone;

  Broker({this.id, this.name, this.phone});

  Broker.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] as int : int.tryParse(json['id']?.toString() ?? '');
    name = json['name']?.toString();
    phone = json['phone']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class ReplyLog {
  String? unitId;
  int? replyId;
  int? senderId;
  int? requestId;
  int? receiverId;
  String? senderName;
  String? senderPhone;
  String? receiverName;
  String? receiverPhone;

  ReplyLog({this.unitId, this.replyId, this.senderId, this.requestId, this.receiverId, this.senderName, this.senderPhone, this.receiverName, this.receiverPhone});

  ReplyLog.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id']?.toString();
    replyId = json['reply_id'] is int ? json['reply_id'] as int : int.tryParse(json['reply_id']?.toString() ?? '');
    senderId = json['sender_id'] is int ? json['sender_id'] as int : int.tryParse(json['sender_id']?.toString() ?? '');
    requestId = json['request_id'] is int ? json['request_id'] as int : int.tryParse(json['request_id']?.toString() ?? '');
    receiverId = json['receiver_id'] is int ? json['receiver_id'] as int : int.tryParse(json['receiver_id']?.toString() ?? '');
    senderName = json['sender_name']?.toString();
    senderPhone = json['sender_phone']?.toString();
    receiverName = json['receiver_name']?.toString();
    receiverPhone = json['receiver_phone']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit_id'] = unitId;
    data['reply_id'] = replyId;
    data['sender_id'] = senderId;
    data['request_id'] = requestId;
    data['receiver_id'] = receiverId;
    data['sender_name'] = senderName;
    data['sender_phone'] = senderPhone;
    data['receiver_name'] = receiverName;
    data['receiver_phone'] = receiverPhone;
    return data;
  }
}
