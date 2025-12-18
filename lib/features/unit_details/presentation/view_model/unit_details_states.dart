import 'package:easy_deal/features/unit_details/data/models/unit_details_model.dart';

abstract class UnitDetailsStates{}

class UnitDetailsInitState extends UnitDetailsStates{}

class GetUnitDetailsLoadingState extends UnitDetailsStates{}
class GetUnitDetailsErrorState extends UnitDetailsStates{
  final String error;
  GetUnitDetailsErrorState(this.error);

}
class GetUnitDetailsSuccessState extends UnitDetailsStates{
  final UnitDetailsModel unitDetailsModel;
  GetUnitDetailsSuccessState(this.unitDetailsModel);

}

