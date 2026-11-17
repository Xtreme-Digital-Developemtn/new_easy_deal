import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../search/data/models/cities_model.dart';
import '../../../search/data/models/areas_model.dart';
import '../../../create_request/data/models/sub_areas_model.dart';
import '../../../broker_features/boker_data/data/models/requests_check_advertisement_count_model.dart';

abstract class AddPropertyRepo {
  Future<Either<Failure, CitiesModel>> getAllCities();
  Future<Either<Failure, AreasModel>> getAreas({required int cityId});
  Future<Either<Failure, SubAreasModel>> getSubAreas({required int areaId});
  Future<Either<Failure, Map<String, dynamic>>> createUnit(FormData formData);

  /// نفس الـ endpoint اللي شاشة «بياناتي» بتستخدمه قبل نشر أي إعلان،
  /// بنستخدمه هنا كمان قبل «إضافة عقار ونشر» للتأكد من حد الإعلانات.
  Future<Either<Failure, RequestsCheckAdvertisementCountModel>> checkAdvertisementCount();
}
