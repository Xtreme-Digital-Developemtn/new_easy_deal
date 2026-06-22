import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/developer_projects_model.dart';
import '../models/developers_model.dart';

abstract class BrokerDevelopersRepo {
  Future<Either<Failure, DevelopersModel>> getDevelopers();
  Future<Either<Failure, DeveloperProjectsModel>> getDeveloperProjects(int developerId);
}