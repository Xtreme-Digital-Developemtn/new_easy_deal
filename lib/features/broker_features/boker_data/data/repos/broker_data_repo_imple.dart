import 'package:dartz/dartz.dart';
import '../../../../../main_imports.dart';
import '../models/broker_units_model.dart';
import '../models/requests_check_advertisement_count_model.dart';
import '../models/unit_make_request_model.dart';
import '../models/unit_publish_as_ad_model.dart';
import '../models/unit_send_reply_model.dart';
import 'broker_data_repo.dart';

class BrokerDataRepoImpl implements BrokerDataRepo {
  final ApiService? apiService;
  BrokerDataRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BrokerUnitsModel>> getBrokerUnits({required int brokerId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: '${EndPoints.brokerUnits}?limit=10&offset=0&sort=desc&sortBy=id&brokerId=$brokerId',
      );
      BrokerUnitsModel result = BrokerUnitsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, RequestsCheckAdvertisementCountModel>> requestsCheckAdvertisementCount() async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.requestsCheckAdvertisementCount,
      );
      RequestsCheckAdvertisementCountModel result = RequestsCheckAdvertisementCountModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, UnitPublishAsAdModel>> unitPublishAsAd({required int id, required String caption})
  async {
    try {
      var response = await apiService!.postData(
        endPoint: "${EndPoints.unitPublishAsAd}/$id",
        data: {
          "caption" : caption,
        },
      );
      UnitPublishAsAdModel result = UnitPublishAsAdModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, dynamic>> updateStatusUnitSold({required int id })
  async {
    try {
      var data = FormData.fromMap({
        'unitIds[]': "$id"
      });
      var response = await apiService!.postData(
        endPoint: EndPoints.updateStatusUnitSold,
        data:data
      );
      // UnitPublishAsAdModel result = UnitPublishAsAdModel.fromJson(response.data);
      return right(response.data);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, UnitMakeRequestModel>> makeRequest({required int id , required int brokerId})
  async {
    try {
      var response = await apiService!.postData(
          endPoint: "${EndPoints.makeRequest}/$id/$brokerId",

      );
      UnitMakeRequestModel result = UnitMakeRequestModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, UnitSendReplyModel>> sendReply({required int brokerId, required int requestId, required int senderId, required List<int> unitIds})
  async {
    try {
      var data = FormData.fromMap({
        'brokerId': brokerId,
        'requestId': requestId,
        'senderId': senderId,
        'unitIds[]': unitIds,
      });
      var response = await apiService!.postData(
        endPoint: EndPoints.requestReplies,
        data: data,
      );
      UnitSendReplyModel result = UnitSendReplyModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}