
class RequestDetailsModel {
  String? status;
  String? message;
  Data? data;

  RequestDetailsModel({this.status, this.message, this.data});

  RequestDetailsModel.fromJson(Map<String, dynamic> json) {
    status = JsonParse.toStringOrNull(json["status"]);
    message = JsonParse.toStringOrNull(json["message"]);
    data = JsonParse.toMap(json["data"]) == null ? null : Data.fromJson(JsonParse.toMap(json["data"])!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
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
  String? detailedAddress;
  List<Locations>? locations;
  Attributes? attributes;
  List<dynamic>? brokers;
  String? mainImage;
  dynamic unitInMasterPlanImage;
  List<dynamic>? gallery;
  List<dynamic>? assignedBrokers;

  Data({this.id, this.title, this.specializationScope, this.type, this.unit, this.status, this.numberOfReplies, this.user, this.createdAt, this.updatedAt, this.detailedAddress, this.locations, this.attributes, this.brokers, this.mainImage, this.unitInMasterPlanImage, this.gallery, this.assignedBrokers});

  Data.fromJson(Map<String, dynamic> json) {
    id = JsonParse.toIntOrNull(json["id"]);
    title = JsonParse.toStringOrNull(json["title"]);
    specializationScope = JsonParse.toStringOrNull(json["specializationScope"]);
    type = JsonParse.toStringOrNull(json["type"]);
    unit = JsonParse.toStringOrNull(json["unit"]);
    status = JsonParse.toStringOrNull(json["status"]);
    numberOfReplies = JsonParse.toIntOrNull(json["numberOfReplies"]);
    user = JsonParse.toMap(json["user"]) == null ? null : User.fromJson(JsonParse.toMap(json["user"])!);
    createdAt = JsonParse.toStringOrNull(json["createdAt"]);
    updatedAt = JsonParse.toStringOrNull(json["updatedAt"]);
    detailedAddress = JsonParse.toStringOrNull(json["detailedAddress"]);
    locations = json["locations"] == null
        ? null
        : JsonParse.toDynamicList(json["locations"])
            .map(JsonParse.toMap)
            .where((e) => e != null)
            .map((e) => Locations.fromJson(e!))
            .toList();
    attributes = JsonParse.toMap(json["attributes"]) == null
        ? null
        : Attributes.fromJson(JsonParse.toMap(json["attributes"])!);
    brokers = JsonParse.toDynamicList(json["brokers"]);
    mainImage = JsonParse.toStringOrNull(json["mainImage"]);
    unitInMasterPlanImage = json["unitInMasterPlanImage"];
    gallery = JsonParse.toDynamicList(json["gallery"]);
    assignedBrokers = JsonParse.toDynamicList(json["assignedBrokers"]);
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
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["detailedAddress"] = detailedAddress;
    if(locations != null) {
      _data["locations"] = locations?.map((e) => e.toJson()).toList();
    }
    if(attributes != null) {
      _data["attributes"] = attributes?.toJson();
    }
    if(brokers != null) {
      _data["brokers"] = brokers;
    }
    _data["mainImage"] = mainImage;
    _data["unitInMasterPlanImage"] = unitInMasterPlanImage;
    if(gallery != null) {
      _data["gallery"] = gallery;
    }
    if(assignedBrokers != null) {
      _data["assignedBrokers"] = assignedBrokers;
    }
    return _data;
  }
}

class Attributes {
  String? compoundName;
  String? detailedAddress;
  String? addressLink;
  String? unitNumber;
  String? buildingNumber;
  String? floor;
  int? unitArea;
  int? rooms;
  int? bathrooms;
  String? unitView;
  String? finishingStatus;
  String? furnishingStatus;
  List<String>? otherAccessories;
  String? notes;
  int? unitPrice;
  int? unitPriceSuggestions;
  String? rentRecurrence;
  String? requiredInsurance;
  List<String>? otherExpenses;
  String? mainImage;

  Attributes({this.compoundName, this.detailedAddress, this.addressLink, this.unitNumber, this.buildingNumber, this.floor, this.unitArea, this.rooms, this.bathrooms, this.unitView, this.finishingStatus, this.furnishingStatus, this.otherAccessories, this.notes, this.unitPrice, this.unitPriceSuggestions, this.rentRecurrence, this.requiredInsurance, this.otherExpenses, this.mainImage});

  Attributes.fromJson(Map<String, dynamic> json) {
    compoundName = JsonParse.toStringOrNull(json["compoundName"]);
    detailedAddress = JsonParse.toStringOrNull(json["detailedAddress"]);
    addressLink = JsonParse.toStringOrNull(json["addressLink"]);
    unitNumber = JsonParse.toStringOrNull(json["unitNumber"]);
    buildingNumber = JsonParse.toStringOrNull(json["buildingNumber"]);
    floor = JsonParse.toStringOrNull(json["floor"]);
    unitArea = JsonParse.toIntOrNull(json["unitArea"]);
    rooms = JsonParse.toIntOrNull(json["rooms"]);
    bathrooms = JsonParse.toIntOrNull(json["bathrooms"]);
    unitView = JsonParse.toStringOrNull(json["unitView"]);
    finishingStatus = JsonParse.toStringOrNull(json["finishingStatus"]);
    furnishingStatus = JsonParse.toStringOrNull(json["furnishingStatus"]);
    otherAccessories = JsonParse.toStringList(json["otherAccessories"]);
    notes = JsonParse.toStringOrNull(json["notes"]);
    unitPrice = JsonParse.toIntOrNull(json["unitPrice"]);
    unitPriceSuggestions = JsonParse.toIntOrNull(json["unitPriceSuggestions"]);
    rentRecurrence = JsonParse.toStringOrNull(json["rentRecurrence"]);
    requiredInsurance = JsonParse.toStringOrNull(json["requiredInsurance"]);
    otherExpenses = JsonParse.toStringList(json["otherExpenses"]);
    mainImage = JsonParse.toStringOrNull(json["mainImage"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["compoundName"] = compoundName;
    _data["detailedAddress"] = detailedAddress;
    _data["addressLink"] = addressLink;
    _data["unitNumber"] = unitNumber;
    _data["buildingNumber"] = buildingNumber;
    _data["floor"] = floor;
    _data["unitArea"] = unitArea;
    _data["rooms"] = rooms;
    _data["bathrooms"] = bathrooms;
    _data["unitView"] = unitView;
    _data["finishingStatus"] = finishingStatus;
    _data["furnishingStatus"] = furnishingStatus;
    if(otherAccessories != null) {
      _data["otherAccessories"] = otherAccessories;
    }
    _data["notes"] = notes;
    _data["unitPrice"] = unitPrice;
    _data["unitPriceSuggestions"] = unitPriceSuggestions;
    _data["rentRecurrence"] = rentRecurrence;
    _data["requiredInsurance"] = requiredInsurance;
    if(otherExpenses != null) {
      _data["otherExpenses"] = otherExpenses;
    }
    _data["mainImage"] = mainImage;
    return _data;
  }
}

class Locations {
  City? city;
  List<dynamic>? areas;

  Locations({this.city, this.areas});

  Locations.fromJson(Map<String, dynamic> json) {
    city = JsonParse.toMap(json["city"]) == null
        ? null
        : City.fromJson(JsonParse.toMap(json["city"])!);
    areas = JsonParse.toDynamicList(json["areas"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(city != null) {
      _data["city"] = city?.toJson();
    }
    if(areas != null) {
      _data["areas"] = areas;
    }
    return _data;
  }
}

class City {
  int? id;
  String? nameEn;
  String? nameAr;

  City({this.id, this.nameEn, this.nameAr});

  City.fromJson(Map<String, dynamic> json) {
    id = JsonParse.toIntOrNull(json["id"]);
    nameEn = JsonParse.toStringOrNull(json["name_en"]);
    nameAr = JsonParse.toStringOrNull(json["name_ar"]);
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
    name = JsonParse.toStringOrNull(json["name"]);
    role = JsonParse.toStringOrNull(json["role"]);
    id = JsonParse.toIntOrNull(json["id"]);
    image = JsonParse.toStringOrNull(json["image"]);
    phone = JsonParse.toStringOrNull(json["phone"]);
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
/// الـAPI بيرجّع الأرقام ساعات كـString ("3") وساعات كـnum (3)، وساعات
/// الليستات بتجيلها عناصر مش strings. الـhelpers دي بتمنع
/// `type 'String' is not a subtype of type 'int?'` وقت الـparsing.
class JsonParse {
  const JsonParse._();

  static int? toIntOrNull(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    final text = value.toString().trim();
    if (text.isEmpty) return null;
    return int.tryParse(text) ?? double.tryParse(text)?.toInt();
  }

  static String? toStringOrNull(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    if (text.isEmpty || text == 'null') return null;
    return text;
  }

  /// الـAPI ساعات بيرجّع `[]` بدل `{}` للـobject الفاضي، وساعات `null`.
  /// بيرجّع Map صالحة للـparsing أو null بدل ما يرمي TypeError.
  static Map<String, dynamic>? toMap(dynamic value) {
    if (value is Map) return Map<String, dynamic>.from(value);
    return null;
  }

  static List<dynamic> toDynamicList(dynamic value) {
    if (value is List) return value;
    return const [];
  }

  static List<String>? toStringList(dynamic value) {
    if (value == null) return null;
    if (value is! List) {
      final single = toStringOrNull(value);
      return single == null ? null : [single];
    }
    return value
        .map(toStringOrNull)
        .where((e) => e != null)
        .cast<String>()
        .toList();
  }
}
