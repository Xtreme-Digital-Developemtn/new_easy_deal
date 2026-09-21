import '../../../broker_features/boker_data/data/models/broker_units_model.dart';

class RepliesModel {
  String? status;
  String? message;
  List<ReplyData>? data;
  int? count;

  RepliesModel({
    this.status,
    this.message,
    this.data,
    this.count,
  });

  RepliesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((e) => ReplyData.fromJson(e))
          .toList();
    }

    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
      'count': count,
    };
  }
}

class ReplyData {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? requestId;

  dynamic managementTeam;

  int? brokerId;
  String? brokerName;
  String? brokerPhone;
  int? userId;

  List<Units>? units;

  ReplyData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.requestId,
    this.managementTeam,
    this.brokerId,
    this.brokerName,
    this.brokerPhone,
    this.userId,
    this.units,
  });

  ReplyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    requestId = json['requestId'];

    managementTeam = json['managementTeam'];

    brokerId = json['brokerId'];
    brokerName = json['brokerName'];
    brokerPhone = json['brokerPhone'];
    userId = json['userId'];

    if (json['units'] != null) {
      units = (json['units'] as List)
          .map((e) => Units.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'requestId': requestId,
      'managementTeam': managementTeam,
      'brokerId': brokerId,
      'brokerName': brokerName,
      'brokerPhone': brokerPhone,
      'userId': userId,
      'units': units?.map((e) => e.toJson()).toList(),
    };
  }
}

class Units {
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

  List<dynamic>? advertisers;

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

  Units({
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

  Units.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelCode = json['modelCode'];

    type = json['type'];
    unitArea = json['unitArea'];
    buildingNumber = json['buildingNumber'];
    unitNumber = json['unitNumber'];
    floor = json['floor'];

    area = json['area'] != null
        ? Area.fromJson(json['area'])
        : null;

    city = json['city'] != null
        ? City.fromJson(json['city'])
        : null;

    subArea = json['subArea'] != null
        ? SubArea.fromJson(json['subArea'])
        : null;

    otherSubAreas = json['otherSubAreas'] != null
        ? List<dynamic>.from(json['otherSubAreas'])
        : null;

    ownerPhone = json['ownerPhone'];
    ownerName = json['ownerName'];
    detailedAddress = json['detailedAddress'];

    dailyRent = json['dailyRent'];
    monthlyRent = json['monthlyRent'];

    deliveryStatus = json['deliveryStatus'];

    numberOfRooms = json['numberOfRooms'];
    numberOfBathrooms = json['numberOfBathrooms'];

    finishingType = json['finishingType'];
    unitOperation = json['unitOperation'];
    compoundType = json['compoundType'];
    status = json['status'];
    view = json['view'];
    deliveryDate = json['deliveryDate'];

    diagram = json['diagram'];
    locationInMasterPlan = json['locationInMasterPlan'];
    location = json['location'];

    paymentSystem = json['paymentSystem'];

    pricePerMeterInInstallment =
    json['pricePerMeterInInstallment'];

    pricePerMeterInCash =
    json['pricePerMeterInCash'];

    totalPriceInInstallment =
    json['totalPriceInInstallment'];

    totalPriceInCash =
    json['totalPriceInCash'];

    advertisers = json['advertisers'] != null
        ? List<dynamic>.from(json['advertisers'])
        : null;

    isArchived = json['isArchived'];

    additionalDetails = json['additionalDetails'] != null
        ? AdditionalDetails.fromJson(
      json['additionalDetails'],
    )
        : null;

    if (json['otherAccessories'] != null) {
      otherAccessories =
      List<String>.from(json['otherAccessories']);
    }

    modelId = json['modelId'];

    brokerId = json['brokerId'];

    broker = json['broker'] != null
        ? Broker.fromJson(json['broker'])
        : null;

    brokerUserId = json['broker_user_id'];
    brokerUserFullName = json['broker_user_full_name'];
    brokerUserEmail = json['broker_user_email'];
    brokerUserPhone = json['broker_user_phone'];
    brokerUserImage = json['broker_user_image'];

    projectName = json['projectName'];
    developerName = json['developerName'];
    project = json['project'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    gallery = json['gallery'] != null
        ? List<dynamic>.from(json['gallery'])
        : null;

    if (json['replyLog'] != null) {
      replyLog = (json['replyLog'] as List)
          .map((e) => ReplyLog.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'modelCode': modelCode,
      'type': type,
      'unitArea': unitArea,
      'buildingNumber': buildingNumber,
      'unitNumber': unitNumber,
      'floor': floor,

      'area': area?.toJson(),
      'city': city?.toJson(),
      'subArea': subArea?.toJson(),

      'otherSubAreas': otherSubAreas,

      'ownerPhone': ownerPhone,
      'ownerName': ownerName,
      'detailedAddress': detailedAddress,

      'dailyRent': dailyRent,
      'monthlyRent': monthlyRent,

      'deliveryStatus': deliveryStatus,

      'numberOfRooms': numberOfRooms,
      'numberOfBathrooms': numberOfBathrooms,

      'finishingType': finishingType,
      'unitOperation': unitOperation,
      'compoundType': compoundType,
      'status': status,
      'view': view,
      'deliveryDate': deliveryDate,

      'diagram': diagram,
      'locationInMasterPlan': locationInMasterPlan,
      'location': location,

      'paymentSystem': paymentSystem,

      'pricePerMeterInInstallment':
      pricePerMeterInInstallment,

      'pricePerMeterInCash':
      pricePerMeterInCash,

      'totalPriceInInstallment':
      totalPriceInInstallment,

      'totalPriceInCash':
      totalPriceInCash,

      'advertisers': advertisers,

      'isArchived': isArchived,

      'additionalDetails':
      additionalDetails?.toJson(),

      'otherAccessories': otherAccessories,

      'modelId': modelId,

      'brokerId': brokerId,

      'broker': broker?.toJson(),

      'broker_user_id': brokerUserId,
      'broker_user_full_name': brokerUserFullName,
      'broker_user_email': brokerUserEmail,
      'broker_user_phone': brokerUserPhone,
      'broker_user_image': brokerUserImage,

      'projectName': projectName,
      'developerName': developerName,
      'project': project,

      'createdAt': createdAt,
      'updatedAt': updatedAt,

      'gallery': gallery,

      'replyLog':
      replyLog?.map((e) => e.toJson()).toList(),
    };
  }
}