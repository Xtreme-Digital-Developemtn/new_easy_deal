import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/unit_details_model.dart';

abstract class UnitDetailsRepo{

  Future<Either<Failure,UnitDetailsModel>> getUnitDetails({required int unitId});



}