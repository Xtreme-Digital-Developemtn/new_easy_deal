import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/request_details_model.dart';

abstract class RequestDetailsRepo{

 Future<Either<Failure , RequestDetailsModel>> requestDetails({required int requestId});

}
