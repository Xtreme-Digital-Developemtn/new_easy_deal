


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/client_profile_model.dart';
import '../models/logout_model.dart';
import '../models/social_media_model.dart';

abstract class ProfileRepo{

   Future<Either<Failure,LogoutModel>> logout();
   Future<Either<Failure,SocialMediaModel>> getSocialMedia();
   Future<Either<Failure,ClientProfileModel>> getClientProfile({required int clientId});




}