
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
    if(data != null) {
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
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    count = json["count"];
    newRequestsCount = json["newRequestsCount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
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
  String? detailedAddress;
  List<Locations>? locations;
  Attributes? attributes;
  List<dynamic>? brokers;
  String? mainImage;
  dynamic unitInMasterPlanImage;
  List<dynamic>? gallery;
  List<dynamic>? assignedBrokers;

  Data1({this.id, this.title, this.specializationScope, this.type, this.unit, this.status, this.numberOfReplies, this.user, this.createdAt, this.updatedAt, this.detailedAddress, this.locations, this.attributes, this.brokers, this.mainImage, this.unitInMasterPlanImage, this.gallery, this.assignedBrokers});

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
    locations = json["locations"] == null ? null : (json["locations"] as List).map((e) => Locations.fromJson(e)).toList();
    attributes = json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]);
    brokers = json["brokers"] ?? [];
    mainImage = json["mainImage"];
    unitInMasterPlanImage = json["unitInMasterPlanImage"];
    gallery = json["gallery"] ?? [];
    assignedBrokers = json["assignedBrokers"] ?? [];
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
    compoundName = json["compoundName"];
    detailedAddress = json["detailedAddress"];
    addressLink = json["addressLink"];
    unitNumber = json["unitNumber"];
    buildingNumber = json["buildingNumber"];
    floor = json["floor"];
    unitArea = json["unitArea"];
    rooms = json["rooms"];
    bathrooms = json["bathrooms"];
    unitView = json["unitView"];
    finishingStatus = json["finishingStatus"];
    furnishingStatus = json["furnishingStatus"];
    otherAccessories = json["otherAccessories"] == null ? null : List<String>.from(json["otherAccessories"]);
    notes = json["notes"];
    unitPrice = json["unitPrice"];
    unitPriceSuggestions = json["unitPriceSuggestions"];
    rentRecurrence = json["rentRecurrence"];
    requiredInsurance = json["requiredInsurance"];
    otherExpenses = json["otherExpenses"] == null ? null : List<String>.from(json["otherExpenses"]);
    mainImage = json["mainImage"];
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
    city = json["city"] == null ? null : City.fromJson(json["city"]);
    areas = json["areas"] ?? [];
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