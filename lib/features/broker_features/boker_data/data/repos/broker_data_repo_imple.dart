import 'package:dartz/dartz.dart';
import '../../../../../main_imports.dart';
import '../models/broker_units_model.dart';
import '../models/requests_check_advertisement_count_model.dart';
import '../models/unit_publish_as_ad_model.dart';
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
  Future<Either<Failure, UnitPublishAsAdModel>> unitPublishAsAd({required int id, required String caption}) async {
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


}