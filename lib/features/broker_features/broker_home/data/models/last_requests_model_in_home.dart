class LastRequestsModelInHome {
  final String? status;
  final String? message;
  final int? count;
  final List<LastRequestItem> data;

  const LastRequestsModelInHome({
    this.status,
    this.message,
    this.count,
    this.data = const [],
  });

  factory LastRequestsModelInHome.fromJson(Map<String, dynamic> json) {
    return LastRequestsModelInHome(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      count: json['count'] is int ? json['count'] as int : int.tryParse(json['count']?.toString() ?? ''),
      data: _parseList(
        json['data'],
        LastRequestItem.fromJson,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'count': count,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }

  static List<T> _parseList<T>(
      dynamic value,
      T Function(Map<String, dynamic>) fromJson,
      ) {
    if (value is! List) return [];

    return value
        .whereType<Map>()
        .map((e) => fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}

// ============================================================
// Request
// ============================================================

class LastRequestItem {
  final int? id;
  final String? title;
  final String? specializationScope;
  final String? type;
  final String? unit;
  final String? status;
  final int? numberOfReplies;

  final LastRequestUser? user;

  final String? createdAt;
  final String? updatedAt;

  final String? detailedAddress;

  final List<RequestLocation> locations;

  final RequestAttributes? attributes;

  final List<RequestBroker> brokers;

  final String? mainImage;
  final String? unitInMasterPlanImage;

  final List<String> gallery;

  final List<AssignedBroker> assignedBrokers;

  const LastRequestItem({
    this.id,
    this.title,
    this.specializationScope,
    this.type,
    this.unit,
    this.status,
    this.numberOfReplies,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.detailedAddress,
    this.locations = const [],
    this.attributes,
    this.brokers = const [],
    this.mainImage,
    this.unitInMasterPlanImage,
    this.gallery = const [],
    this.assignedBrokers = const [],
  });

  factory LastRequestItem.fromJson(Map<String, dynamic> json) {
    return LastRequestItem(
      id: _toInt(json['id']),
      title: json['title']?.toString(),
      specializationScope:
      json['specializationScope']?.toString(),
      type: json['type']?.toString(),
      unit: json['unit']?.toString(),
      status: json['status']?.toString(),
      numberOfReplies: _toInt(json['numberOfReplies']),

      user: _parseObject(
        json['user'],
        LastRequestUser.fromJson,
      ),

      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
      detailedAddress: json['detailedAddress']?.toString(),

      locations: _parseList(
        json['locations'],
        RequestLocation.fromJson,
      ),

      attributes: _parseObject(
        json['attributes'],
        RequestAttributes.fromJson,
      ),

      brokers: _parseList(
        json['brokers'],
        RequestBroker.fromJson,
      ),

      mainImage: json['mainImage']?.toString(),
      unitInMasterPlanImage:
      json['unitInMasterPlanImage']?.toString(),

      gallery: _parseStringList(json['gallery']),

      assignedBrokers: _parseList(
        json['assignedBrokers'],
        AssignedBroker.fromJson,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'specializationScope': specializationScope,
      'type': type,
      'unit': unit,
      'status': status,
      'numberOfReplies': numberOfReplies,
      'user': user?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'detailedAddress': detailedAddress,
      'locations': locations.map((e) => e.toJson()).toList(),
      'attributes': attributes?.toJson(),
      'brokers': brokers.map((e) => e.toJson()).toList(),
      'mainImage': mainImage,
      'unitInMasterPlanImage': unitInMasterPlanImage,
      'gallery': gallery,
      'assignedBrokers':
      assignedBrokers.map((e) => e.toJson()).toList(),
    };
  }
}

// ============================================================
// User
// ============================================================

class LastRequestUser {
  final String? name;
  final String? role;
  final int? id;
  final String? image;
  final String? phone;

  const LastRequestUser({
    this.name,
    this.role,
    this.id,
    this.image,
    this.phone,
  });

  factory LastRequestUser.fromJson(Map<String, dynamic> json) {
    return LastRequestUser(
      name: json['name']?.toString(),
      role: json['role']?.toString(),
      id: _toInt(json['id']),
      image: json['image']?.toString(),
      phone: json['phone']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'id': id,
      'image': image,
      'phone': phone,
    };
  }
}

// ============================================================
// Location
// ============================================================

class RequestLocation {
  final RequestCity? city;
  final List<RequestAreaWrapper> areas;

  const RequestLocation({
    this.city,
    this.areas = const [],
  });

  factory RequestLocation.fromJson(Map<String, dynamic> json) {
    return RequestLocation(
      city: _parseObject(
        json['city'],
        RequestCity.fromJson,
      ),
      areas: _parseList(
        json['areas'],
        RequestAreaWrapper.fromJson,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city?.toJson(),
      'areas': areas.map((e) => e.toJson()).toList(),
    };
  }
}

class RequestCity {
  final int? id;
  final String? nameEn;
  final String? nameAr;

  const RequestCity({
    this.id,
    this.nameEn,
    this.nameAr,
  });

  factory RequestCity.fromJson(Map<String, dynamic> json) {
    return RequestCity(
      id: _toInt(json['id']),
      nameEn: json['name_en']?.toString(),
      nameAr: json['name_ar']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
    };
  }
}

class RequestAreaWrapper {
  final RequestArea? area;
  final List<RequestSubArea> subAreas;

  const RequestAreaWrapper({
    this.area,
    this.subAreas = const [],
  });

  factory RequestAreaWrapper.fromJson(
      Map<String, dynamic> json,
      ) {
    return RequestAreaWrapper(
      area: _parseObject(
        json['area'],
        RequestArea.fromJson,
      ),
      subAreas: _parseList(
        json['sub_areas'],
        RequestSubArea.fromJson,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'area': area?.toJson(),
      'sub_areas':
      subAreas.map((e) => e.toJson()).toList(),
    };
  }
}

class RequestArea {
  final int? id;
  final String? nameEn;
  final String? nameAr;

  const RequestArea({
    this.id,
    this.nameEn,
    this.nameAr,
  });

  factory RequestArea.fromJson(Map<String, dynamic> json) {
    return RequestArea(
      id: _toInt(json['id']),
      nameEn: json['name_en']?.toString(),
      nameAr: json['name_ar']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
    };
  }
}

class RequestSubArea {
  final int? id;
  final String? nameEn;
  final String? nameAr;
  final List<OtherSubArea> otherSubAreas;

  const RequestSubArea({
    this.id,
    this.nameEn,
    this.nameAr,
    this.otherSubAreas = const [],
  });

  factory RequestSubArea.fromJson(
      Map<String, dynamic> json,
      ) {
    return RequestSubArea(
      id: _toInt(json['id']),
      nameEn: json['name_en']?.toString(),
      nameAr: json['name_ar']?.toString(),
      otherSubAreas: _parseList(
        json['otherSubAreas'],
        OtherSubArea.fromJson,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'otherSubAreas':
      otherSubAreas.map((e) => e.toJson()).toList(),
    };
  }
}

class OtherSubArea {
  final int? id;
  final String? name;

  const OtherSubArea({
    this.id,
    this.name,
  });

  factory OtherSubArea.fromJson(Map<String, dynamic> json) {
    return OtherSubArea(
      id: _toInt(json['id']),
      name: json['name']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// ============================================================
// Attributes
// ============================================================

class RequestAttributes {
  final dynamic locationSuggestions;
  final dynamic areaSuggestions;
  final dynamic unitPriceSuggestions;

  final String? floor;

  final dynamic unitAreaMin;
  final dynamic unitAreaMax;

  final dynamic rooms;
  final dynamic bathRooms;

  final String? unitView;
  final String? finishingStatus;
  final String? deliveryStatus;

  final String? notes;

  final List<String> otherAccessories;

  final String? paymentMethod;

  final dynamic averageUnitPriceMin;
  final dynamic averageUnitPriceMax;

  const RequestAttributes({
    this.locationSuggestions,
    this.areaSuggestions,
    this.unitPriceSuggestions,
    this.floor,
    this.unitAreaMin,
    this.unitAreaMax,
    this.rooms,
    this.bathRooms,
    this.unitView,
    this.finishingStatus,
    this.deliveryStatus,
    this.notes,
    this.otherAccessories = const [],
    this.paymentMethod,
    this.averageUnitPriceMin,
    this.averageUnitPriceMax,
  });

  factory RequestAttributes.fromJson(
      Map<String, dynamic> json,
      ) {
    return RequestAttributes(
      locationSuggestions: json['locationSuggestions'],
      areaSuggestions: json['areaSuggestions'],
      unitPriceSuggestions: json['unitPriceSuggestions'],

      floor: json['floor']?.toString(),

      unitAreaMin: json['unitAreaMin'],
      unitAreaMax: json['unitAreaMax'],

      rooms: json['rooms'],
      bathRooms: json['bathRooms'],

      unitView: json['unitView']?.toString(),
      finishingStatus:
      json['finishingStatus']?.toString(),
      deliveryStatus:
      json['deliveryStatus']?.toString(),

      notes: json['notes']?.toString(),

      otherAccessories:
      _parseStringList(json['otherAccessories']),

      paymentMethod:
      json['paymentMethod']?.toString(),

      averageUnitPriceMin:
      json['averageUnitPriceMin'],

      averageUnitPriceMax:
      json['averageUnitPriceMax'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'locationSuggestions': locationSuggestions,
      'areaSuggestions': areaSuggestions,
      'unitPriceSuggestions': unitPriceSuggestions,
      'floor': floor,
      'unitAreaMin': unitAreaMin,
      'unitAreaMax': unitAreaMax,
      'rooms': rooms,
      'bathRooms': bathRooms,
      'unitView': unitView,
      'finishingStatus': finishingStatus,
      'deliveryStatus': deliveryStatus,
      'notes': notes,
      'otherAccessories': otherAccessories,
      'paymentMethod': paymentMethod,
      'averageUnitPriceMin': averageUnitPriceMin,
      'averageUnitPriceMax': averageUnitPriceMax,
    };
  }
}

// ============================================================
// Broker
// ============================================================

class RequestBroker {
  final int? id;
  final String? accountType;
  final String? fullName;
  final String? image;
  final double? averageRating;
  final int? ratingCount;
  final String? type;

  final List<BrokerSpecialization> specializations;
  final List<BrokerArea> areas;

  const RequestBroker({
    this.id,
    this.accountType,
    this.fullName,
    this.image,
    this.averageRating,
    this.ratingCount,
    this.type,
    this.specializations = const [],
    this.areas = const [],
  });

  factory RequestBroker.fromJson(
      Map<String, dynamic> json,
      ) {
    return RequestBroker(
      id: _toInt(json['id']),
      accountType: json['accountType']?.toString(),
      fullName: json['fullName']?.toString(),
      image: json['image']?.toString(),
      averageRating: _toDouble(json['averageRating']),
      ratingCount: _toInt(json['ratingCount']),
      type: json['type']?.toString(),

      specializations: _parseList(
        json['specializations'],
        BrokerSpecialization.fromJson,
      ),

      areas: _parseList(
        json['areas'],
        BrokerArea.fromJson,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountType': accountType,
      'fullName': fullName,
      'image': image,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
      'type': type,
      'specializations':
      specializations.map((e) => e.toJson()).toList(),
      'areas': areas.map((e) => e.toJson()).toList(),
    };
  }
}

class BrokerSpecialization {
  final int? id;
  final String? specialization;
  final String? specializationScope;

  const BrokerSpecialization({
    this.id,
    this.specialization,
    this.specializationScope,
  });

  factory BrokerSpecialization.fromJson(
      Map<String, dynamic> json,
      ) {
    return BrokerSpecialization(
      id: _toInt(json['id']),
      specialization:
      json['specialization']?.toString(),
      specializationScope:
      json['specializationScope']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'specialization': specialization,
      'specializationScope': specializationScope,
    };
  }
}

class BrokerArea {
  final String? nameEn;
  final String? nameAr;
  final int? cityId;

  const BrokerArea({
    this.nameEn,
    this.nameAr,
    this.cityId,
  });

  factory BrokerArea.fromJson(Map<String, dynamic> json) {
    return BrokerArea(
      nameEn: json['nameEn']?.toString(),
      nameAr: json['nameAr']?.toString(),
      cityId: _toInt(json['cityId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameEn': nameEn,
      'nameAr': nameAr,
      'cityId': cityId,
    };
  }
}

// ============================================================
// Assigned Broker
// ============================================================

class AssignedBroker {
  final int? brokerId;
  final String? name;
  final int? senderId;
  final String? role;
  final String? phone;
  final String? receiverName;
  final String? receiverRole;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const AssignedBroker({
    this.brokerId,
    this.name,
    this.senderId,
    this.role,
    this.phone,
    this.receiverName,
    this.receiverRole,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AssignedBroker.fromJson(
      Map<String, dynamic> json,
      ) {
    return AssignedBroker(
      brokerId: _toInt(json['brokerId']),
      name: json['name']?.toString(),
      senderId: _toInt(json['senderId']),
      role: json['role']?.toString(),
      phone: json['phone']?.toString(),
      receiverName: json['receiverName']?.toString(),
      receiverRole: json['receiverRole']?.toString(),
      status: json['status']?.toString(),
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brokerId': brokerId,
      'name': name,
      'senderId': senderId,
      'role': role,
      'phone': phone,
      'receiverName': receiverName,
      'receiverRole': receiverRole,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

// ============================================================
// Helpers
// ============================================================

int? _toInt(dynamic value) {
  if (value == null) return null;

  if (value is int) return value;

  if (value is double) {
    return value.toInt();
  }

  return int.tryParse(value.toString());
}

double? _toDouble(dynamic value) {
  if (value == null) return null;

  if (value is double) return value;

  if (value is int) return value.toDouble();

  return double.tryParse(value.toString());
}

T? _parseObject<T>(
    dynamic value,
    T Function(Map<String, dynamic>) fromJson,
    ) {
  if (value is! Map) return null;

  return fromJson(
    Map<String, dynamic>.from(value),
  );
}

List<T> _parseList<T>(
    dynamic value,
    T Function(Map<String, dynamic>) fromJson,
    ) {
  if (value is! List) return [];

  return value
      .whereType<Map>()
      .map(
        (e) => fromJson(
      Map<String, dynamic>.from(e),
    ),
  )
      .toList();
}

List<String> _parseStringList(dynamic value) {
  if (value is! List) return [];

  return value
      .map((e) => e.toString())
      .toList();
}