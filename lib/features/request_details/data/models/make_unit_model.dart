class MakeUnitModel {
  String? status;
  String? message;
  MakeUnitData? data;

  MakeUnitModel({this.status, this.message, this.data});

  factory MakeUnitModel.fromJson(Map<String, dynamic> json) {
    return MakeUnitModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      data: json['data'] is Map<String, dynamic>
          ? MakeUnitData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };
}

class MakeUnitData {
  int? id;
  String? referenceCode;
  dynamic modelCode;
  String? type;
  String? unitArea;
  String? buildingNumber;
  String? unitNumber;
  String? floor;
  MakeUnitArea? area;
  MakeUnitCity? city;
  MakeUnitSubArea? subArea;
  List<MakeUnitOtherSubAreas>? otherSubAreas;
  String? ownerPhone;
  String? ownerName;
  String? detailedAddress;
  dynamic dailyRent;
  dynamic monthlyRent;
  String? deliveryStatus;
  String? numberOfRooms;
  String? numberOfBathrooms;
  String? finishingType;
  String? unitOperation;
  String? compoundType;
  String? status;
  String? view;
  dynamic deliveryDate;
  String? diagram;
  dynamic locationInMasterPlan;
  dynamic location;
  String? paymentSystem;
  dynamic pricePerMeterInInstallment;
  dynamic pricePerMeterInCash;
  dynamic totalPriceInInstallment;
  String? totalPriceInCash;
  List<dynamic>? advertisers;
  dynamic isArchived;
  MakeUnitAdditionalDetails? additionalDetails;
  List<String>? otherAccessories;
  dynamic modelId;
  String? brokerId;
  MakeUnitBroker? broker;
  dynamic brokerUserId;
  dynamic brokerUserFullName;
  dynamic brokerUserEmail;
  dynamic brokerUserPhone;
  dynamic brokerUserImage;
  dynamic brokerUserImageThumb;
  dynamic projectName;
  dynamic developerName;
  dynamic project;
  String? createdAt;
  String? updatedAt;
  dynamic publishedAt;
  List<dynamic>? gallery;
  List<dynamic>? replyLog;

  MakeUnitData({
    this.id,
    this.referenceCode,
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
    this.brokerUserImageThumb,
    this.projectName,
    this.developerName,
    this.project,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.gallery,
    this.replyLog,
  });

