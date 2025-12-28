import 'package:easy_deal/features/search/data/models/all_units_model.dart';

abstract class SearchStates{}

class SearchInitState extends SearchStates{}

class GetAllUnitsLoadingState extends SearchStates{}
class GetAllUnitsSuccessState extends SearchStates{
  final AllUnitsModel allUnitsModel;
  GetAllUnitsSuccessState(this.allUnitsModel);

}
class GetAllUnitsErrorState extends SearchStates{
  final String error;
  GetAllUnitsErrorState(this.error);

}