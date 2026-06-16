import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/profile/data/repos/profile_repo.dart';
import '../../../../main_imports.dart';
import '../models/apply_promo_code_model.dart';
import '../models/client_profile_model.dart';
import '../models/logout_model.dart';
import '../models/promo_codes_last_applied_model.dart';
import '../models/social_media_model.dart';


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
  Future<Either<Failure, SocialMediaModel>> getSocialMedia() async{
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.socialMedia,
      );
      SocialMediaModel result = SocialMediaModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, ClientProfileModel>> getClientProfile({required int clientId})
  async{
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

  @override
  Future<Either<Failure, PromoCodesLastAppliedModel>> getPromoCodesLastApplied({required int brokerId})
  async{
    try {
      var response = await apiService!.getData(
        endPoint: EndPoints.promoCodesLastApplied,
        query: {
          "user_id" : brokerId,
        }
      );
      PromoCodesLastAppliedModel result = PromoCodesLastAppliedModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, ApplyPromoCodeModel>> applyPromoCode({required String promoCode})
  async{
    try {
      var response = await apiService!.postData(
          endPoint: EndPoints.promoCodesApply,
          query: {
            "promo_code" : promoCode,
          }
      );
      ApplyPromoCodeModel result = ApplyPromoCodeModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }




}