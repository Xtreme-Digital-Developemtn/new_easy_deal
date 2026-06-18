import '../../data/models/broker_units_model.dart';

abstract class BrokerDataStates {}

class BrokerDataInitState extends BrokerDataStates {}

class GetBrokerUnitsLoadingState extends BrokerDataStates {}

class GetBrokerUnitsSuccessState extends BrokerDataStates {
  final BrokerUnitsModel? brokerUnitsModel;
  GetBrokerUnitsSuccessState(this.brokerUnitsModel);
}

class GetBrokerUnitsErrorState extends BrokerDataStates {
  final String error;
  GetBrokerUnitsErrorState(this.error);
}