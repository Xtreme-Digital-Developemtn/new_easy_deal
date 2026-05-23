import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../main_imports.dart';
import '../models/dynamic_forms_data_model.dart';
import '../models/sub_areas_model.dart';
import '../../../search/data/models/cities_model.dart';
import '../../../search/data/models/areas_model.dart';
import 'create_request_repo.dart';


class CreateRequestRepoImpl implements CreateRequestRepo {
  final ApiService? apiService;
  CreateRequestRepoImpl(this.apiService);

@override
Future<Either<Failure, DynamicFormsDataModel>> getDynamicFormsData({
  required String unit,
  required String type,
  required String specializationScope,
}) async {
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.dynamicForms,
      query: {
        "specialization_scope" : specializationScope,
        "type_filter": type,
        "unit_filter": unit,
      },
    );
    DynamicFormsDataModel result = DynamicFormsDataModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}

@override
Future<Either<Failure, Map<String, dynamic>>> createRequest(FormData formData) async {
  try {
    var response = await apiService!.postData(
      endPoint: EndPoints.createRequest,
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
