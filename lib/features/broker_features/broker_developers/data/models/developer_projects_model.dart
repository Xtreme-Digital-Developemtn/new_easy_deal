class DeveloperProjectsModel {
  final String status;
  final String message;
  final List<ProjectData> data;

  DeveloperProjectsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeveloperProjectsModel.fromJson(Map<String, dynamic> json) {
    return DeveloperProjectsModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List?)
          ?.map((e) => ProjectData.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class ProjectData {
  final int id;
  final String name;
  final String designer;
  final String projectExecutor;
  final String managementTeam;
  final CityModel? city;
  final AreaModel? area;
  final SubAreaModel? subArea;
  final List<OtherSubAreaModel> otherSubAreas;
  final String type;
  final String projectType;
  final DeveloperModel? developer;
  final String address;
  final String googleMapUrl;

  final int apartmentsCount;
  final int duplexesCount;
  final int penthousesCount;
  final int iVillaCount;
  final int studiosCount;
  final int roofsCount;
  final int basementsCount;
  final int twinHousesCount;
  final int townHousesCount;
  final int standaloneVillasCount;
  final int administrativeUnitsCount;
  final int commercialUnitsCount;
  final int medicalClinicsCount;
  final int pharmaciesCount;
  final int commercialAdministrativeBuildingCount;

  final List<ProjectUnitModel> models;

  final String logoImage;
  final String coverImage;
  final String masterPlan;

  final String createdAt;
  final String updatedAt;

  final List<GalleryModel> gallery;

  ProjectData({
    required this.id,
    required this.name,
    required this.designer,
    required this.projectExecutor,
    required this.managementTeam,
    this.city,
    this.area,
    this.subArea,
    required this.otherSubAreas,
    required this.type,
    required this.projectType,
    this.developer,
    required this.address,
    required this.googleMapUrl,
    required this.apartmentsCount,
    required this.duplexesCount,
    required this.penthousesCount,
    required this.iVillaCount,
    required this.studiosCount,
    required this.roofsCount,
    required this.basementsCount,
    required this.twinHousesCount,
    required this.townHousesCount,
    required this.standaloneVillasCount,
    required this.administrativeUnitsCount,
    required this.commercialUnitsCount,
    required this.medicalClinicsCount,
    required this.pharmaciesCount,
    required this.commercialAdministrativeBuildingCount,
    required this.models,
    required this.logoImage,
    required this.coverImage,
    required this.masterPlan,
    required this.createdAt,
    required this.updatedAt,
    required this.gallery,
  });

  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      designer: json['designer'] ?? '',
      projectExecutor: json['projectExecutor'] ?? '',
      managementTeam: json['managementTeam'] ?? '',
      city: json['city'] != null
          ? CityModel.fromJson(json['city'])
          : null,
      area: json['area'] != null
          ? AreaModel.fromJson(json['area'])
          : null,
      subArea: json['subArea'] != null
          ? SubAreaModel.fromJson(json['subArea'])
          : null,
      otherSubAreas: (json['otherSubAreas'] as List?)
          ?.map((e) => OtherSubAreaModel.fromJson(e))
          .toList() ??
          [],
      type: json['type'] ?? '',
      projectType: json['projectType'] ?? '',
      developer: json['developer'] != null
          ? DeveloperModel.fromJson(json['developer'])
          : null,
      address: json['address'] ?? '',
      googleMapUrl: json['googleMapUrl'] ?? '',
      apartmentsCount: json['apartmentsCount'] ?? 0,
      duplexesCount: json['duplexesCount'] ?? 0,
      penthousesCount: json['penthousesCount'] ?? 0,
      iVillaCount: json['iVillaCount'] ?? 0,
      studiosCount: json['studiosCount'] ?? 0,
      roofsCount: json['roofsCount'] ?? 0,
      basementsCount: json['basementsCount'] ?? 0,
      twinHousesCount: json['twinHousesCount'] ?? 0,
      townHousesCount: json['townHousesCount'] ?? 0,
      standaloneVillasCount: json['standaloneVillasCount'] ?? 0,
      administrativeUnitsCount:
      json['administrativeUnitsCount'] ?? 0,
      commercialUnitsCount:
      json['commercialUnitsCount'] ?? 0,
      medicalClinicsCount:
      json['medicalClinicsCount'] ?? 0,
      pharmaciesCount: json['pharmaciesCount'] ?? 0,
      commercialAdministrativeBuildingCount:
      json['commercialAdministrativeBuildingCount'] ?? 0,
      models: (json['models'] as List?)
          ?.map((e) => ProjectUnitModel.fromJson(e))
          .toList() ??
          [],
      logoImage: json['logoImage'] ?? '',
      coverImage: json['coverImage'] ?? '',
      masterPlan: json['masterPlan'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      gallery: (json['gallery'] as List?)
          ?.map((e) => GalleryModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class CityModel {
  final int id;
  final String nameEn;
  final String nameAr;

  CityModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? 0,
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
    );
  }
}

class AreaModel {
  final int id;
  final String nameEn;
  final String nameAr;
  final int cityId;

  AreaModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.cityId,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'] ?? 0,
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      cityId: json['city_id'] ?? 0,
    );
  }
}

class SubAreaModel {
  final int id;
  final String nameEn;
  final String nameAr;
  final int areaId;

  SubAreaModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.areaId,
  });

  factory SubAreaModel.fromJson(Map<String, dynamic> json) {
    return SubAreaModel(
      id: json['id'] ?? 0,
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      areaId: json['area_id'] ?? 0,
    );
  }
}

class OtherSubAreaModel {
  final int id;
  final String name;
  final int subAreaId;

  OtherSubAreaModel({
    required this.id,
    required this.name,
    required this.subAreaId,
  });

  factory OtherSubAreaModel.fromJson(Map<String, dynamic> json) {
    return OtherSubAreaModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      subAreaId: json['subAreaId'] ?? 0,
    );
  }
}

class DeveloperModel {
  final int id;
  final int userId;

  DeveloperModel({
    required this.id,
    required this.userId,
  });

  factory DeveloperModel.fromJson(Map<String, dynamic> json) {
    return DeveloperModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
    );
  }
}

class ProjectUnitModel {
  final int id;
  final String? subUnitType;
  final String unitType;
  final int numberOfUnits;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final double unitArea;
  final double landingArea;

  ProjectUnitModel({
    required this.id,
    this.subUnitType,
    required this.unitType,
    required this.numberOfUnits,
    this.numberOfRooms,
    this.numberOfBathrooms,
    required this.unitArea,
    required this.landingArea,
  });

  factory ProjectUnitModel.fromJson(Map<String, dynamic> json) {
    return ProjectUnitModel(
      id: json['id'] ?? 0,
      subUnitType: json['sub_unit_type'],
      unitType: json['unit_type'] ?? '',
      numberOfUnits: json['number_of_units'] ?? 0,
      numberOfRooms: json['number_of_rooms'],
      numberOfBathrooms: json['number_of_bathrooms'],
      unitArea: (json['unit_area'] ?? 0).toDouble(),
      landingArea: (json['landing_area'] ?? 0).toDouble(),
    );
  }
}

class GalleryModel {
  final int id;
  final String url;
  final String type;

  GalleryModel({
    required this.id,
    required this.url,
    required this.type,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'] ?? 0,
      url: json['url'] ?? '',
      type: json['type'] ?? '',
    );
  }
}