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