import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/requests/data/repos/requests_repo.dart';
import '../../../../main_imports.dart';
import '../models/all_request_model.dart';


class RequestsRepoImpl implements RequestsRepo {
  final ApiService? apiService;
  RequestsRepoImpl(this.apiService);




@override
Future<Either<Failure, AllRequestModel>> getAllRequest() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.requests,
      query: {
        "limit" : "100",
        "offset" : "0",
      }
    );
    AllRequestModel result = AllRequestModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}