abstract class AssignToBrokerStates{}

class AssignToBrokerInitState extends AssignToBrokerStates{}

class ToggleItemSelectionState extends AssignToBrokerStates{}
class ToggleSelectAllState extends AssignToBrokerStates{}

class GetRecommendedBrokersLoadingState extends AssignToBrokerStates{}
class GetRecommendedBrokersSuccessState extends AssignToBrokerStates{}
class GetRecommendedBrokersErrorState extends AssignToBrokerStates{
  final String error;
  GetRecommendedBrokersErrorState(this.error);
}

class AssignBrokersLoadingState extends AssignToBrokerStates{}
class AssignBrokersSuccessState extends AssignToBrokerStates{}
class AssignBrokersErrorState extends AssignToBrokerStates{
  final String error;
  AssignBrokersErrorState(this.error);
}