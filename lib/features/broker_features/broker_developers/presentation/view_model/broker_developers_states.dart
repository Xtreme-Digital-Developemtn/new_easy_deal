import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/features/unit_details/data/models/unit_details_response.dart';
import '../../data/models/models_response.dart';
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

class ContractRequestLoadingState extends BrokerDevelopersStates {}

class ContractRequestSuccessState extends BrokerDevelopersStates {
  final String message;
  ContractRequestSuccessState(this.message);
}

class ContractRequestErrorState extends BrokerDevelopersStates {
  final String error;
  ContractRequestErrorState(this.error);
}

class GetProjectModelsLoadingState extends BrokerDevelopersStates {}

class GetProjectModelsSuccessState extends BrokerDevelopersStates {
  final ModelsResponse? modelsResponse;
  GetProjectModelsSuccessState(this.modelsResponse);
}

class GetProjectModelsErrorState extends BrokerDevelopersStates {
  final String error;
  GetProjectModelsErrorState(this.error);
}

class GetModelUnitsLoadingState extends BrokerDevelopersStates {}

class GetModelUnitsSuccessState extends BrokerDevelopersStates {
  final BrokerUnitsModel? unitsModel;
  GetModelUnitsSuccessState(this.unitsModel);
}

class GetModelUnitsErrorState extends BrokerDevelopersStates {
  final String error;
  GetModelUnitsErrorState(this.error);
}

class GetUnitDetailsLoadingState extends BrokerDevelopersStates {}

class GetUnitDetailsSuccessState extends BrokerDevelopersStates {
  final UnitDetailsResponse unitDetails;
  GetUnitDetailsSuccessState(this.unitDetails);
}

class GetUnitDetailsErrorState extends BrokerDevelopersStates {
  final String error;
  GetUnitDetailsErrorState(this.error);
}