import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/update_profile_data_model.dart';
import 'edit_profile_repo.dart';


class EditProfileRepoImpl implements EditProfileRepo {
  final ApiService? apiService;
  EditProfileRepoImpl(this.apiService);

@override
Future<Either<Failure, UpdateProfileDataModel>> updateProfileData(
    {
      String? fullName,
      String? phone,
      String? email,
      String? password,
      String? passwordConfirmation,
      String? gender,
    }
    ) async{
  try {

    Map<String, dynamic> data = {
      "fullName": fullName,
      "phone": phone,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "gender": gender,
    };
    data.removeWhere((key, value) => value == null || (value is String && value.trim().isEmpty));
    var response = await apiService!.putData(
      endPoint: "${EndPoints.users}/${CacheHelper.getData(key: "userId")}",
      data: data,
    );
    UpdateProfileDataModel result = UpdateProfileDataModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}