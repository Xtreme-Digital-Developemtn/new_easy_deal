import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../models/broker_statistics_model.dart';
import '../models/last_requests_model_in_home.dart';

abstract class BrokerHomeRepo{

   Future<Either<Failure,BrokerStatisticsModel>> getBrokerStatistics({required int brokerId});
   Future<Either<Failure,LastRequestsModelInHome>> getLastRequestsModelInHome({required int brokerId});


}