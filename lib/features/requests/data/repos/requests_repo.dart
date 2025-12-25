
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/all_request_model.dart';

abstract class RequestsRepo{

  Future<Either<Failure,AllRequestModel>> getAllRequest();

}