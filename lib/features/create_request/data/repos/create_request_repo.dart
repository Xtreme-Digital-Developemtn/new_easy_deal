import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/dynamic_forms_data_model.dart';

abstract class CreateRequestRepo{

   Future<Either<Failure,DynamicFormsDataModel>> getDynamicFormsData({
     required String unit,
     required String type,
     required String specializationScope,
});


}