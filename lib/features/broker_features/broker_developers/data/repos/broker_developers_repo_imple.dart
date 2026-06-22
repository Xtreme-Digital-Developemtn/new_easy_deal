import 'package:dartz/dartz.dart';
import '../../../../../main_imports.dart';
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
}