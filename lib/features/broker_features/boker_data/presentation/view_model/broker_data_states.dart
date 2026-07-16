import '../../data/models/broker_units_model.dart';
import '../../data/models/requests_check_advertisement_count_model.dart';
import '../../data/models/unit_publish_as_ad_model.dart';

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


class GetRequestsCheckAdvertisementCountLoadingState extends BrokerDataStates {}

class GetRequestsCheckAdvertisementCountSuccessState extends BrokerDataStates {
  final RequestsCheckAdvertisementCountModel? requestsCheckAdvertisementCountModel;
  GetRequestsCheckAdvertisementCountSuccessState(this.requestsCheckAdvertisementCountModel);
}

class GetRequestsCheckAdvertisementCountErrorState extends BrokerDataStates {
  final String error;
  GetRequestsCheckAdvertisementCountErrorState(this.error);
}



class UnitPublishAsAdLoadingState extends BrokerDataStates {}

class UnitPublishAsAdSuccessState extends BrokerDataStates {
  final UnitPublishAsAdModel? unitPublishAsAdModel;
  UnitPublishAsAdSuccessState(this.unitPublishAsAdModel);
}

class UnitPublishAsAdErrorState extends BrokerDataStates {
  final String error;
  UnitPublishAsAdErrorState(this.error);
}