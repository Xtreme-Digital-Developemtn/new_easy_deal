import '../../data/models/map_location_model.dart';

abstract class BrokerMapsStates {}

class BrokerMapsInitState extends BrokerMapsStates {}

class GetMapsLoadingState extends BrokerMapsStates {}

class GetMapsSuccessState extends BrokerMapsStates {
  final BrokerMapsModel? mapsModel;
  GetMapsSuccessState(this.mapsModel);
}

class GetMapsErrorState extends BrokerMapsStates {
  final String error;
  GetMapsErrorState(this.error);
}