  factory MakeUnitData.fromJson(Map<String, dynamic> json) {
    return MakeUnitData(
      id: _toInt(json['id']),
      referenceCode: _toString(json['referenceCode']),
      modelCode: json['modelCode'],
      type: _toString(json['type']),
      unitArea: _toString(json['unitArea']),
      buildingNumber: _toString(json['buildingNumber']),
      unitNumber: _toString(json['unitNumber']),
      floor: _toString(json['floor']),
      area: _parseObject(json['area'], MakeUnitArea.fromJson),
      city: _parseObject(json['city'], MakeUnitCity.fromJson),
      subArea: _parseObject(json['subArea'], MakeUnitSubArea.fromJson),
      otherSubAreas: _parseList(
        json['otherSubAreas'],
        MakeUnitOtherSubAreas.fromJson,
      ),
      ownerPhone: _toString(json['ownerPhone']),
      ownerName: _toString(json['ownerName']),
      detailedAddress: _toString(json['detailedAddress']),
      dailyRent: json['dailyRent'],
      monthlyRent: json['monthlyRent'],
      deliveryStatus: _toString(json['deliveryStatus']),
      numberOfRooms: _toString(json['numberOfRooms']),
      numberOfBathrooms: _toString(json['numberOfBathrooms']),
      finishingType: _toString(json['finishingType']),
      unitOperation: _toString(json['unitOperation']),
      compoundType: _toString(json['compoundType']),
      status: _toString(json['status']),
      view: _toString(json['view']),
      deliveryDate: json['deliveryDate'],
      diagram: _toString(json['diagram']),
      locationInMasterPlan: json['locationInMasterPlan'],
      location: json['location'],
      paymentSystem: _toString(json['paymentSystem']),
      pricePerMeterInInstallment: json['pricePerMeterInInstallment'],
      pricePerMeterInCash: json['pricePerMeterInCash'],
      totalPriceInInstallment: json['totalPriceInInstallment'],
      totalPriceInCash: _toString(json['totalPriceInCash']),
      advertisers: _toDynamicList(json['advertisers']),
      isArchived: json['isArchived'],
      additionalDetails: _parseObject(
        json['additionalDetails'],
        MakeUnitAdditionalDetails.fromJson,
      ),
      otherAccessories: _toStringList(json['otherAccessories']),
      modelId: json['modelId'],
      brokerId: _toString(json['brokerId']),
      broker: _parseObject(json['broker'], MakeUnitBroker.fromJson),
      brokerUserId: json['broker_user_id'],
      brokerUserFullName: json['broker_user_full_name'],
      brokerUserEmail: json['broker_user_email'],
      brokerUserPhone: json['broker_user_phone'],
      brokerUserImage: json['broker_user_image'],
      brokerUserImageThumb: json['broker_user_image_thumb'],
      projectName: json['projectName'],
      developerName: json['developerName'],
      project: json['project'],
      createdAt: _toString(json['createdAt']),
      updatedAt: _toString(json['updatedAt']),
      publishedAt: json['publishedAt'],
      gallery: _toDynamicList(json['gallery']),
      replyLog: _toDynamicList(json['replyLog']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'referenceCode': referenceCode,
    'modelCode': modelCode,
    'type': type,
    'unitArea': unitArea,
    'buildingNumber': buildingNumber,
    'unitNumber': unitNumber,
    'floor': floor,
    'area': area?.toJson(),
    'city': city?.toJson(),
    'subArea': subArea?.toJson(),
    'otherSubAreas': otherSubAreas?.map((e) => e.toJson()).toList(),
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
    'pricePerMeterInInstallment': pricePerMeterInInstallment,
    'pricePerMeterInCash': pricePerMeterInCash,
    'totalPriceInInstallment': totalPriceInInstallment,
    'totalPriceInCash': totalPriceInCash,
    'advertisers': advertisers,
    'isArchived': isArchived,
    'additionalDetails': additionalDetails?.toJson(),
    'otherAccessories': otherAccessories,
    'modelId': modelId,
    'brokerId': brokerId,
    'broker': broker?.toJson(),
    'broker_user_id': brokerUserId,
    'broker_user_full_name': brokerUserFullName,
    'broker_user_email': brokerUserEmail,
    'broker_user_phone': brokerUserPhone,
    'broker_user_image': brokerUserImage,
    'broker_user_image_thumb': brokerUserImageThumb,
    'projectName': projectName,
    'developerName': developerName,
    'project': project,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'publishedAt': publishedAt,
    'gallery': gallery,
    'replyLog': replyLog,
  };
}

class MakeUnitArea {
  int? id;
  String? nameEn;
  String? nameAr;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  MakeUnitArea({
    this.id,
    this.nameEn,
    this.nameAr,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  factory MakeUnitArea.fromJson(Map<String, dynamic> json) => MakeUnitArea(
    id: _toInt(json['id']),
    nameEn: _toString(json['name_en']),
    nameAr: _toString(json['name_ar']),
    cityId: _toInt(json['city_id']),
    createdAt: _toString(json['created_at']),
    updatedAt: _toString(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name_en': nameEn,
    'name_ar': nameAr,
    'city_id': cityId,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class MakeUnitCity {
  int? id;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;

  MakeUnitCity({
    this.id,
    this.nameEn,
    this.nameAr,
    this.createdAt,
    this.updatedAt,
  });

  factory MakeUnitCity.fromJson(Map<String, dynamic> json) => MakeUnitCity(
    id: _toInt(json['id']),
    nameEn: _toString(json['name_en']),
    nameAr: _toString(json['name_ar']),
    createdAt: _toString(json['created_at']),
    updatedAt: _toString(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name_en': nameEn,
    'name_ar': nameAr,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class MakeUnitSubArea {
  int? id;
  String? nameEn;
  String? nameAr;
  int? areaId;
  String? createdAt;
  String? updatedAt;

  MakeUnitSubArea({
    this.id,
    this.nameEn,
    this.nameAr,
    this.areaId,
    this.createdAt,
    this.updatedAt,
  });

  factory MakeUnitSubArea.fromJson(Map<String, dynamic> json) => MakeUnitSubArea(
    id: _toInt(json['id']),
    nameEn: _toString(json['name_en']),
    nameAr: _toString(json['name_ar']),
    areaId: _toInt(json['area_id']),
    createdAt: _toString(json['created_at']),
    updatedAt: _toString(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name_en': nameEn,
    'name_ar': nameAr,
    'area_id': areaId,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class MakeUnitOtherSubAreas {
  int? id;
  String? name;
  int? subAreaId;

  MakeUnitOtherSubAreas({
    this.id,
    this.name,
    this.subAreaId,
  });

  factory MakeUnitOtherSubAreas.fromJson(Map<String, dynamic> json) =>
      MakeUnitOtherSubAreas(
        id: _toInt(json['id']),
        name: _toString(json['name']),
        subAreaId: _toInt(json['subAreaId']),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'subAreaId': subAreaId,
  };
}

class MakeUnitAdditionalDetails {
  String? unitFacing;
  String? legalStatus;
  String? floorNumber;

  MakeUnitAdditionalDetails({
    this.unitFacing,
    this.legalStatus,
    this.floorNumber,
  });

  factory MakeUnitAdditionalDetails.fromJson(Map<String, dynamic> json) =>
      MakeUnitAdditionalDetails(
        unitFacing: _toString(json['unitFacing']),
        legalStatus: _toString(json['legalStatus']),
        floorNumber: _toString(json['floorNumber']),
      );

  Map<String, dynamic> toJson() => {
    'unitFacing': unitFacing,
    'legalStatus': legalStatus,
    'floorNumber': floorNumber,
  };
}

class MakeUnitBroker {
  int? id;
  String? name;
  String? phone;

  MakeUnitBroker({
    this.id,
    this.name,
    this.phone,
  });

  factory MakeUnitBroker.fromJson(Map<String, dynamic> json) => MakeUnitBroker(
    id: _toInt(json['id']),
    name: _toString(json['name']),
    phone: _toString(json['phone']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
  };
}

// Helper methods

String? _toString(dynamic value) {
  return value?.toString();
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  return int.tryParse(value.toString());
}

T? _parseObject<T>(
    dynamic value,
    T Function(Map<String, dynamic>) fromJson,
    ) {
  if (value is Map<String, dynamic>) {
    return fromJson(value);
  }
  return null;
}

List<T>? _parseList<T>(
    dynamic value,
    T Function(Map<String, dynamic>) fromJson,
    ) {
  if (value is! List) return null;

  return value
      .whereType<Map<String, dynamic>>()
      .map(fromJson)
      .toList();
}

List<dynamic>? _toDynamicList(dynamic value) {
  if (value is List) return List<dynamic>.from(value);
  return null;
}

List<String>? _toStringList(dynamic value) {
  if (value is! List) return null;
  return value.map((e) => e.toString()).toList();
}
