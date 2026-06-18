class BrokerUnitsModel {
  String? status;
  String? message;
  List<BrokerUnitData>? data;
  int? count;

  BrokerUnitsModel({this.status, this.message, this.data, this.count});

  BrokerUnitsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => BrokerUnitData.fromJson(e)).toList();
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["count"] = count;
    return _data;
  }
}

class BrokerUnitData {
  int? id;
  String? type;
  int? unitArea;
  String? buildingNumber;
  String? unitNumber;
  String? floor;
  String? ownerPhone;
  String? ownerName;
  String? detailedAddress;
  String? dailyRent;
  String? monthlyRent;
  String? deliveryStatus;
  int? numberOfRooms;
  int? numberOfBathrooms;
  String? finishingType;
  String? unitOperation;
  String? compoundType;
  String? status;
  String? view;
  String? paymentSystem;
  int? totalPriceInCash;
  int? totalPriceInInstallment;
  int? pricePerMeterInCash;
  int? pricePerMeterInInstallment;
  int? isArchived;
  List<String>? otherAccessories;
  String? description;
  String? diagram;
  String? location;
  String? city;
  String? area;
  String? notes;

  BrokerUnitData({
    this.id,
    this.type,
    this.unitArea,
    this.buildingNumber,
    this.unitNumber,
    this.floor,
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
    this.paymentSystem,
    this.totalPriceInCash,
    this.totalPriceInInstallment,
    this.pricePerMeterInCash,
    this.pricePerMeterInInstallment,
    this.isArchived,
    this.otherAccessories,
    this.description,
    this.diagram,
    this.location,
    this.city,
    this.area,
    this.notes,
  });

  BrokerUnitData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
    unitArea = json["unitArea"];
    buildingNumber = json["buildingNumber"];
    unitNumber = json["unitNumber"];
    floor = json["floor"];
    ownerPhone = json["ownerPhone"];
    ownerName = json["ownerName"];
    detailedAddress = json["detailedAddress"];
    dailyRent = json["dailyRent"]?.toString();
    monthlyRent = json["monthlyRent"]?.toString();
    deliveryStatus = json["deliveryStatus"];
    numberOfRooms = json["numberOfRooms"];
    numberOfBathrooms = json["numberOfBathrooms"];
    finishingType = json["finishingType"];
    unitOperation = json["unitOperation"];
    compoundType = json["compoundType"];
    status = json["status"];
    view = json["view"];
    paymentSystem = json["paymentSystem"];
    totalPriceInCash = json["totalPriceInCash"];
    totalPriceInInstallment = json["totalPriceInInstallment"];
    pricePerMeterInCash = json["pricePerMeterInCash"];
    pricePerMeterInInstallment = json["pricePerMeterInInstallment"];
    isArchived = json["isArchived"];
    otherAccessories = json["otherAccessories"] == null ? null : List<String>.from(json["otherAccessories"]);
    description = json["description"];
    diagram = json["diagram"];
    location = json["location"];
    city = json["city"] is String ? json["city"] : (json["city"] as Map?)?["nameEn"] ?? (json["city"] as Map?)?["nameAr"];
    area = json["area"] is String ? json["area"] : (json["area"] as Map?)?["nameEn"] ?? (json["area"] as Map?)?["nameAr"];
    notes = (json["additionalDetails"] as Map?)?["notes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    _data["unitArea"] = unitArea;
    _data["buildingNumber"] = buildingNumber;
    _data["unitNumber"] = unitNumber;
    _data["floor"] = floor;
    _data["ownerPhone"] = ownerPhone;
    _data["ownerName"] = ownerName;
    _data["detailedAddress"] = detailedAddress;
    _data["dailyRent"] = dailyRent;
    _data["monthlyRent"] = monthlyRent;
    _data["deliveryStatus"] = deliveryStatus;
    _data["numberOfRooms"] = numberOfRooms;
    _data["numberOfBathrooms"] = numberOfBathrooms;
    _data["finishingType"] = finishingType;
    _data["unitOperation"] = unitOperation;
    _data["compoundType"] = compoundType;
    _data["status"] = status;
    _data["view"] = view;
    _data["paymentSystem"] = paymentSystem;
    _data["totalPriceInCash"] = totalPriceInCash;
    _data["totalPriceInInstallment"] = totalPriceInInstallment;
    _data["pricePerMeterInCash"] = pricePerMeterInCash;
    _data["pricePerMeterInInstallment"] = pricePerMeterInInstallment;
    _data["isArchived"] = isArchived;
    _data["otherAccessories"] = otherAccessories;
    _data["description"] = description;
    _data["diagram"] = diagram;
    _data["location"] = location;
    _data["city"] = city;
    _data["area"] = area;
    _data["notes"] = notes;
    return _data;
  }
}