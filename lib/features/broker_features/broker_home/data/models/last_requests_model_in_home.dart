class LastRequestsModelInHome {
  dynamic status;
  dynamic message;
  List<Data>? data;
  int? count;

  LastRequestsModelInHome({this.status, this.message, this.data, this.count});

  LastRequestsModelInHome.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Data {
  int? id;
  dynamic title;
  dynamic specializationScope;
  dynamic type;
  dynamic unit;
  dynamic status;
  dynamic numberOfReplies;
  User? user;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic detailedAddress;
  List<Locations>? locations;
  Attributes? attributes;
  List<Brokers>? brokers;
  dynamic mainImage;
  dynamic unitInMasterPlanImage;
  List<Gallery>? gallery;
  List<AssignedBrokers>? assignedBrokers;

  Data(
      {this.id,
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
        this.assignedBrokers});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    specializationScope = json['specializationScope'];
    type = json['type'];
    unit = json['unit'];
    status = json['status'];
    numberOfReplies = json['numberOfReplies'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    detailedAddress = json['detailedAddress'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    if (json['brokers'] != null) {
      brokers = <Brokers>[];
      json['brokers'].forEach((v) {
        brokers!.add(new Brokers.fromJson(v));
      });
    }
    mainImage = json['mainImage'];
    unitInMasterPlanImage = json['unitInMasterPlanImage'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    if (json['assignedBrokers'] != null) {
      assignedBrokers = <AssignedBrokers>[];
      json['assignedBrokers'].forEach((v) {
        assignedBrokers!.add(new AssignedBrokers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['specializationScope'] = this.specializationScope;
    data['type'] = this.type;
    data['unit'] = this.unit;
    data['status'] = this.status;
    data['numberOfReplies'] = this.numberOfReplies;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['detailedAddress'] = this.detailedAddress;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    if (this.brokers != null) {
      data['brokers'] = this.brokers!.map((v) => v.toJson()).toList();
    }
    data['mainImage'] = this.mainImage;
    data['unitInMasterPlanImage'] = this.unitInMasterPlanImage;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    if (this.assignedBrokers != null) {
      data['assignedBrokers'] =
          this.assignedBrokers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  dynamic name;
  dynamic role;
  dynamic id;
  dynamic image;
  dynamic phone;

  User({this.name, this.role, this.id, this.image, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
    id = json['id'];
    image = json['image'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['role'] = this.role;
    data['id'] = this.id;
    data['image'] = this.image;
    data['phone'] = this.phone;
    return data;
  }
}

class Locations {
  City? city;
  List<Areas>? areas;

  Locations({this.city, this.areas});

  Locations.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  dynamic nameEn;
  dynamic nameAr;

  City({this.id, this.nameEn, this.nameAr});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    return data;
  }
}

class Areas {
  City? area;
  List<SubAreas>? subAreas;

  Areas({this.area, this.subAreas});

  Areas.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? new City.fromJson(json['area']) : null;
    if (json['sub_areas'] != null) {
      subAreas = <SubAreas>[];
      json['sub_areas'].forEach((v) {
        subAreas!.add(new SubAreas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.subAreas != null) {
      data['sub_areas'] = this.subAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubAreas {
  int? id;
  dynamic nameEn;
  dynamic nameAr;
  List<OtherSubAreas>? otherSubAreas;

  SubAreas({this.id, this.nameEn, this.nameAr, this.otherSubAreas});

  SubAreas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    if (json['otherSubAreas'] != null) {
      otherSubAreas = <OtherSubAreas>[];
      json['otherSubAreas'].forEach((v) {
        otherSubAreas!.add(new OtherSubAreas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    if (this.otherSubAreas != null) {
      data['otherSubAreas'] =
          this.otherSubAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherSubAreas {
  int? id;
  dynamic name;

  OtherSubAreas({this.id, this.name});

  OtherSubAreas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Attributes {
  dynamic floor;
  dynamic unitAreaMin;
  dynamic unitAreaMax;
  dynamic areaSuggestions;
  dynamic rooms;
  dynamic bathRooms;
  dynamic unitView;
  dynamic finishingStatus;
  dynamic deliveryStatus;
  dynamic notes;
  List<String>? otherAccessories;
  dynamic paymentMethod;
  dynamic averageUnitPriceMin;
  dynamic averageUnitPriceMax;
  dynamic unitPriceSuggestions;
  dynamic compoundName;
  dynamic locationSuggestions;
  dynamic unitNumber;
  dynamic buildingNumber;
  dynamic deliveryDate;
  int? unitArea;
  int? unitPrice;
  dynamic projectConstructor;
  dynamic projectManagement;
  int? pricePerMeterInCash;
  int? pricePerMeterInInstallment;
  dynamic legalStatus;
  dynamic otherExpensesValue;
  dynamic otherSubArea;
  int? askingPrice;
  dynamic gardenArea;
  dynamic unitFacing;
  dynamic numberOfFloors;
  dynamic activity;
  dynamic groundArea;

  Attributes(
      {this.floor,
        this.unitAreaMin,
        this.unitAreaMax,
        this.areaSuggestions,
        this.rooms,
        this.bathRooms,
        this.unitView,
        this.finishingStatus,
        this.deliveryStatus,
        this.notes,
        this.otherAccessories,
        this.paymentMethod,
        this.averageUnitPriceMin,
        this.averageUnitPriceMax,
        this.unitPriceSuggestions,
        this.compoundName,
        this.locationSuggestions,
        this.unitNumber,
        this.buildingNumber,
        this.deliveryDate,
        this.unitArea,
        this.unitPrice,
        this.projectConstructor,
        this.projectManagement,
        this.pricePerMeterInCash,
        this.pricePerMeterInInstallment,
        this.legalStatus,
        this.otherExpensesValue,
        this.otherSubArea,
        this.askingPrice,
        this.gardenArea,
        this.unitFacing,
        this.numberOfFloors,
        this.activity,
        this.groundArea});

  Attributes.fromJson(Map<String, dynamic> json) {
    floor = json['floor'];
    unitAreaMin = json['unitAreaMin'];
    unitAreaMax = json['unitAreaMax'];
    areaSuggestions = json['areaSuggestions'];
    rooms = json['rooms'];
    bathRooms = json['bathRooms'];
    unitView = json['unitView'];
    finishingStatus = json['finishingStatus'];
    deliveryStatus = json['deliveryStatus'];
    notes = json['notes'];
    otherAccessories = json['otherAccessories'].cast<String>();
    paymentMethod = json['paymentMethod'];
    averageUnitPriceMin = json['averageUnitPriceMin'];
    averageUnitPriceMax = json['averageUnitPriceMax'];
    unitPriceSuggestions = json['unitPriceSuggestions'];
    compoundName = json['compoundName'];
    locationSuggestions = json['locationSuggestions'];
    unitNumber = json['unitNumber'];
    buildingNumber = json['buildingNumber'];
    deliveryDate = json['deliveryDate'];
    unitArea = json['unitArea'];
    unitPrice = json['unitPrice'];
    projectConstructor = json['projectConstructor'];
    projectManagement = json['projectManagement'];
    pricePerMeterInCash = json['pricePerMeterInCash'];
    pricePerMeterInInstallment = json['pricePerMeterInInstallment'];
    legalStatus = json['legalStatus'];
    otherExpensesValue = json['otherExpensesValue'];
    otherSubArea = json['otherSubArea'];
    askingPrice = json['askingPrice'];
    gardenArea = json['gardenArea'];
    unitFacing = json['unitFacing'];
    numberOfFloors = json['numberOfFloors'];
    activity = json['activity'];
    groundArea = json['groundArea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor'] = this.floor;
    data['unitAreaMin'] = this.unitAreaMin;
    data['unitAreaMax'] = this.unitAreaMax;
    data['areaSuggestions'] = this.areaSuggestions;
    data['rooms'] = this.rooms;
    data['bathRooms'] = this.bathRooms;
    data['unitView'] = this.unitView;
    data['finishingStatus'] = this.finishingStatus;
    data['deliveryStatus'] = this.deliveryStatus;
    data['notes'] = this.notes;
    data['otherAccessories'] = this.otherAccessories;
    data['paymentMethod'] = this.paymentMethod;
    data['averageUnitPriceMin'] = this.averageUnitPriceMin;
    data['averageUnitPriceMax'] = this.averageUnitPriceMax;
    data['unitPriceSuggestions'] = this.unitPriceSuggestions;
    data['compoundName'] = this.compoundName;
    data['locationSuggestions'] = this.locationSuggestions;
    data['unitNumber'] = this.unitNumber;
    data['buildingNumber'] = this.buildingNumber;
    data['deliveryDate'] = this.deliveryDate;
    data['unitArea'] = this.unitArea;
    data['unitPrice'] = this.unitPrice;
    data['projectConstructor'] = this.projectConstructor;
    data['projectManagement'] = this.projectManagement;
    data['pricePerMeterInCash'] = this.pricePerMeterInCash;
    data['pricePerMeterInInstallment'] = this.pricePerMeterInInstallment;
    data['legalStatus'] = this.legalStatus;
    data['otherExpensesValue'] = this.otherExpensesValue;
    data['otherSubArea'] = this.otherSubArea;
    data['askingPrice'] = this.askingPrice;
    data['gardenArea'] = this.gardenArea;
    data['unitFacing'] = this.unitFacing;
    data['numberOfFloors'] = this.numberOfFloors;
    data['activity'] = this.activity;
    data['groundArea'] = this.groundArea;
    return data;
  }
}

class Brokers {
  int? id;
  dynamic accountType;
  dynamic fullName;
  dynamic image;
  Null? averageRating;
  int? ratingCount;
  dynamic type;
  List<Specializations>? specializations;
  List<Areas>? areas;

  Brokers(
      {this.id,
        this.accountType,
        this.fullName,
        this.image,
        this.averageRating,
        this.ratingCount,
        this.type,
        this.specializations,
        this.areas});

  Brokers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountType = json['accountType'];
    fullName = json['fullName'];
    image = json['image'];
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
    type = json['type'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(new Specializations.fromJson(v));
      });
    }
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountType'] = this.accountType;
    data['fullName'] = this.fullName;
    data['image'] = this.image;
    data['averageRating'] = this.averageRating;
    data['ratingCount'] = this.ratingCount;
    data['type'] = this.type;
    if (this.specializations != null) {
      data['specializations'] =
          this.specializations!.map((v) => v.toJson()).toList();
    }
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  int? id;
  dynamic specialization;
  dynamic specializationScope;

  Specializations({this.id, this.specialization, this.specializationScope});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialization = json['specialization'];
    specializationScope = json['specializationScope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specialization'] = this.specialization;
    data['specializationScope'] = this.specializationScope;
    return data;
  }
}

class Areas2 {
  dynamic nameEn;
  dynamic nameAr;
  int? cityId;

  Areas2({this.nameEn, this.nameAr, this.cityId});

  Areas2.fromJson(Map<String, dynamic> json) {
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['cityId'] = this.cityId;
    return data;
  }
}

class Gallery {
  int? id;
  dynamic parentType;
  dynamic url;
  dynamic type;

  Gallery({this.id, this.parentType, this.url, this.type});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentType = json['parent_type'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_type'] = this.parentType;
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class AssignedBrokers {
  int? brokerId;
  dynamic name;
  int? senderId;
  dynamic role;
  dynamic phone;
  dynamic receiverName;
  dynamic receiverRole;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  AssignedBrokers(
      {this.brokerId,
        this.name,
        this.senderId,
        this.role,
        this.phone,
        this.receiverName,
        this.receiverRole,
        this.status,
        this.createdAt,
        this.updatedAt});

  AssignedBrokers.fromJson(Map<String, dynamic> json) {
    brokerId = json['brokerId'];
    name = json['name'];
    senderId = json['senderId'];
    role = json['role'];
    phone = json['phone'];
    receiverName = json['receiverName'];
    receiverRole = json['receiverRole'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brokerId'] = this.brokerId;
    data['name'] = this.name;
    data['senderId'] = this.senderId;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['receiverName'] = this.receiverName;
    data['receiverRole'] = this.receiverRole;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
