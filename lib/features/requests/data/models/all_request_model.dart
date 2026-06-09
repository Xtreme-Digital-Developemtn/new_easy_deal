class AllRequestModel {
  final dynamic status;
  final dynamic message;
  final RequestsData data;

  AllRequestModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllRequestModel.fromJson(Map<dynamic, dynamic>? json) {
    return AllRequestModel(
      status: json?['status'] ?? '',
      message: json?['message'] ?? '',
      data: RequestsData.fromJson(json?['data']),
    );
  }
}

class RequestsData {
  final List<RequestItem> data;
  final dynamic count;
  final dynamic newRequestsCount;

  RequestsData({
    required this.data,
    required this.count,
    required this.newRequestsCount,
  });

  factory RequestsData.fromJson(Map<dynamic, dynamic>? json) {
    return RequestsData(
      data: (json?['data'] as List? ?? [])
          .map((e) => RequestItem.fromJson(e))
          .toList(),
      count: json?['count'] ?? 0,
      newRequestsCount: json?['newRequestsCount'] ?? 0,
    );
  }
}

class RequestItem {
  final dynamic id;
  final dynamic title;
  final dynamic specializationScope;
  final dynamic type;
  final dynamic unit;
  final dynamic status;
  final dynamic numberOfReplies;
  final User user;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic detailedAddress;
  final List<LocationModel> locations;
  final RequestAttributes attributes;
  final List<Broker> brokers;
  final List<AssignedBroker> assignedBrokers;

  RequestItem({
    required this.id,
    required this.title,
    required this.specializationScope,
    required this.type,
    required this.unit,
    required this.status,
    required this.numberOfReplies,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    this.detailedAddress,
    required this.locations,
    required this.attributes,
    required this.brokers,
    required this.assignedBrokers,
  });

  factory RequestItem.fromJson(Map<dynamic, dynamic>? json) {
    return RequestItem(
      id: json?['id'] ?? 0,
      title: json?['title'] ?? '',
      specializationScope: json?['specializationScope'] ?? '',
      type: json?['type'] ?? '',
      unit: json?['unit'] ?? '',
      status: json?['status'] ?? '',
      numberOfReplies: json?['numberOfReplies'] ?? 0,
      user: User.fromJson(json?['user']),
      createdAt: json?['createdAt'] ?? '',
      updatedAt: json?['updatedAt'] ?? '',
      detailedAddress: json?['detailedAddress'],
      locations: (json?['locations'] as List? ?? [])
          .map((e) => LocationModel.fromJson(e))
          .toList(),
      attributes: RequestAttributes.fromJson(json?['attributes']),
      brokers: (json?['brokers'] as List? ?? [])
          .map((e) => Broker.fromJson(e))
          .toList(),
      assignedBrokers: (json?['assignedBrokers'] as List? ?? [])
          .map((e) => AssignedBroker.fromJson(e))
          .toList(),
    );
  }
}

class User {
  final dynamic id;
  final dynamic name;
  final dynamic role;
  final dynamic image;
  final dynamic phone;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.phone,
  });

  factory User.fromJson(Map<dynamic, dynamic>? json) {
    return User(
      id: json?['id'] ?? 0,
      name: json?['name'] ?? '',
      role: json?['role'] ?? '',
      image: json?['image'] ?? '',
      phone: json?['phone'] ?? '',
    );
  }
}

class LocationModel {
  final City city;
  final List<AreaModel> areas;

  LocationModel({
    required this.city,
    required this.areas,
  });

  factory LocationModel.fromJson(Map<dynamic, dynamic>? json) {
    return LocationModel(
      city: City.fromJson(json?['city']),
      areas: (json?['areas'] as List? ?? [])
          .map((e) => AreaModel.fromJson(e))
          .toList(),
    );
  }
}

class City {
  final dynamic id;
  final dynamic nameEn;
  final dynamic nameAr;

