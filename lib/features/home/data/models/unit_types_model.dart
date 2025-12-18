
class UnitTypesModel {
  String? status;
  String? message;
  Data? data;

  UnitTypesModel({this.status, this.message, this.data});

  UnitTypesModel.fromJson(Map<String, dynamic> json) {
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
  String? apartments;
  String? duplexes;
  String? penthouses;
  String? roofs;
  String? studios;
  String? basements;
  String? residentialBuildings;
  String? villas;
  String? iVilla;
  String? administrativeUnits;
  String? medicalClinics;
  String? pharmacies;
  String? commercialStores;
  String? residentialLands;
  String? commercialAdministrativeBuildings;
  String? commercialAdministrativeLands;
  String? factoryLands;
  String? warehouseLands;
  String? chalets;
  String? vacationVilla;
  String? hotels;
  String? twinHouses;
  String? townHouses;
  String? standaloneVillas;

  Data({this.apartments, this.duplexes, this.penthouses, this.roofs, this.studios, this.basements, this.residentialBuildings, this.villas, this.iVilla, this.administrativeUnits, this.medicalClinics, this.pharmacies, this.commercialStores, this.residentialLands, this.commercialAdministrativeBuildings, this.commercialAdministrativeLands, this.factoryLands, this.warehouseLands, this.chalets, this.vacationVilla, this.hotels, this.twinHouses, this.townHouses, this.standaloneVillas});

  Data.fromJson(Map<String, dynamic> json) {
    apartments = json["apartments"];
    duplexes = json["duplexes"];
    penthouses = json["penthouses"];
    roofs = json["roofs"];
    studios = json["studios"];
    basements = json["basements"];
    residentialBuildings = json["residential buildings"];
    villas = json["villas"];
    iVilla = json["i villa"];
    administrativeUnits = json["administrative units"];
    medicalClinics = json["medical clinics"];
    pharmacies = json["pharmacies"];
    commercialStores = json["commercial stores"];
    residentialLands = json["residential lands"];
    commercialAdministrativeBuildings = json["commercial administrative buildings"];
    commercialAdministrativeLands = json["commercial administrative lands"];
    factoryLands = json["factory lands"];
    warehouseLands = json["warehouse lands"];
    chalets = json["chalets"];
    vacationVilla = json["vacation villa"];
    hotels = json["hotels"];
    twinHouses = json["twin houses"];
    townHouses = json["town houses"];
    standaloneVillas = json["standalone villas"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["apartments"] = apartments;
    _data["duplexes"] = duplexes;
    _data["penthouses"] = penthouses;
    _data["roofs"] = roofs;
    _data["studios"] = studios;
    _data["basements"] = basements;
    _data["residential buildings"] = residentialBuildings;
    _data["villas"] = villas;
    _data["i villa"] = iVilla;
    _data["administrative units"] = administrativeUnits;
    _data["medical clinics"] = medicalClinics;
    _data["pharmacies"] = pharmacies;
    _data["commercial stores"] = commercialStores;
    _data["residential lands"] = residentialLands;
    _data["commercial administrative buildings"] = commercialAdministrativeBuildings;
    _data["commercial administrative lands"] = commercialAdministrativeLands;
    _data["factory lands"] = factoryLands;
    _data["warehouse lands"] = warehouseLands;
    _data["chalets"] = chalets;
    _data["vacation villa"] = vacationVilla;
    _data["hotels"] = hotels;
    _data["twin houses"] = twinHouses;
    _data["town houses"] = townHouses;
    _data["standalone villas"] = standaloneVillas;
    return _data;
  }
}