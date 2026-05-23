import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../models/dynamic_forms_data_model.dart';
import '../models/sub_areas_model.dart';
import '../../../search/data/models/cities_model.dart';
import '../../../search/data/models/areas_model.dart';

abstract class CreateRequestRepo{

   Future<Either<Failure,DynamicFormsDataModel>> getDynamicFormsData({
     required String unit,
     required String type,
     required String specializationScope,
   });

   Future<Either<Failure, Map<String, dynamic>>> createRequest(FormData formData);

   Future<Either<Failure, CitiesModel>> getAllCities();
   Future<Either<Failure, AreasModel>> getAreas({required int cityId});
   Future<Either<Failure, SubAreasModel>> getSubAreas({required int areaId});
}