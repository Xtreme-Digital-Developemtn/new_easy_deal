import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/broker_model.dart';
import 'assign_to_broker_repo.dart';


class AssignToBrokerRepoImpl implements AssignToBrokerRepo {
  final ApiService? apiService;
  AssignToBrokerRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BrokerModel>>> getRecommendedBrokers(int requestId) async {
    try {
      var response = await apiService!.getData(
        endPoint: '${EndPoints.recommendBrokers}/$requestId',
      );
      final data = response.data['data'] as List<dynamic>? ?? [];
      final brokers = data.map((json) => BrokerModel.fromJson(json)).toList();
      return right(brokers);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> assignBrokers(int requestId, int senderId, List<int> brokerIds) async {
    try {
      final formMap = <String, dynamic>{
        'senderId': senderId.toString(),
      };
      for (var i = 0; i < brokerIds.length; i++) {
        formMap['brokerIds[$i]'] = brokerIds[i].toString();
      }
      var response = await apiService!.postData(
        endPoint: '${EndPoints.assignToBrokers}/$requestId',
        data: FormData.fromMap(formMap),
        isMultipart: true,
      );
      return right(Map<String, dynamic>.from(response.data));
    } catch (e) {
      return left(handleError(e));
    }
  }

}