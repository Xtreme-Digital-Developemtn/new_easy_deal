import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/broker_units_model.dart';
import '../models/requests_check_advertisement_count_model.dart';
import '../models/unit_make_request_model.dart';
import '../models/unit_publish_as_ad_model.dart';
import '../models/unit_send_reply_model.dart';

abstract class BrokerDataRepo {
  Future<Either<Failure, BrokerUnitsModel>> getBrokerUnits({required int brokerId});
  Future<Either<Failure, RequestsCheckAdvertisementCountModel>> requestsCheckAdvertisementCount();
  Future<Either<Failure, UnitPublishAsAdModel>> unitPublishAsAd({required int id , required String caption});
  Future<Either<Failure, dynamic>> updateStatusUnitSold({required int id});
  Future<Either<Failure, UnitMakeRequestModel>> makeRequest({required int id , required int brokerId});
  Future<Either<Failure, UnitSendReplyModel>> sendReply({required int brokerId, required int requestId, required int senderId, required List<int> unitIds});
}