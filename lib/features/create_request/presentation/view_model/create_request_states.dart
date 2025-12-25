import 'package:easy_deal/features/create_request/data/models/dynamic_forms_data_model.dart';

abstract class CreateRequestStates{}

class CreateRequestInitState extends CreateRequestStates{}

class CategorySelectedState extends CreateRequestStates{
  final int index;

  CategorySelectedState(this.index);

}


class SelectSpecializationState extends CreateRequestStates{}
class SelectDealTypeState extends CreateRequestStates{}
class SelectUnitTypeState extends CreateRequestStates{}

class MoveNextStepState extends CreateRequestStates{}

class SelectCityState extends CreateRequestStates{}
class SelectAreaState extends CreateRequestStates{}
class SelectSubAreaState extends CreateRequestStates{}

class SelectUnitLocationFromTheFrontState extends CreateRequestStates{}
class SelectTheUnitViewState extends CreateRequestStates{}

class SelectDeliveryStatusState extends CreateRequestStates{}
class SelectOtherLuxuriesState extends CreateRequestStates{}
class SelectFloorState extends CreateRequestStates{}
class SelectFinishingConditionState extends CreateRequestStates{}
class SelectPaymentSystemState extends CreateRequestStates{}

class UploadMainImageSuccessState extends CreateRequestStates {}
class ClearMainImageSuccessState extends CreateRequestStates {}

class UploadImageErrorState extends CreateRequestStates {}

class UploadVideoSuccessState extends CreateRequestStates {}
class ClearVideoSuccessState extends CreateRequestStates {}

class UploadFinancialStatementSuccessState extends CreateRequestStates {}
class ClearFinancialStatementSuccessState extends CreateRequestStates {}

class UploadMasterPlanSuccessState extends CreateRequestStates {}
class ClearMasterPlanSuccessState extends CreateRequestStates {}


class GetDynamicFormsDataLoadingState extends CreateRequestStates {}
class GetDynamicFormsDataSuccessState extends CreateRequestStates {
  final DynamicFormsDataModel dynamicFormsDataModel;

  GetDynamicFormsDataSuccessState(this.dynamicFormsDataModel);
}
class GetDynamicFormsDataErrorState extends CreateRequestStates {
  final String error;
  GetDynamicFormsDataErrorState(this.error);

}
