import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/broker_model.dart';

abstract class AssignToBrokerRepo{
  Future<Either<Failure, List<BrokerModel>>> getRecommendedBrokers(int requestId);
  Future<Either<Failure, Map<String, dynamic>>> assignBrokers(int requestId, int senderId, List<int> brokerIds);
}