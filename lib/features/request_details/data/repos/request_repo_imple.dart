import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/request_details/data/repos/request_repo.dart';
import '../../../../main_imports.dart';
import '../models/recommended_model.dart';
import '../models/replies_model.dart';
import '../models/request_details_model.dart';
import '../models/sent_responses_model.dart';
import '../models/update_status_model.dart';

class RequestDetailsRepoImpl implements RequestDetailsRepo {
  final ApiService? apiService;

  RequestDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RequestDetailsModel>> requestDetails({
    required int requestId,
  }) async {
    try {
      var response = await apiService!.getData(
        endPoint: "${EndPoints.requests}/$requestId",
      );
      RequestDetailsModel result = RequestDetailsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, UpdateStatusModel>> updateRequestStatus({
    required int requestId,
    required String status,
    required String userId,
    required String unitId,
  }) async {
    try {
      var response = await apiService!.postData(
        endPoint: '${EndPoints.updateRequestStatus}/$requestId',
        data: {'status': status, 'unitId': unitId, 'userId': userId},
      );
      UpdateStatusModel result = UpdateStatusModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, SentResponsesModel>> getSentResponses({
    required int requestId,
    int? senderId,
    int? brokerId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  }) async {
    try {
      final Map<String, dynamic> query = {
        'limit': limit,
        'offset': offset,
        'sort': sort,
        'sortBy': sortBy,
        'requestId': requestId,
      };
      if (senderId != null && senderId != 0) query['senderId'] = senderId;
      if (brokerId != null && brokerId != 0) query['brokerId'] = brokerId;

      var response = await apiService!.getData(
        endPoint: EndPoints.sentResponses,
        query: query,
      );
      SentResponsesModel result = SentResponsesModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, RepliesModel>> getReplies({
    required int requestId,
    int? brokerId,
    int? senderId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  }) async {
    try {
      final Map<String, dynamic> query = {
        'limit': limit,
        'offset': offset,
        'sort': sort,
        'sortBy': sortBy,
        'requestId': requestId,
      };
      if (brokerId != null && brokerId != 0) query['brokerId'] = brokerId;
      if (senderId != null && senderId != 0) query['senderId'] = senderId;

      var response = await apiService!.getData(
        endPoint: EndPoints.requestReplies,
        query: query,
      );
      RepliesModel result = RepliesModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, RecommendedModel>> getRecommendedUnits({
    required int requestId,
    required int brokerId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  }) async {
    try {
      final query = {
        'limit': limit,
        'offset': offset,
        'sort': sort,
        'sortBy': sortBy,
      };
      var response = await apiService!.getData(
        endPoint: '${EndPoints.recommendUnits}/$requestId/$brokerId',
        query: query,
      );
      RecommendedModel result = RecommendedModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
