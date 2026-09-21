import '../../../broker_features/boker_data/data/models/broker_units_model.dart';

class RecommendedModel {
  String? status;
  String? message;
  List<RecommendedData>? data;
  int? count;

  RecommendedModel({
    this.status,
    this.message,
    this.data,
    this.count,
  });

  RecommendedModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    message = json['message']?.toString();
    if (json['data'] != null) {
      data = (json['data'] as List).map((v) => RecommendedData.fromJson(v as Map<String, dynamic>)).toList();
    }
    count = json['count'] is int ? json['count'] : int.tryParse(json['count']?.toString() ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((v) => v.toJson()).toList(),
      'count': count,
    };
  }
}

class RecommendedData {
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
  List<dynamic>? otherSubAreas;

  dynamic ownerPhone;
  dynamic ownerName;
  dynamic detailedAddress;
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

  dynamic brokerUserId;
  dynamic brokerUserFullName;
  dynamic brokerUserEmail;
  dynamic brokerUserPhone;
  dynamic brokerUserImage;

  String? projectName;
  String? developerName;
  dynamic project;

  String? createdAt;
  String? updatedAt;

  List<dynamic>? gallery;
  List<ReplyLog>? replyLog;

  RecommendedData({
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

  RecommendedData.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '');
    modelCode = json['modelCode']?.toString();
    type = json['type']?.toString();
    unitArea = json['unitArea'] is int ? json['unitArea'] : int.tryParse(json['unitArea']?.toString() ?? '');
    buildingNumber = json['buildingNumber']?.toString();
    unitNumber = json['unitNumber']?.toString();
    floor = json['floor']?.toString();
    area = json['area'] != null ? Area.fromJson(json['area'] is Map ? Map<String, dynamic>.from(json['area']) : {}) : null;
    city = json['city'] != null ? City.fromJson(json['city'] is Map ? Map<String, dynamic>.from(json['city']) : {}) : null;
    subArea = json['subArea'] != null ? SubArea.fromJson(json['subArea'] is Map ? Map<String, dynamic>.from(json['subArea']) : {}) : null;
    otherSubAreas = json['otherSubAreas'] != null ? List<dynamic>.from(json['otherSubAreas']) : null;
    ownerPhone = json['ownerPhone'];
    ownerName = json['ownerName'];
    detailedAddress = json['detailedAddress'];
    dailyRent = json['dailyRent'];
    monthlyRent = json['monthlyRent'];
    deliveryStatus = json['deliveryStatus']?.toString();
    numberOfRooms = json['numberOfRooms'] is int ? json['numberOfRooms'] : int.tryParse(json['numberOfRooms']?.toString() ?? '');
    numberOfBathrooms = json['numberOfBathrooms'] is int ? json['numberOfBathrooms'] : int.tryParse(json['numberOfBathrooms']?.toString() ?? '');
    finishingType = json['finishingType']?.toString();
    unitOperation = json['unitOperation']?.toString();
    compoundType = json['compoundType']?.toString();
    status = json['status']?.toString();
    view = json['view']?.toString();
    deliveryDate = json['deliveryDate']?.toString();
    diagram = json['diagram'];
    locationInMasterPlan = json['locationInMasterPlan'];
    location = json['location'];
    paymentSystem = json['paymentSystem']?.toString();
    pricePerMeterInInstallment = json['pricePerMeterInInstallment'] is int ? json['pricePerMeterInInstallment'] : int.tryParse(json['pricePerMeterInInstallment']?.toString() ?? '');
    pricePerMeterInCash = json['pricePerMeterInCash'] is int ? json['pricePerMeterInCash'] : int.tryParse(json['pricePerMeterInCash']?.toString() ?? '');
    totalPriceInInstallment = json['totalPriceInInstallment'] is int ? json['totalPriceInInstallment'] : int.tryParse(json['totalPriceInInstallment']?.toString() ?? '');
    totalPriceInCash = json['totalPriceInCash'] is int ? json['totalPriceInCash'] : int.tryParse(json['totalPriceInCash']?.toString() ?? '');
    advertisers = json['advertisers'] != null ? List<dynamic>.from(json['advertisers']) : null;
    isArchived = json['isArchived'] is int ? json['isArchived'] : int.tryParse(json['isArchived']?.toString() ?? '');
    additionalDetails = json['additionalDetails'] != null ? AdditionalDetails.fromJson(json['additionalDetails'] is Map ? Map<String, dynamic>.from(json['additionalDetails']) : {}) : null;
    if (json['otherAccessories'] != null) {
      otherAccessories = List<String>.from((json['otherAccessories'] as List).map((e) => e.toString()));
    }
    modelId = json['modelId'] is int ? json['modelId'] : int.tryParse(json['modelId']?.toString() ?? '');
    brokerId = json['brokerId'];
    broker = json['broker'] != null ? Broker.fromJson(json['broker'] is Map ? Map<String, dynamic>.from(json['broker']) : {}) : null;
    brokerUserId = json['broker_user_id'];
    brokerUserFullName = json['broker_user_full_name'];
    brokerUserEmail = json['broker_user_email'];
    brokerUserPhone = json['broker_user_phone'];
    brokerUserImage = json['broker_user_image'];
    projectName = json['projectName']?.toString();
    developerName = json['developerName']?.toString();
    project = json['project'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    gallery = json['gallery'] != null ? List<dynamic>.from(json['gallery']) : null;
    if (json['replyLog'] != null) {
      replyLog = (json['replyLog'] as List).map((e) => ReplyLog.fromJson(e is Map ? Map<String, dynamic>.from(e) : {})).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['modelCode'] = modelCode;
    map['type'] = type;
    map['unitArea'] = unitArea;
    map['buildingNumber'] = buildingNumber;
    map['unitNumber'] = unitNumber;
    map['floor'] = floor;
    if (area != null) map['area'] = area!.toJson();
    if (city != null) map['city'] = city!.toJson();
    if (subArea != null) map['subArea'] = subArea!.toJson();
    map['otherSubAreas'] = otherSubAreas;
    map['ownerPhone'] = ownerPhone;
    map['ownerName'] = ownerName;
    map['detailedAddress'] = detailedAddress;
    map['dailyRent'] = dailyRent;
    map['monthlyRent'] = monthlyRent;
    map['deliveryStatus'] = deliveryStatus;
    map['numberOfRooms'] = numberOfRooms;
    map['numberOfBathrooms'] = numberOfBathrooms;
    map['finishingType'] = finishingType;
    map['unitOperation'] = unitOperation;
    map['compoundType'] = compoundType;
    map['status'] = status;
    map['view'] = view;
    map['deliveryDate'] = deliveryDate;
    map['diagram'] = diagram;
    map['locationInMasterPlan'] = locationInMasterPlan;
    map['location'] = location;
    map['paymentSystem'] = paymentSystem;
    map['pricePerMeterInInstallment'] = pricePerMeterInInstallment;
    map['pricePerMeterInCash'] = pricePerMeterInCash;
    map['totalPriceInInstallment'] = totalPriceInInstallment;
    map['totalPriceInCash'] = totalPriceInCash;
    map['advertisers'] = advertisers;
    map['isArchived'] = isArchived;
    if (additionalDetails != null) map['additionalDetails'] = additionalDetails!.toJson();
    map['otherAccessories'] = otherAccessories;
    map['modelId'] = modelId;
    map['brokerId'] = brokerId;
    if (broker != null) map['broker'] = broker!.toJson();
    map['broker_user_id'] = brokerUserId;
    map['broker_user_full_name'] = brokerUserFullName;
    map['broker_user_email'] = brokerUserEmail;
    map['broker_user_phone'] = brokerUserPhone;
    map['broker_user_image'] = brokerUserImage;
    map['projectName'] = projectName;
    map['developerName'] = developerName;
    map['project'] = project;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['gallery'] = gallery;
    if (replyLog != null) map['replyLog'] = replyLog!.map((e) => e.toJson()).toList();
    return map;
  }

  String get displayUnitCode => modelCode?.toString() ?? id?.toString() ?? '-';
  String get displayBrokerName => broker?.name?.toString() ?? brokerUserFullName?.toString() ?? '-';
  String get displayFinishing => finishingType?.toString() ?? '-';
}
