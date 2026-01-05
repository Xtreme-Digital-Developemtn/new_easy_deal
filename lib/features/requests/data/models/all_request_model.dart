class AllRequestModel {
  String? status;
  String? message;
  Data? data;

  AllRequestModel({this.status, this.message, this.data});

  AllRequestModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<Data1>? data;
  int? count;
  int? newRequestsCount;

  Data({this.data, this.count, this.newRequestsCount});

  Data.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    count = json["count"];
    newRequestsCount = json["newRequestsCount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["count"] = count;
    _data["newRequestsCount"] = newRequestsCount;
    return _data;
  }
}

class Data1 {
  int? id;
  String? title;
  String? specializationScope;
  String? type;
  String? unit;
  String? status;
  int? numberOfReplies;
  User? user;
  String? createdAt;
  String? updatedAt;
  dynamic detailedAddress;
  List<Locations>? locations;
  Map<String, dynamic>? attributes; // تغيير إلى Map
  List<Brokers>? brokers;
  dynamic mainImage;
  dynamic unitInMasterPlanImage;
  List<dynamic>? gallery;
  List<AssignedBrokers>? assignedBrokers;

  Data1({
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
    this.locations,
    this.attributes,
    this.brokers,
    this.mainImage,
    this.unitInMasterPlanImage,
    this.gallery,
    this.assignedBrokers,
  });

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    specializationScope = json["specializationScope"];
    type = json["type"];
    unit = json["unit"];
    status = json["status"];
    numberOfReplies = json["numberOfReplies"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    detailedAddress = json["detailedAddress"];
    locations = json["locations"] == null
        ? null
        : (json["locations"] as List).map((e) => Locations.fromJson(e)).toList();

    // التعامل مع attributes كـ Map ديناميكي
    attributes = json["attributes"] != null
        ? Map<String, dynamic>.from(json["attributes"])
        : null;

    brokers = json["brokers"] == null
        ? null
        : (json["brokers"] as List).map((e) => Brokers.fromJson(e)).toList();
    mainImage = json["mainImage"];
    unitInMasterPlanImage = json["unitInMasterPlanImage"];
    gallery = json["gallery"] ?? [];
    assignedBrokers = json["assignedBrokers"] == null
        ? null
        : (json["assignedBrokers"] as List)
        .map((e) => AssignedBrokers.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["specializationScope"] = specializationScope;
    _data["type"] = type;
    _data["unit"] = unit;
    _data["status"] = status;
    _data["numberOfReplies"] = numberOfReplies;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["detailedAddress"] = detailedAddress;
    if (locations != null) {
      _data["locations"] = locations?.map((e) => e.toJson()).toList();
    }
    if (attributes != null) {
      _data["attributes"] = attributes;
    }
    if (brokers != null) {
      _data["brokers"] = brokers?.map((e) => e.toJson()).toList();
    }
    _data["mainImage"] = mainImage;
    _data["unitInMasterPlanImage"] = unitInMasterPlanImage;
    if (gallery != null) {
      _data["gallery"] = gallery;
    }
    if (assignedBrokers != null) {
      _data["assignedBrokers"] = assignedBrokers?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class AssignedBrokers {
  int? brokerId;
  String? receiverName;
  int? senderId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? phone;
  String? role;

  AssignedBrokers({
    this.brokerId,
    this.receiverName,
    this.senderId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.phone,
    this.role,
  });

  AssignedBrokers.fromJson(Map<String, dynamic> json) {
    brokerId = json["brokerId"];
    receiverName = json["receiverName"];
    senderId = json["senderId"];
    status = json["status"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    name = json["name"];
    phone = json["phone"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["brokerId"] = brokerId;
    _data["receiverName"] = receiverName;
    _data["senderId"] = senderId;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["role"] = role;
    return _data;
  }
}

class Brokers {
  int? id;
  String? accountType;
  String? fullName;
  String? image;
  dynamic averageRating;
  int? ratingCount;
  String? type;
  List<Specializations>? specializations;
  List<Areas1>? areas;

  Brokers({
    this.id,
    this.accountType,
    this.fullName,
    this.image,
    this.averageRating,
    this.ratingCount,
    this.type,
    this.specializations,
    this.areas,
  });

  Brokers.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    accountType = json["accountType"];
    fullName = json["fullName"];
    image = json["image"];
    averageRating = json["averageRating"];
    ratingCount = json["ratingCount"];
    type = json["type"];
    specializations = json["specializations"] == null
        ? null
        : (json["specializations"] as List)
        .map((e) => Specializations.fromJson(e))
        .toList();
    areas = json["areas"] == null
        ? null
        : (json["areas"] as List).map((e) => Areas1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["accountType"] = accountType;
    _data["fullName"] = fullName;
    _data["image"] = image;
    _data["averageRating"] = averageRating;
    _data["ratingCount"] = ratingCount;
    _data["type"] = type;
    if (specializations != null) {
      _data["specializations"] = specializations?.map((e) => e.toJson()).toList();
    }
    if (areas != null) {
      _data["areas"] = areas?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Areas1 {
  String? nameEn;
  String? nameAr;
  int? cityId;

  Areas1({this.nameEn, this.nameAr, this.cityId});

  Areas1.fromJson(Map<String, dynamic> json) {
    nameEn = json["nameEn"];
    nameAr = json["nameAr"];
    cityId = json["cityId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["nameEn"] = nameEn;
    _data["nameAr"] = nameAr;
    _data["cityId"] = cityId;
    return _data;
  }
}

class Specializations {
  int? id;
  String? specialization;
  String? specializationScope;

  Specializations({this.id, this.specialization, this.specializationScope});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    specialization = json["specialization"];
    specializationScope = json["specializationScope"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["specialization"] = specialization;
    _data["specializationScope"] = specializationScope;
    return _data;
  }
}

// إزالة class Attributes القديم واستخدام Map بدلاً منه

class Locations {
  City? city;
  List<Areas>? areas;

  Locations({this.city, this.areas});

  Locations.fromJson(Map<String, dynamic> json) {
    city = json["city"] == null ? null : City.fromJson(json["city"]);
    areas = json["areas"] == null
        ? null
        : (json["areas"] as List).map((e) => Areas.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (city != null) {
      _data["city"] = city?.toJson();
    }
    if (areas != null) {
      _data["areas"] = areas?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Areas {
  Area? area;
  List<SubAreas>? subAreas;

  Areas({this.area, this.subAreas});

  Areas.fromJson(Map<String, dynamic> json) {
    area = json["area"] == null ? null : Area.fromJson(json["area"]);
    subAreas = json["sub_areas"] == null
        ? null
        : (json["sub_areas"] as List).map((e) => SubAreas.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (area != null) {
      _data["area"] = area?.toJson();
    }
    if (subAreas != null) {
      _data["sub_areas"] = subAreas?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class SubAreas {
  int? id;
  String? nameEn;
  String? nameAr;
  List<OtherSubAreas>? otherSubAreas;

  SubAreas({this.id, this.nameEn, this.nameAr, this.otherSubAreas});

  SubAreas.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameEn = json["name_en"];
    nameAr = json["name_ar"];
    otherSubAreas = json["other_sub_areas"] == null
        ? null
        : (json["other_sub_areas"] as List)
        .map((e) => OtherSubAreas.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    if (otherSubAreas != null) {
      _data["other_sub_areas"] = otherSubAreas?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class OtherSubAreas {
  int? id;
  String? name;

  OtherSubAreas({this.id, this.name});

  OtherSubAreas.fromJson(Map<String, dynamic> json) {
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

class Area {
  int? id;
  String? nameEn;
  String? nameAr;

  Area({this.id, this.nameEn, this.nameAr});

  Area.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameEn = json["name_en"];
    nameAr = json["name_ar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    return _data;
  }
}

class City {
  int? id;
  String? nameEn;
  String? nameAr;

  City({this.id, this.nameEn, this.nameAr});

  City.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameEn = json["name_en"];
    nameAr = json["name_ar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    return _data;
  }
}

class User {
  String? name;
  String? role;
  int? id;
  String? image;
  String? phone;

  User({this.name, this.role, this.id, this.image, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    role = json["role"];
    id = json["id"];
    image = json["image"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["role"] = role;
    _data["id"] = id;
    _data["image"] = image;
    _data["phone"] = phone;
    return _data;
  }
}