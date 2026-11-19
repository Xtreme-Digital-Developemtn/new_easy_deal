import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/search/data/models/areas_model.dart';
import 'package:easy_deal/features/search/data/models/cities_model.dart';
import 'package:easy_deal/features/create_request/data/models/sub_areas_model.dart';
import '../../../../core/app_services/remote_services/api_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/app_services/remote_services/end_points.dart';
import 'upload_broker_doc_repo.dart';

class UploadBrokerDocRepoImpl implements UploadBrokerDocRepo {
  final ApiService? apiService;
  UploadBrokerDocRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CitiesModel>> getAllCities() async {
    try {
      // من غير باراميترات الترقيم السيرفر بيرجّع data فاضية، وكمان الشاشة دي
      // بتتفتح قبل تسجيل الدخول فلازم public عشان مايتبعتش توكن قديم.
      var response = await apiService!.getData(
        endPoint: EndPoints.cities,
        query: {'limit': 100, 'offset': 0, 'sort': 'asc', 'sortBy': 'id'},
        public: true,
      );
      return right(CitiesModel.fromJson(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, AreasModel>> getAllAreas({required int cityId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.areas,
        query: {'cityId': cityId, 'limit': 100, 'offset': 0, 'sort': 'asc', 'sortBy': 'id'},
        public: true,
      );
      return right(AreasModel.fromJson(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, SubAreasModel>> getAllSubAreas({required int areaId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.subAreas,
        query: {'areaId': areaId, 'limit': 100, 'offset': 0, 'sort': 'asc', 'sortBy': 'id'},
        public: true,
      );
      return right(SubAreasModel.fromJson(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }
}
