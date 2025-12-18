import 'package:easy_deal/features/home/data/models/best_seller_units_model.dart';
import 'package:easy_deal/features/home/data/models/unit_types_model.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class ChangeHomeSliderImageState extends HomeStates {}

class ChooseCategoryState extends HomeStates {}

class GetBestSellerUnitsInHomeLoadingState extends HomeStates {}

class GetBestSellerUnitsInHomeErrorState extends HomeStates {
  final String error;

  GetBestSellerUnitsInHomeErrorState(this.error);
}

class GetBestSellerUnitsInHomeSuccessState extends HomeStates {
  final BestSellerUnitsModel bestSellerUnitsModel;

  GetBestSellerUnitsInHomeSuccessState(this.bestSellerUnitsModel);
}


class GetUnitTypesLoadingState extends HomeStates {}

class GetUnitTypesErrorState extends HomeStates {
  final String error;

  GetUnitTypesErrorState(this.error);
}

class GetUnitTypesSuccessState extends HomeStates {
  final UnitTypesModel unitTypesModel;

  GetUnitTypesSuccessState(this.unitTypesModel);
}
