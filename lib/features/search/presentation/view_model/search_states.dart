import 'package:easy_deal/features/search/data/models/cities_model.dart';

import '../../../home/data/models/best_seller_units_model.dart';
import '../../data/models/areas_model.dart';

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
class GetAllUnitsLoadMoreSuccessState extends SearchStates {
  final BestSellerUnitsModel model;
  GetAllUnitsLoadMoreSuccessState(this.model);
}

class SelectProperTypeState extends SearchStates{}
class SelectTheProcessState extends SearchStates{}
class SelectDeliveryStatusState extends SearchStates{}
class SelectTypeState extends SearchStates{}

class ResetFiltersState extends SearchStates{}

class GetAllCitiesLoadingState extends SearchStates{}
class GetAllCitiesSuccessState extends SearchStates{
  final CitiesModel citiesModel;
  GetAllCitiesSuccessState(this.citiesModel);

}
class GetAllCitiesErrorState extends SearchStates{
  final String error;
  GetAllCitiesErrorState(this.error);

}


class GetAllAreasLoadingState extends SearchStates{}
class GetAllAreasSuccessState extends SearchStates{
  final AreasModel areasModel;
  GetAllAreasSuccessState(this.areasModel);

}
class GetAllAreasErrorState extends SearchStates{
  final String error;
  GetAllAreasErrorState(this.error);

}


class SelectTheCityState extends SearchStates{}
class SelectTheAreaState extends SearchStates{}