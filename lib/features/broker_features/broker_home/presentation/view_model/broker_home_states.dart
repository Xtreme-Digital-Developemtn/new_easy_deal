import '../../data/models/broker_statistics_model.dart';

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