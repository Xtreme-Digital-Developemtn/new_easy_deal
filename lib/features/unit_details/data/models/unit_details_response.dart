class UnitDetailsResponse {
  final dynamic status;
  final dynamic message;
  final dynamic data;

  UnitDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory UnitDetailsResponse.fromJson(Map<String, dynamic> json) {
    return UnitDetailsResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UnitData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UnitData {
  final dynamic id;
  final dynamic modelCode;
  final dynamic type;
  final dynamic unitArea;
  final dynamic buildingNumber;
  final dynamic unitNumber;
  final dynamic floor;
  final dynamic area;
  final dynamic city;
  final dynamic subArea;
  final dynamic otherSubAreas;
  final dynamic ownerPhone;
  final dynamic ownerName;
  final dynamic detailedAddress;
  final dynamic dailyRent;
  final dynamic monthlyRent;
  final dynamic deliveryStatus;
  final dynamic numberOfRooms;
  final dynamic numberOfBathrooms;
  final dynamic finishingType;
  final dynamic unitOperation;
  final dynamic compoundType;
  final dynamic status;
  final dynamic view;
  final dynamic deliveryDate;
  final dynamic diagram;
  final dynamic locationInMasterPlan;
  final dynamic location;
  final dynamic paymentSystem;
  final dynamic pricePerMeterInInstallment;
  final dynamic pricePerMeterInCash;
  final dynamic totalPriceInInstallment;
  final dynamic totalPriceInCash;
  final dynamic advertisers;
  final dynamic isArchived;
  final dynamic additionalDetails;
  final List<dynamic>? otherAccessories;
  final dynamic modelId;
  final dynamic brokerId;
  final dynamic broker;
  final dynamic brokerUserId;
  final dynamic brokerUserFullName;
  final dynamic brokerUserEmail;
  final dynamic brokerUserPhone;
  final dynamic brokerUserImage;
  final dynamic projectName;
  final dynamic developerName;
  final dynamic project;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic gallery;
  final dynamic replyLog;

  UnitData({
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

  factory UnitData.fromJson(Map<String, dynamic> json) {
    return UnitData(
      id: json['id'],
      modelCode: json['modelCode'],
      type: json['type'],
      unitArea: json['unitArea'],
      buildingNumber: json['buildingNumber'],
      unitNumber: json['unitNumber'],
      floor: json['floor'],
      area: json['area'] != null ? Area.fromJson(json['area']) : null,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      subArea: json['subArea'] != null ? SubArea.fromJson(json['subArea']) : null,
      otherSubAreas: json['otherSubAreas'] != null
          ? (json['otherSubAreas'] as List)
          .map((e) => OtherSubArea.fromJson(e))
          .toList()
          : null,
      ownerPhone: json['ownerPhone'],
      ownerName: json['ownerName'],
      detailedAddress: json['detailedAddress'],
      dailyRent: json['dailyRent'],
      monthlyRent: json['monthlyRent'],
      deliveryStatus: json['deliveryStatus'],
      numberOfRooms: json['numberOfRooms'],
      numberOfBathrooms: json['numberOfBathrooms'],
      finishingType: json['finishingType'],
      unitOperation: json['unitOperation'],
      compoundType: json['compoundType'],
      status: json['status'],
      view: json['view'],
      deliveryDate: json['deliveryDate'],
      diagram: json['diagram'],
      locationInMasterPlan: json['locationInMasterPlan'],
      location: json['location'],
      paymentSystem: json['paymentSystem'],
      pricePerMeterInInstallment: json['pricePerMeterInInstallment'],
      pricePerMeterInCash: json['pricePerMeterInCash'],
      totalPriceInInstallment: json['totalPriceInInstallment'],
      totalPriceInCash: json['totalPriceInCash'],
      advertisers: json['advertisers'] != null
          ? (json['advertisers'] as List)
          .map((e) => Advertiser.fromJson(e))
          .toList()
          : null,
      isArchived: json['isArchived'],
      additionalDetails: json['additionalDetails'] != null
          ? AdditionalDetails.fromJson(json['additionalDetails'])
          : null,
      otherAccessories: (json['otherAccessories'] as dynamic)
          ?.map((e) => e.toString())
          .toList() ?? [],
      modelId: json['modelId'],
      brokerId: json['brokerId'],
      broker: json['broker'] != null ? Broker.fromJson(json['broker']) : null,
      brokerUserId: json['broker_user_id'],
      brokerUserFullName: json['broker_user_full_name'],
      brokerUserEmail: json['broker_user_email'],
      brokerUserPhone: json['broker_user_phone'],
      brokerUserImage: json['broker_user_image'],
      projectName: json['projectName'],
      developerName: json['developerName'],
      project: json['project'] != null ? Project.fromJson(json['project']) : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      gallery: json['gallery'] != null
          ? (json['gallery'] as List)
          .map((e) => GalleryItem.fromJson(e))
          .toList()
          : null,
      replyLog: json['replyLog'] != null
          ? (json['replyLog'] as List)
          .map((e) => ReplyLog.fromJson(e))
          .toList()
          : null,
    );
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
      'otherSubAreas': otherSubAreas != null
          ? (otherSubAreas as List).map((e) => e.toJson()).toList()
          : null,
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
      'advertisers': advertisers != null
          ? (advertisers as List).map((e) => e.toJson()).toList()
          : null,
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
      'projectName': projectName,
      'developerName': developerName,
      'project': project?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'gallery': gallery != null
          ? (gallery as List).map((e) => e.toJson()).toList()
          : null,
      'replyLog': replyLog != null
          ? (replyLog as List).map((e) => e.toJson()).toList()
          : null,
    };
  }
}

class Area {
  final dynamic id;
  final dynamic nameEn;
  final dynamic nameAr;
  final dynamic cityId;
  final dynamic createdAt;
  final dynamic updatedAt;

  Area({
    this.id,
    this.nameEn,
    this.nameAr,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      cityId: json['city_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'city_id': cityId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class City {
  final dynamic id;
  final dynamic nameEn;
  final dynamic nameAr;
  final dynamic createdAt;
  final dynamic updatedAt;

  City({
    this.id,
    this.nameEn,
    this.nameAr,
    this.createdAt,
    this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class SubArea {
  final dynamic id;
  final dynamic nameEn;
  final dynamic nameAr;
  final dynamic areaId;
  final dynamic createdAt;
  final dynamic updatedAt;

  SubArea({
    this.id,
    this.nameEn,
    this.nameAr,
    this.areaId,
    this.createdAt,
    this.updatedAt,
  });

  factory SubArea.fromJson(Map<String, dynamic> json) {
    return SubArea(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      areaId: json['area_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'area_id': areaId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class OtherSubArea {
  final dynamic id;
  final dynamic name;
  final dynamic subAreaId;

  OtherSubArea({
    this.id,
    this.name,
    this.subAreaId,
  });

  factory OtherSubArea.fromJson(Map<String, dynamic> json) {
    return OtherSubArea(
      id: json['id'],
      name: json['name'],
      subAreaId: json['subAreaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subAreaId': subAreaId,
    };
  }
}

class Advertiser {
  final dynamic caption;
  final dynamic creatorId;
  final dynamic advertiserId;
  final dynamic advertiserFullName;
  final dynamic advertiserEmail;
  final dynamic advertiserPhone;
  final dynamic createdAt;

  Advertiser({
    this.caption,
    this.creatorId,
    this.advertiserId,
    this.advertiserFullName,
    this.advertiserEmail,
    this.advertiserPhone,
    this.createdAt,
  });

  factory Advertiser.fromJson(Map<String, dynamic> json) {
    return Advertiser(
      caption: json['caption'],
      creatorId: json['creatorId'],
      advertiserId: json['advertiserId'],
      advertiserFullName: json['advertiserFullName'],
      advertiserEmail: json['advertiserEmail'],
      advertiserPhone: json['advertiserPhone'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
      'creatorId': creatorId,
      'advertiserId': advertiserId,
      'advertiserFullName': advertiserFullName,
      'advertiserEmail': advertiserEmail,
      'advertiserPhone': advertiserPhone,
      'createdAt': createdAt,
    };
  }
}

class AdditionalDetails {
  final dynamic notes;
  final dynamic unitFacing;
  final dynamic floorNumber;
  final dynamic otherExpensesValue;

  AdditionalDetails({
    this.notes,
    this.unitFacing,
    this.floorNumber,
    this.otherExpensesValue,
  });

  factory AdditionalDetails.fromJson(Map<String, dynamic> json) {
    return AdditionalDetails(
      notes: json['notes'],
      unitFacing: json['unitFacing'],
      floorNumber: json['floorNumber'],
      otherExpensesValue: json['otherExpensesValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notes': notes,
      'unitFacing': unitFacing,
      'floorNumber': floorNumber,
      'otherExpensesValue': otherExpensesValue,
    };
  }
}

class Broker {
  final dynamic id;
  final dynamic name;
  final dynamic phone;

  Broker({
    this.id,
    this.name,
    this.phone,
  });

  factory Broker.fromJson(Map<String, dynamic> json) {
    return Broker(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}

class Project {
  final dynamic id;
  final dynamic name;
  final dynamic designer;
  final dynamic projectExecutor;
  final dynamic managementTeam;
  final dynamic city;
  final dynamic area;
  final dynamic subArea;
  final dynamic otherSubAreas;
  final dynamic type;
  final dynamic projectType;
  final dynamic developer;
  final dynamic address;
  final dynamic googleMapUrl;
  final dynamic apartmentsCount;
  final dynamic duplexesCount;
  final dynamic penthousesCount;
  final dynamic iVillaCount;
  final dynamic studiosCount;
  final dynamic roofsCount;
  final dynamic basementsCount;
  final dynamic twinHousesCount;
  final dynamic townHousesCount;
  final dynamic standaloneVillasCount;
  final dynamic administrativeUnitsCount;
  final dynamic commercialUnitsCount;
  final dynamic medicalClinicsCount;
  final dynamic pharmaciesCount;
  final dynamic commercialAdministrativeBuildingCount;
  final dynamic models;
  final dynamic logoImage;
  final dynamic coverImage;
  final dynamic masterPlan;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic gallery;

  Project({
    this.id,
    this.name,
    this.designer,
    this.projectExecutor,
    this.managementTeam,
    this.city,
    this.area,
    this.subArea,
    this.otherSubAreas,
    this.type,
    this.projectType,
    this.developer,
    this.address,
    this.googleMapUrl,
    this.apartmentsCount,
    this.duplexesCount,
    this.penthousesCount,
    this.iVillaCount,
    this.studiosCount,
    this.roofsCount,
    this.basementsCount,
    this.twinHousesCount,
    this.townHousesCount,
    this.standaloneVillasCount,
    this.administrativeUnitsCount,
    this.commercialUnitsCount,
    this.medicalClinicsCount,
    this.pharmaciesCount,
    this.commercialAdministrativeBuildingCount,
    this.models,
    this.logoImage,
    this.coverImage,
    this.masterPlan,
    this.createdAt,
    this.updatedAt,
    this.gallery,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      designer: json['designer'],
      projectExecutor: json['projectExecutor'],
      managementTeam: json['managementTeam'],
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      area: json['area'] != null ? Area.fromJson(json['area']) : null,
      subArea: json['subArea'] != null ? SubArea.fromJson(json['subArea']) : null,
      otherSubAreas: json['otherSubAreas'] != null
          ? (json['otherSubAreas'] as List)
          .map((e) => OtherSubArea.fromJson(e))
          .toList()
          : null,
      type: json['type'],
      projectType: json['projectType'],
      developer: json['developer'] != null ? Developer.fromJson(json['developer']) : null,
      address: json['address'],
      googleMapUrl: json['googleMapUrl'],
      apartmentsCount: json['apartmentsCount'],
      duplexesCount: json['duplexesCount'],
      penthousesCount: json['penthousesCount'],
      iVillaCount: json['iVillaCount'],
      studiosCount: json['studiosCount'],
      roofsCount: json['roofsCount'],
      basementsCount: json['basementsCount'],
      twinHousesCount: json['twinHousesCount'],
      townHousesCount: json['townHousesCount'],
      standaloneVillasCount: json['standaloneVillasCount'],
      administrativeUnitsCount: json['administrativeUnitsCount'],
      commercialUnitsCount: json['commercialUnitsCount'],
      medicalClinicsCount: json['medicalClinicsCount'],
      pharmaciesCount: json['pharmaciesCount'],
      commercialAdministrativeBuildingCount: json['commercialAdministrativeBuildingCount'],
      models: json['models'] != null
          ? (json['models'] as List)
          .map((e) => ProjectModel.fromJson(e))
          .toList()
          : null,
      logoImage: json['logoImage'],
      coverImage: json['coverImage'],
      masterPlan: json['masterPlan'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      gallery: json['gallery'] != null
          ? (json['gallery'] as List)
          .map((e) => GalleryItem.fromJson(e))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designer': designer,
      'projectExecutor': projectExecutor,
      'managementTeam': managementTeam,
      'city': city?.toJson(),
      'area': area?.toJson(),
      'subArea': subArea?.toJson(),
      'otherSubAreas': otherSubAreas != null
          ? (otherSubAreas as List).map((e) => e.toJson()).toList()
          : null,
      'type': type,
      'projectType': projectType,
      'developer': developer?.toJson(),
      'address': address,
      'googleMapUrl': googleMapUrl,
      'apartmentsCount': apartmentsCount,
      'duplexesCount': duplexesCount,
      'penthousesCount': penthousesCount,
      'iVillaCount': iVillaCount,
      'studiosCount': studiosCount,
      'roofsCount': roofsCount,
      'basementsCount': basementsCount,
      'twinHousesCount': twinHousesCount,
      'townHousesCount': townHousesCount,
      'standaloneVillasCount': standaloneVillasCount,
      'administrativeUnitsCount': administrativeUnitsCount,
      'commercialUnitsCount': commercialUnitsCount,
      'medicalClinicsCount': medicalClinicsCount,
      'pharmaciesCount': pharmaciesCount,
      'commercialAdministrativeBuildingCount': commercialAdministrativeBuildingCount,
      'models': models != null
          ? (models as List).map((e) => e.toJson()).toList()
          : null,
      'logoImage': logoImage,
      'coverImage': coverImage,
      'masterPlan': masterPlan,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'gallery': gallery != null
          ? (gallery as List).map((e) => e.toJson()).toList()
          : null,
    };
  }
}

class Developer {
  final dynamic id;
  final dynamic userId;
  final dynamic contractDuration;
  final dynamic contractStartDate;
  final dynamic contractEndDate;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic user;

  Developer({
    this.id,
    this.userId,
    this.contractDuration,
    this.contractStartDate,
    this.contractEndDate,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      id: json['id'],
      userId: json['user_id'],
      contractDuration: json['contract_duration'],
      contractStartDate: json['contract_start_date'],
      contractEndDate: json['contract_end_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: json['user'] != null ? DeveloperUser.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'contract_duration': contractDuration,
      'contract_start_date': contractStartDate,
      'contract_end_date': contractEndDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user': user?.toJson(),
    };
  }
}

class DeveloperUser {
  final dynamic id;
  final dynamic fullName;
  final dynamic email;
  final dynamic phone;
  final dynamic apiToken;
  final dynamic fcmToken;
  final dynamic gender;
  final dynamic image;
  final dynamic isActive;
  final dynamic isVerified;
  final dynamic role;
  final dynamic parentId;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic commercialRegistryImage;
  final dynamic taxCardImage;
  final dynamic idBack;
  final dynamic idFront;
  final dynamic parent;

  DeveloperUser({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.apiToken,
    this.fcmToken,
    this.gender,
    this.image,
    this.isActive,
    this.isVerified,
    this.role,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.commercialRegistryImage,
    this.taxCardImage,
    this.idBack,
    this.idFront,
    this.parent,
  });

  factory DeveloperUser.fromJson(Map<String, dynamic> json) {
    return DeveloperUser(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      apiToken: json['api_token'],
      fcmToken: json['fcm_token'],
      gender: json['gender'],
      image: json['image'],
      isActive: json['is_active'],
      isVerified: json['is_verified'],
      role: json['role'],
      parentId: json['parent_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      commercialRegistryImage: json['commercialRegistryImage'],
      taxCardImage: json['taxCardImage'],
      idBack: json['idBack'],
      idFront: json['idFront'],
      parent: json['parent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'api_token': apiToken,
      'fcm_token': fcmToken,
      'gender': gender,
      'image': image,
      'is_active': isActive,
      'is_verified': isVerified,
      'role': role,
      'parent_id': parentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'commercialRegistryImage': commercialRegistryImage,
      'taxCardImage': taxCardImage,
      'idBack': idBack,
      'idFront': idFront,
      'parent': parent,
    };
  }
}

class ProjectModel {
  final dynamic id;
  final dynamic subUnitType;
  final dynamic unitType;
  final dynamic numberOfUnits;
  final dynamic numberOfRooms;
  final dynamic numberOfBathrooms;
  final dynamic unitArea;
  final dynamic landingArea;

  ProjectModel({
    this.id,
    this.subUnitType,
    this.unitType,
    this.numberOfUnits,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.unitArea,
    this.landingArea,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      subUnitType: json['sub_unit_type'],
      unitType: json['unit_type'],
      numberOfUnits: json['number_of_units'],
      numberOfRooms: json['number_of_rooms'],
      numberOfBathrooms: json['number_of_bathrooms'],
      unitArea: json['unit_area'],
      landingArea: json['landing_area'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sub_unit_type': subUnitType,
      'unit_type': unitType,
      'number_of_units': numberOfUnits,
      'number_of_rooms': numberOfRooms,
      'number_of_bathrooms': numberOfBathrooms,
      'unit_area': unitArea,
      'landing_area': landingArea,
    };
  }
}

class GalleryItem {
  final dynamic id;
  final dynamic url;
  final dynamic type;

  GalleryItem({
    this.id,
    this.url,
    this.type,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['id'],
      url: json['url'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'type': type,
    };
  }
}

class ReplyLog {
  final dynamic unitId;
  final dynamic replyId;
  final dynamic senderId;
  final dynamic receiverId;
  final dynamic senderName;
  final dynamic senderPhone;
  final dynamic receiverName;
  final dynamic receiverPhone;
  final dynamic requestBrokerId;

  ReplyLog({
    this.unitId,
    this.replyId,
    this.senderId,
    this.receiverId,
    this.senderName,
    this.senderPhone,
    this.receiverName,
    this.receiverPhone,
    this.requestBrokerId,
  });

  factory ReplyLog.fromJson(Map<String, dynamic> json) {
    return ReplyLog(
      unitId: json['unit_id'],
      replyId: json['reply_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      senderName: json['sender_name'],
      senderPhone: json['sender_phone'],
      receiverName: json['receiver_name'],
      receiverPhone: json['receiver_phone'],
      requestBrokerId: json['request_broker_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unit_id': unitId,
      'reply_id': replyId,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'sender_name': senderName,
      'sender_phone': senderPhone,
      'receiver_name': receiverName,
      'receiver_phone': receiverPhone,
      'request_broker_id': requestBrokerId,
    };
  }
}