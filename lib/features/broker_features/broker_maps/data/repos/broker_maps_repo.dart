import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/map_location_model.dart';

abstract class BrokerMapsRepo {
  Future<Either<Failure, BrokerMapsModel>> getMaps({required int brokerId});
}