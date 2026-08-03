import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../../main_imports.dart';
import '../../../boker_data/data/models/broker_units_model.dart';
import '../../../../unit_details/data/models/unit_details_response.dart';
import '../models/models_response.dart';
import '../models/developer_projects_model.dart';
import '../models/developers_model.dart';
import 'broker_developers_repo.dart';

class BrokerDevelopersRepoImpl implements BrokerDevelopersRepo {
  final ApiService? apiService;
  BrokerDevelopersRepoImpl(this.apiService);

  @override
  Future<Either<Failure, DevelopersModel>> getDevelopers() async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.developers,
      );
      DevelopersModel result = DevelopersModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, DeveloperProjectsModel>> getDeveloperProjects(int developerId) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.developerProjects,
        query: {
          "limit": 10,
          "offset": 0,
          "sort": "desc",
          "sortBy": "id",
          "developerId": developerId,
        },
      );
      DeveloperProjectsModel result = DeveloperProjectsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, ModelsResponse>> getProjectModels(int projectId) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.models,
        query: {
          "limit": 10,
          "offset": 0,
          "sort": "desc",
          "sortBy": "id",
          "projectId": projectId,
        },
      );
      ModelsResponse result = ModelsResponse.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, BrokerUnitsModel>> getModelUnits(int modelId) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.modelUnits,
        query: {
          "limit": 100,
          "offset": 0,
          "sort": "desc",
          "sortBy": "id",
          "modelId": modelId,
        },
      );
      BrokerUnitsModel result = BrokerUnitsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, UnitDetailsResponse>> getUnitDetails(int unitId) async {
    try {
      var response = await apiService!.getData(
        endPoint: '${EndPoints.unitDetails}/$unitId',
      );
      UnitDetailsResponse result = UnitDetailsResponse.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendContractRequest({
    required int brokerId,
    required int developerId,
    File? image,
    File? idFront,
    File? idBack,
    File? commercialRegistryImage,
    File? taxCardImage,
  }) async {
    try {
      final formData = FormData();
      formData.fields.add(MapEntry('brokerId', brokerId.toString()));
      formData.fields.add(MapEntry('developerId', developerId.toString()));

      if (image != null) {
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
        ));
      }
      if (idFront != null) {
        formData.files.add(MapEntry(
          'idFront',
          await MultipartFile.fromFile(idFront.path, filename: idFront.path.split('/').last),
        ));
      }
      if (idBack != null) {
        formData.files.add(MapEntry(
          'idBack',
          await MultipartFile.fromFile(idBack.path, filename: idBack.path.split('/').last),
        ));
      }
      if (commercialRegistryImage != null) {
        formData.files.add(MapEntry(
          'commercialRegistryImage',
          await MultipartFile.fromFile(commercialRegistryImage.path, filename: commercialRegistryImage.path.split('/').last),
        ));
      }
      if (taxCardImage != null) {
        formData.files.add(MapEntry(
          'taxCardImage',
          await MultipartFile.fromFile(taxCardImage.path, filename: taxCardImage.path.split('/').last),
        ));
      }

      var response = await apiService!.postData(
        endPoint: EndPoints.brokerRequest,
        data: formData,
      );
      return right(Map<String, dynamic>.from(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }



  @override
  Future<Either<Failure, ProjectData>> updateProject({
    required int projectId,
    required ProjectData project,
  }) async {
    try {
      final response = await apiService!.postData(
        endPoint:'developers/projects/$projectId',
        data: {
          'name': project.name,
          'designer': project.designer,
          'projectExecutor': project.projectExecutor,
          'managementTeam': project.managementTeam,
          'type': project.type,
          'projectType': project.projectType,
          'address': project.address,
          'googleMapUrl': project.googleMapUrl,
          'apartmentsCount': project.apartmentsCount,
          'duplexesCount': project.duplexesCount,
          'penthousesCount': project.penthousesCount,
          'iVillaCount': project.iVillaCount,
          'studiosCount': project.studiosCount,
          'roofsCount': project.roofsCount,
          'basementsCount': project.basementsCount,
          'twinHousesCount': project.twinHousesCount,
          'townHousesCount': project.townHousesCount,
          'standaloneVillasCount': project.standaloneVillasCount,
          'administrativeUnitsCount': project.administrativeUnitsCount,
          'commercialUnitsCount': project.commercialUnitsCount,
          'medicalClinicsCount': project.medicalClinicsCount,
          'pharmaciesCount': project.pharmaciesCount,
          'commercialAdministrativeBuildingCount':
          project.commercialAdministrativeBuildingCount,
          if (project.city != null) 'cityId': project.city!.id,
          if (project.area != null) 'areaId': project.area!.id,
          if (project.subArea != null) 'subAreaId': project.subArea!.id,
          if (project.developer != null) 'developerId': project.developer!.id,
        },
      );

      final data = response.data['data'] ?? response.data;
      return Right(ProjectData.fromJson(data));
    } on DioException catch (e) {
      // 🔍 مؤقتًا: اطبع الرد كامل عشان تعرف السيرفر رافض إيه بالظبط
      print('❌ Update Project Error Response: ${e.response?.data}');

      final errors = e.response?.data['errors'];
      String errorMessage;
      if (errors != null && errors is Map) {
        // Laravel validation errors: {"field": ["message1", "message2"]}
        errorMessage = errors.values
            .expand((v) => v is List ? v : [v.toString()])
            .join('\n');
      } else {
        errorMessage = e.response?.data['message']?.toString() ??
            e.message ??
            'حدث خطأ أثناء التحديث';
      }

      return Left(ServerFailure(errorMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}