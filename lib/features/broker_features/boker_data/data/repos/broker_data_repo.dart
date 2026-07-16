import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/broker_units_model.dart';
import '../models/requests_check_advertisement_count_model.dart';
import '../models/unit_publish_as_ad_model.dart';

abstract class BrokerDataRepo {
  Future<Either<Failure, BrokerUnitsModel>> getBrokerUnits({required int brokerId});
  Future<Either<Failure, RequestsCheckAdvertisementCountModel>> requestsCheckAdvertisementCount();
  Future<Either<Failure, UnitPublishAsAdModel>> unitPublishAsAd({required int id , required String caption});
}