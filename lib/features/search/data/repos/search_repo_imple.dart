import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/search/data/repos/search_repo.dart';
import '../../../../main_imports.dart';
import '../../../home/data/models/best_seller_units_model.dart';
import '../../../create_request/data/models/sub_areas_model.dart';
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
    String city = '',
    String subArea = '',
    required String priceFrom,
    required String priceTo,
    required String unitAreaFrom,
    required String unitAreaTo,
    required String deliveryStatus,
    required String compoundType,
    required String unitType,
    String search = '',
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

      // الـ ids لازم تكون رقم موجب — القيم زي 0 أو "null" بتخلي الـ API
      // يرجع نتائج فاضية أو خطأ "Invalid data sent"
      bool isValidId(String value) {
        final id = int.tryParse(value.trim());
        return id != null && id > 0;
      }

      if (isValidValue(unitOperation)) queryParams["unitOperation"] = unitOperation;
      if (isValidId(area)) queryParams["area"] = area;
      if (isValidId(city)) queryParams["city"] = city;
      if (isValidId(subArea)) queryParams["subArea"] = subArea;
      if (isValidValue(priceFrom)) queryParams["priceFrom"] = priceFrom;
      if (isValidValue(priceTo)) queryParams["priceTo"] = priceTo;
      if (isValidValue(unitAreaFrom)) queryParams["unitAreaFrom"] = unitAreaFrom;
      if (isValidValue(unitAreaTo)) queryParams["unitAreaTo"] = unitAreaTo;
      if (isValidValue(deliveryStatus)) queryParams["deliveryStatus"] = deliveryStatus;
      if (isValidValue(compoundType)) queryParams["compoundType"] = compoundType;
      if (isValidValue(unitType)) queryParams["unitType"] = unitType;
      if (search.isNotEmpty) queryParams["search"] = search;

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

  /// الـ API بيرجّع `data` فاضية من غير pagination — لازم limit/offset
  /// زي ما باقي التطبيق بيبعتها (وبيستخدم نفس الترتيب asc/by id).
  static const Map<String, dynamic> _listQuery = {
    "limit": 100,
    "offset": 0,
    "sort": "asc",
    "sortBy": "id",
  };

  @override
  Future<Either<Failure, CitiesModel>> getAllCities()
  async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.cities,
        query: _listQuery,
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
          ..._listQuery,
          "cityId": cityId,
        }
      );
      AreasModel result = AreasModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, SubAreasModel>> getAllSubAreas({required int areaId})
  async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.subAreas,
        query: {
          ..._listQuery,
          "areaId": areaId,
        }
      );
      SubAreasModel result = SubAreasModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}