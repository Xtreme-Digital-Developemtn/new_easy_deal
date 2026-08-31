import '../../data/models/broker_statistics_model.dart';
import '../../data/models/last_requests_model_in_home.dart';

abstract class BrokerHomeStates{}

class BrokerHomeInitState extends BrokerHomeStates{}

class SelectCategoryItemState extends BrokerHomeStates{}

class GetBrokerStatisticsLoadingState extends BrokerHomeStates{}
class GetBrokerStatisticsSuccessState extends BrokerHomeStates{
  final BrokerStatisticsModel brokerStatisticsModel;
  GetBrokerStatisticsSuccessState(this.brokerStatisticsModel);

}
class GetBrokerStatisticsErrorState extends BrokerHomeStates{
  final String error;
  GetBrokerStatisticsErrorState(this.error);

}

class GetLastRequestsModelInHomeLoadingState extends BrokerHomeStates{}
class GetLastRequestsModelInHomeSuccessState extends BrokerHomeStates{
  final LastRequestsModelInHome lastRequestsModelInHome;
  GetLastRequestsModelInHomeSuccessState(this.lastRequestsModelInHome);

}
class GetLastRequestsModelInHomeErrorState extends BrokerHomeStates{
  final String error;
  GetLastRequestsModelInHomeErrorState(this.error);

}