import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../boker_data/data/models/broker_units_model.dart';
import '../models/models_response.dart';
import '../models/developer_projects_model.dart';
import '../models/developer_sales_model.dart' hide Project;
import '../models/developers_model.dart';
import '../../../../unit_details/data/models/unit_details_response.dart';

abstract class BrokerDevelopersRepo {
  Future<Either<Failure, DevelopersModel>> getDevelopers({
    Map<String, dynamic>? filters,
  });
  Future<Either<Failure, DeveloperProjectsModel>> getDeveloperProjects(
    int developerId, {
    Map<String, dynamic>? filters,
  });
  Future<Either<Failure, ModelsResponse>> getProjectModels(int projectId);

  /// جلب فريق المبيعات:
  /// - بدون projectId => كل مبيعات المطور: GET developer-sales/{developerId}/sales
  /// - مع projectId => مبيعات مشروع محدد: GET developer-sales/{developerId}/sales?project_id={projectId}
  Future<Either<Failure, DeveloperSalesModel>> getDeveloperSales(
    int developerId, {
    int? projectId,
  });
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
