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


class SendUnitInquiryLoadingState extends UnitDetailsStates{}
class SendUnitInquiryErrorState extends UnitDetailsStates{
  final String error;
  SendUnitInquiryErrorState(this.error);

}
class SendUnitInquirySuccessState extends UnitDetailsStates{}
