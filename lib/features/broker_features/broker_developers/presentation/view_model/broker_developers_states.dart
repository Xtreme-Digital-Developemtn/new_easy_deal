import '../../data/models/developer_projects_model.dart';
import '../../data/models/developers_model.dart';

abstract class BrokerDevelopersStates {}

class BrokerDevelopersInitState extends BrokerDevelopersStates {}

class GetDevelopersLoadingState extends BrokerDevelopersStates {}

class GetDevelopersSuccessState extends BrokerDevelopersStates {
  final DevelopersModel? developersModel;
  GetDevelopersSuccessState(this.developersModel);
}

class GetDevelopersErrorState extends BrokerDevelopersStates {
  final String error;
  GetDevelopersErrorState(this.error);
}

class GetDeveloperProjectsLoadingState extends BrokerDevelopersStates {}

class GetDeveloperProjectsSuccessState extends BrokerDevelopersStates {
  final DeveloperProjectsModel? projectsModel;
  GetDeveloperProjectsSuccessState(this.projectsModel);
}

class GetDeveloperProjectsErrorState extends BrokerDevelopersStates {
  final String error;
  GetDeveloperProjectsErrorState(this.error);
}