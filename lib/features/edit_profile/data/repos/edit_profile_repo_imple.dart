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

    /// Images
    dynamic commercialRegistryImage,
    dynamic taxCardImage,
    dynamic idBack,
    dynamic idFront,
    dynamic image,
  }) async {
    try {
      final images = <String, dynamic>{
        'commercialRegistryImage': commercialRegistryImage,
        'taxCardImage': taxCardImage,
        'idBack': idBack,
        'idFront': idFront,
        'image': image,
      };

      final hasFile = images.values.any((v) => v is File);

      if (hasFile) {
        final formData = FormData();
        formData.fields.add(const MapEntry('_method', 'PUT'));

        final textData = <String, dynamic>{
          'fullName': fullName,
          'phone': phone,
          'email': email,
          'role': role,
          'password': password,
          'password_confirmation': passwordConfirmation,
        };
        textData.removeWhere(
              (key, value) =>
          value == null || (value is String && value.trim().isEmpty),
        );
        textData.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });

        for (final entry in images.entries) {
          if (entry.value is File) {
            formData.files.add(MapEntry(
              entry.key,
              await MultipartFile.fromFile(
                (entry.value as File).path,
                filename: (entry.value as File).path.split('/').last,
              ),
            ));
          } else if (entry.value != null &&
              entry.value is String &&
              (entry.value as String).trim().isNotEmpty) {
            formData.fields.add(MapEntry(entry.key, entry.value as String));
          }
        }

        final response = await apiService!.postData(
          endPoint: "${EndPoints.users}/${CacheHelper.getData(key: "userId")}",
          data: formData,
          isMultipart: true,
        );
        final UpdateProfileDataModel result =
            UpdateProfileDataModel.fromJson(response.data);
        return right(result);
      }

      final data = <String, dynamic>{
        "_method": "PUT",
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "role": role,
        "password": password,
        "password_confirmation": passwordConfirmation,

        /// Images
        "commercialRegistryImage": commercialRegistryImage,
        "taxCardImage": taxCardImage,
        "idBack": idBack,
        "idFront": idFront,
        "image": image,
      };

      data.removeWhere(
            (key, value) =>
        value == null || (value is String && value.trim().isEmpty),
      );

      final response = await apiService!.putData(
        endPoint: "${EndPoints.users}/${CacheHelper.getData(key: "userId")}",
        data: data,
      );
      final UpdateProfileDataModel result =
          UpdateProfileDataModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
