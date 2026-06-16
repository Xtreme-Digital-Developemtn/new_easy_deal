


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/apply_promo_code_model.dart';
import '../models/client_profile_model.dart';
import '../models/logout_model.dart';
import '../models/promo_codes_last_applied_model.dart';
import '../models/social_media_model.dart';

abstract class ProfileRepo{

   Future<Either<Failure,LogoutModel>> logout();
   Future<Either<Failure,SocialMediaModel>> getSocialMedia();
   Future<Either<Failure,ClientProfileModel>> getClientProfile({required int clientId});
   Future<Either<Failure,PromoCodesLastAppliedModel>> getPromoCodesLastApplied({required int brokerId});
   Future<Either<Failure,ApplyPromoCodeModel>> applyPromoCode({required String promoCode , required int brokerId});




}