import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../main_imports.dart';
import '../models/update_profile_data_model.dart';
import 'edit_profile_repo.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final ApiService? apiService;
  EditProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UpdateProfileDataModel>> updateProfileData({
    String? fullName,
    String? phone,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? role,
    String? image,
    String? idFront,
    String? idBack,
    String? taxCardImage,
    String? commercialRegistryImage,
    int? id,
  })
  async {
    try {

      final data = <String, dynamic>{
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "role": role,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };

      final response = await apiService!.putData(
        endPoint: "${EndPoints.users}/$id",
        data: data,
      );
      final UpdateProfileDataModel result =
          UpdateProfileDataModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileDataModel>> updateUserImage({
    required String endpoint,
    required String key,
    required File file,
  }) async {
    try {
      final formData = FormData();
      formData.files.add(MapEntry(
        key,
        await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      ));
      final response = await apiService!.postData(
        endPoint:
            "${EndPoints.users}/$endpoint/${CacheHelper.getData(key: "userId")}",
        data: formData,
        isMultipart: true,
      );
      final UpdateProfileDataModel result =
          UpdateProfileDataModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
