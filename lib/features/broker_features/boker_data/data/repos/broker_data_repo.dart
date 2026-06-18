import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/broker_units_model.dart';

abstract class BrokerDataRepo {
  Future<Either<Failure, BrokerUnitsModel>> getBrokerUnits({required int brokerId});
}