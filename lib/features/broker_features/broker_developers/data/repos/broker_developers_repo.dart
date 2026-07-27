import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/models_response.dart';
import '../models/developer_projects_model.dart';
import '../models/developers_model.dart';

abstract class BrokerDevelopersRepo {
  Future<Either<Failure, DevelopersModel>> getDevelopers();
  Future<Either<Failure, DeveloperProjectsModel>> getDeveloperProjects(int developerId);
  Future<Either<Failure, ModelsResponse>> getProjectModels(int projectId);
  Future<Either<Failure, Map<String, dynamic>>> sendContractRequest({
    required int brokerId,
    required int developerId,
    File? image,
    File? idFront,
    File? idBack,
    File? commercialRegistryImage,
    File? taxCardImage,
  });
}