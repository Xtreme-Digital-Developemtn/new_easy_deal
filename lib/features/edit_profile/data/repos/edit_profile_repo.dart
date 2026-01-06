import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/update_profile_data_model.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, UpdateProfileDataModel>> updateProfileData({
     String? fullName,
     String? phone,
     String? email,
     String? password,
     String? passwordConfirmation,
     String? gender,
  });
}
