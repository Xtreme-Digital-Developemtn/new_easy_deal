import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../search/data/models/cities_model.dart';
import '../../../search/data/models/areas_model.dart';
import '../../../create_request/data/models/sub_areas_model.dart';

abstract class UploadBrokerDocRepo{
  Future<Either<Failure, CitiesModel>> getAllCities();
  Future<Either<Failure, AreasModel>> getAllAreas({required int cityId});
  Future<Either<Failure, SubAreasModel>> getAllSubAreas({required int areaId});
}
