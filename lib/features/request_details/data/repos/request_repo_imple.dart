import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/request_details/data/repos/request_repo.dart';
import '../../../../main_imports.dart';
import '../models/request_details_model.dart';
import '../models/sent_responses_model.dart';


class RequestDetailsRepoImpl implements RequestDetailsRepo {
  final ApiService? apiService;

  RequestDetailsRepoImpl(this.apiService);


  @override
  Future<Either<Failure, RequestDetailsModel>> requestDetails({required int requestId}) async{
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
  Future<Either<Failure, SentResponsesModel>> getSentResponses({
    required int requestId,
    required int senderId,
    required int brokerId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  }) async {
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.sentResponses,
        query: {
          'limit': limit,
          'offset': offset,
          'sort': sort,
          'sortBy': sortBy,
          'requestId': requestId,
          'brokerId': brokerId,
          'senderId': senderId,
        },
      );
      SentResponsesModel result = SentResponsesModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

}
