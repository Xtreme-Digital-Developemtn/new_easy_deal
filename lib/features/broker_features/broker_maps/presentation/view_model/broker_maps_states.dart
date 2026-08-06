import 'package:easy_deal/features/broker_features/broker_maps/data/models/add_map_model.dart';

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


class AddMapLoadingState extends BrokerMapsStates {}

class AddMapSuccessState extends BrokerMapsStates {
  final AddMapModel? addMapModel;
  AddMapSuccessState(this.addMapModel);
}

class AddMapErrorState extends BrokerMapsStates {
  final String error;
  AddMapErrorState(this.error);
}