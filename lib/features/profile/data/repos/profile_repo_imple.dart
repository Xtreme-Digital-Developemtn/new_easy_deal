import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/profile/data/repos/profile_repo.dart';
import '../../../../main_imports.dart';
import '../models/client_profile_model.dart';
import '../models/logout_model.dart';


class ProfileRepoImpl implements ProfileRepo {
  final ApiService? apiService;
  ProfileRepoImpl(this.apiService);




@override
Future<Either<Failure, LogoutModel>> logout() async{
  try {
    var response = await apiService!.postData(
      endPoint: EndPoints.logout,
    );
    LogoutModel result = LogoutModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}

  @override
  Future<Either<Failure, ClientProfileModel>> getClientProfile({required int clientId}) async{
    try {
      var response = await apiService!.getData(
        endPoint: "${EndPoints.users}/$clientId",
      );
      ClientProfileModel result = ClientProfileModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }






}