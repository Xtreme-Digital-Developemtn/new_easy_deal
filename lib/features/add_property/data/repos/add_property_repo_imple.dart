import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../../../search/data/models/cities_model.dart';
import '../../../search/data/models/areas_model.dart';
import '../../../create_request/data/models/sub_areas_model.dart';
import 'add_property_repo.dart';

class AddPropertyRepoImpl implements AddPropertyRepo {
  final ApiService? apiService;
  AddPropertyRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createUnit(FormData formData) async {
    try {
      var response = await apiService!.postData(
        endPoint: EndPoints.createUnit,
        data: formData,
        isMultipart: true,
      );
      return right(Map<String, dynamic>.from(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, CitiesModel>> getAllCities() async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.cities,
        query: {'limit': 100, 'offset': 0, 'sort': 'asc', 'sortBy': 'id'},
      );
      return right(CitiesModel.fromJson(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, AreasModel>> getAreas({required int cityId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.areas,
        query: {'cityId': cityId, 'limit': 100, 'offset': 0, 'sort': 'asc', 'sortBy': 'id'},
      );
      return right(AreasModel.fromJson(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, SubAreasModel>> getSubAreas({required int areaId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.subAreas,
        query: {'areaId': areaId, 'limit': 100, 'offset': 0, 'sort': 'asc', 'sortBy': 'id'},
      );
      return right(SubAreasModel.fromJson(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }
}
