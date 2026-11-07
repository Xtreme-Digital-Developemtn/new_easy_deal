import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/home/data/models/best_seller_units_model.dart';
import '../../../../core/errors/failure.dart';
import '../../../create_request/data/models/sub_areas_model.dart';
import '../models/areas_model.dart';
import '../models/cities_model.dart';

abstract class SearchRepo{

  Future<Either<Failure,BestSellerUnitsModel>> getAllUnits({
    required int limit,
    required int offset,
    required String unitType,
    required String unitOperation,
    required String area,
    String city = '',
    String subArea = '',
    required String priceFrom,
    required String priceTo,
    required String unitAreaFrom,
    required String unitAreaTo,
    required String deliveryStatus,
    required String compoundType,
    String search = '',
});


  Future<Either<Failure,CitiesModel>> getAllCities();
  Future<Either<Failure,AreasModel>> getAllAreas({required int cityId});
  Future<Either<Failure,SubAreasModel>> getAllSubAreas({required int areaId});

//limit=12&offset=0
// &unitOperation=sell
// &area=1
// &priceFrom=100
// &priceTo=200
// &unitAreaFrom=12
// &unitAreaTo=50
// &deliveryStatus=immediate_delivery
// &compoundType=inside_compound


}