  City({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  factory City.fromJson(Map<dynamic, dynamic>? json) {
    return City(
      id: json?['id'] ?? 0,
      nameEn: json?['name_en'] ?? '',
      nameAr: json?['name_ar'] ?? '',
    );
  }
}

class AreaModel {
  final Area area;
  final List<SubArea> subAreas;

  AreaModel({
    required this.area,
    required this.subAreas,
  });

  factory AreaModel.fromJson(Map<dynamic, dynamic>? json) {
    return AreaModel(
      area: Area.fromJson(json?['area']),
      subAreas: (json?['sub_areas'] as List? ?? [])
          .map((e) => SubArea.fromJson(e))
          .toList(),
    );
  }
}

class Area {
  final dynamic id;
  final dynamic nameEn;
  final dynamic nameAr;

  Area({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  factory Area.fromJson(Map<dynamic, dynamic>? json) {
    return Area(
      id: json?['id'] ?? 0,
      nameEn: json?['name_en'] ?? '',
      nameAr: json?['name_ar'] ?? '',
    );
  }
}

class SubArea {
  final dynamic id;
  final dynamic nameEn;
  final dynamic nameAr;
  final List<OtherSubArea> otherSubAreas;

  SubArea({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.otherSubAreas,
  });

  factory SubArea.fromJson(Map<dynamic, dynamic>? json) {
    return SubArea(
      id: json?['id'] ?? 0,
      nameEn: json?['name_en'] ?? '',
      nameAr: json?['name_ar'] ?? '',
      otherSubAreas: (json?['otherSubAreas'] as List? ?? [])
          .map((e) => OtherSubArea.fromJson(e))
          .toList(),
    );
  }
}

class OtherSubArea {
  final dynamic id;
  final dynamic name;

  OtherSubArea({
    required this.id,
    required this.name,
  });

  factory OtherSubArea.fromJson(Map<dynamic, dynamic>? json) {
    return OtherSubArea(
      id: json?['id'] ?? 0,
      name: json?['name'] ?? '',
    );
  }
}

class RequestAttributes {
  final dynamic locationSuggestions;
  final dynamic floor;
  final dynamic unitAreaMin;
  final dynamic unitAreaMax;
  final dynamic rooms;
  final dynamic bathRooms;
  final dynamic unitView;
  final dynamic finishingStatus;
  final dynamic deliveryStatus;
  final dynamic notes;
  final List<dynamic> otherAccessories;
  final dynamic paymentMethod;
  final dynamic averageUnitPriceMin;
  final dynamic averageUnitPriceMax;

  RequestAttributes({
    required this.locationSuggestions,
    required this.floor,
    required this.unitAreaMin,
    required this.unitAreaMax,
    required this.rooms,
    required this.bathRooms,
    required this.unitView,
    required this.finishingStatus,
    required this.deliveryStatus,
    required this.notes,
    required this.otherAccessories,
    required this.paymentMethod,
    required this.averageUnitPriceMin,
    required this.averageUnitPriceMax,
  });

  factory RequestAttributes.fromJson(Map<dynamic, dynamic>? json) {
    return RequestAttributes(
      locationSuggestions: json?['locationSuggestions'] ?? '',
      floor: json?['floor'] ?? '',
      unitAreaMin: json?['unitAreaMin'] ?? '',
      unitAreaMax: json?['unitAreaMax'] ?? '',
      rooms: json?['rooms'] ?? '',
      bathRooms: json?['bathRooms'] ?? '',
      unitView: json?['unitView'] ?? '',
      finishingStatus: json?['finishingStatus'] ?? '',
      deliveryStatus: json?['deliveryStatus'] ?? '',
      notes: json?['notes'] ?? '',
      otherAccessories:
      List<dynamic>.from(json?['otherAccessories'] ?? []),
      paymentMethod: json?['paymentMethod'] ?? '',
      averageUnitPriceMin: json?['averageUnitPriceMin'] ?? '',
      averageUnitPriceMax: json?['averageUnitPriceMax'] ?? '',
    );
  }
}

class Broker {
  final dynamic id;
  final dynamic accountType;
  final dynamic fullName;
  final dynamic image;
  final dynamic type;

  Broker({
    required this.id,
    required this.accountType,
    required this.fullName,
    required this.image,
    required this.type,
  });

  factory Broker.fromJson(Map<dynamic, dynamic>? json) {
    return Broker(
      id: json?['id'] ?? 0,
      accountType: json?['accountType'] ?? '',
      fullName: json?['fullName'] ?? '',
      image: json?['image'] ?? '',
      type: json?['type'] ?? '',
    );
  }
}

class AssignedBroker {
  final dynamic brokerId;
  final dynamic name;
  final dynamic senderId;
  final dynamic role;
  final dynamic phone;
  final dynamic receiverName;
  final dynamic receiverRole;
  final dynamic status;
  final dynamic createdAt;
  final dynamic updatedAt;

  AssignedBroker({
    required this.brokerId,
    required this.name,
    required this.senderId,
    required this.role,
    required this.phone,
    required this.receiverName,
    required this.receiverRole,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssignedBroker.fromJson(Map<dynamic, dynamic>? json) {
    return AssignedBroker(
      brokerId: json?['brokerId'] ?? 0,
      name: json?['name'] ?? '',
      senderId: json?['senderId'] ?? 0,
      role: json?['role'] ?? '',
      phone: json?['phone'] ?? '',
      receiverName: json?['receiverName'] ?? '',
      receiverRole: json?['receiverRole'] ?? '',
      status: json?['status'] ?? '',
      createdAt: json?['createdAt'] ?? '',
      updatedAt: json?['updatedAt'] ?? '',
    );
  }
}