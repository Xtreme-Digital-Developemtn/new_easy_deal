import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/get_sub_areas_model.dart';
import '../models/update_profile_data_model.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, UpdateProfileDataModel>> updateProfileData({
    String? fullName,
    String? phone,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? role,
    int? id,
    List<int>? areaIds,
  });

  Future<Either<Failure, UpdateProfileDataModel>> updateUserImage({
    required String endpoint,
    required String key,
    required File file,
  });
  Future<Either<Failure, GetSubAreasModel>> getSubAreas({
    required String cityId,
  });

}
