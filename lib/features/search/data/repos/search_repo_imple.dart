import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/search/data/repos/search_repo.dart';
import '../../../../main_imports.dart';
import '../../../home/data/models/best_seller_units_model.dart';
import '../models/areas_model.dart';
import '../models/cities_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService? apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BestSellerUnitsModel>> getAllUnits({
    required int limit,
    required int offset,
    required String unitOperation,
    required String area,
    required String priceFrom,
    required String priceTo,
    required String unitAreaFrom,
    required String unitAreaTo,
    required String deliveryStatus,
    required String compoundType,
    required String unitType,
  })
  async {
    try {
      Map<String, String> queryParams = {
        'limit': limit.toString(),
        'offset': offset.toString(),
      };

      // دالة مساعدة للتحقق من القيمة
      bool isValidValue(String value) {
        return value.isNotEmpty && value.toLowerCase() != "null";
      }

      if (isValidValue(unitOperation)) queryParams["unitOperation"] = unitOperation;
      if (isValidValue(area)) queryParams["area"] = area;
      if (isValidValue(priceFrom)) queryParams["priceFrom"] = priceFrom;
      if (isValidValue(priceTo)) queryParams["priceTo"] = priceTo;
      if (isValidValue(unitAreaFrom)) queryParams["unitAreaFrom"] = unitAreaFrom;
      if (isValidValue(unitAreaTo)) queryParams["unitAreaTo"] = unitAreaTo;
      if (isValidValue(deliveryStatus)) queryParams["deliveryStatus"] = deliveryStatus;
      if (isValidValue(compoundType)) queryParams["compoundType"] = compoundType;
      if (isValidValue(unitType)) queryParams["unitType"] = unitType;

      var response = await apiService!.getData(
        endPoint: EndPoints.bestSellerUnitsInSearch,
        query: queryParams,
      );

      BestSellerUnitsModel result = BestSellerUnitsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, CitiesModel>> getAllCities()
  async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.cities,
      );
      CitiesModel result = CitiesModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, AreasModel>> getAllAreas({required int cityId})
  async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.areas,
        query: {
          "cityId" : cityId,
        }
      );
      AreasModel result = AreasModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}