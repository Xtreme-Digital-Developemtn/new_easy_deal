import 'package:easy_deal/features/request_details/data/repos/request_repo.dart';
import '../../../../main_imports.dart';


class RequestDetailsRepoImpl implements RequestDetailsRepo {
  final ApiService? apiService;

  RequestDetailsRepoImpl(this.apiService);


  // @override
  // Future<Either<Failure, LoginModel>> login({required var data}) async{
  //   try {
  //     var response = await apiService!.postData(
  //       endPoint: EndPoints.login,
  //       data: data,
  //     );
  //     LoginModel result = LoginModel.fromJson(response.data);
  //     return right(result);
  //   } catch (e) {
  //     return left(handleError(e));
  //   }
  // }


}
