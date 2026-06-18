import 'package:dartz/dartz.dart';
import '../../../../../main_imports.dart';
import '../models/broker_units_model.dart';
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
}