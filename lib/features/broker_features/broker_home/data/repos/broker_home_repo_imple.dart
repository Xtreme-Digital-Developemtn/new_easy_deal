import 'package:dartz/dartz.dart';

import '../../../../../core/app_services/remote_services/api_service.dart';
import '../../../../../core/app_services/remote_services/end_points.dart';
import '../../../../../core/errors/error_handler.dart';
import '../../../../../core/errors/failure.dart';
import '../models/broker_statistics_model.dart';
import 'broker_home_repo.dart';


class BrokerHomeRepoImpl implements BrokerHomeRepo {
  final ApiService? apiService;
  BrokerHomeRepoImpl(this.apiService);




@override
Future<Either<Failure, BrokerStatisticsModel>> getBrokerStatistics({required int brokerId}) async{
  try {
    var response = await apiService!.getData(
      endPoint: "${EndPoints.requestsStatistics}/$brokerId",
    );
    BrokerStatisticsModel result = BrokerStatisticsModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}