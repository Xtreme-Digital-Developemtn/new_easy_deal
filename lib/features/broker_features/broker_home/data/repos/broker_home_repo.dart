import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../models/broker_statistics_model.dart';

abstract class BrokerHomeRepo{

   Future<Either<Failure,BrokerStatisticsModel>> getBrokerStatistics({required int brokerId});


}