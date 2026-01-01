import 'package:easy_deal/features/search/data/models/all_units_model.dart';

import '../../../home/data/models/best_seller_units_model.dart';

abstract class SearchStates{}

class SearchInitState extends SearchStates{}

class GetAllUnitsLoadingState extends SearchStates{}
class GetAllUnitsLoadingMoreState extends SearchStates{}
class GetAllUnitsSuccessState extends SearchStates{
  final BestSellerUnitsModel allUnitsModel;
  GetAllUnitsSuccessState(this.allUnitsModel);

}
class GetAllUnitsFilterSuccessState extends SearchStates{
  final BestSellerUnitsModel allUnitsModel;
  GetAllUnitsFilterSuccessState(this.allUnitsModel);

}
class GetAllUnitsErrorState extends SearchStates{
  final String error;
  GetAllUnitsErrorState(this.error);

}


class SelectProperTypeState extends SearchStates{}
class SelectTheProcessState extends SearchStates{}
class SelectDeliveryStatusState extends SearchStates{}
class SelectTypeState extends SearchStates{}

class ResetFiltersState extends SearchStates{}