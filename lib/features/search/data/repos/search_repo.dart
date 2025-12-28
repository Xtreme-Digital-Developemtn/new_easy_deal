import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/all_units_model.dart';

abstract class SearchRepo{

  Future<Either<Failure,AllUnitsModel>> getAllUnits();




}