import 'package:easy_deal/features/home/data/models/best_seller_units_model.dart';

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
