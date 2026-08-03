import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../boker_data/data/models/broker_units_model.dart';
import '../models/models_response.dart';
import '../models/developer_projects_model.dart';
import '../models/developers_model.dart';
import '../../../../unit_details/data/models/unit_details_response.dart';

abstract class BrokerDevelopersRepo {
  Future<Either<Failure, DevelopersModel>> getDevelopers();
  Future<Either<Failure, DeveloperProjectsModel>> getDeveloperProjects(int developerId);
  Future<Either<Failure, ModelsResponse>> getProjectModels(int projectId);
  Future<Either<Failure, BrokerUnitsModel>> getModelUnits(int modelId);
  Future<Either<Failure, UnitDetailsResponse>> getUnitDetails(int unitId);
  Future<Either<Failure, Map<String, dynamic>>> sendContractRequest({
    required int brokerId,
    required int developerId,
    File? image,
    File? idFront,
    File? idBack,
    File? commercialRegistryImage,
    File? taxCardImage,
  });

  /// تحديث بيانات مشروع موجود
  /// endpoint: developers/projects/{projectId}
  Future<Either<Failure, ProjectData>> updateProject({
    required int projectId,
    required ProjectData project,
  });
}
