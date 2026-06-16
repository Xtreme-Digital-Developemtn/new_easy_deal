import 'package:easy_deal/features/profile/data/models/apply_promo_code_model.dart';
import 'package:easy_deal/features/profile/data/models/logout_model.dart';

import '../../data/models/client_profile_model.dart';
import '../../data/models/promo_codes_last_applied_model.dart';
import '../../data/models/social_media_model.dart';

abstract class ProfileStates{}

class ProfileInitState extends ProfileStates{}

class  LogoutLoadingState extends ProfileStates{}
class  LogoutErrorState extends ProfileStates{
  final String error;
  LogoutErrorState(this.error);

}
class  LogoutSuccessState extends ProfileStates{
  final LogoutModel logoutModel;
  LogoutSuccessState(this.logoutModel);

}


class  GetClientProfileLoadingState extends ProfileStates{}
class  GetClientProfileErrorState extends ProfileStates{
  final String error;
  GetClientProfileErrorState(this.error);

}
class  GetClientProfileSuccessState extends ProfileStates{
  final ClientProfileModel clientProfileModel;
  GetClientProfileSuccessState(this.clientProfileModel);
}



class  GetSocialMediaLoadingState extends ProfileStates{}
class  GetSocialMediaErrorState extends ProfileStates{
  final String error;
  GetSocialMediaErrorState(this.error);

}
class  GetSocialMediaSuccessState extends ProfileStates{
  final SocialMediaModel socialMediaModel;
  GetSocialMediaSuccessState(this.socialMediaModel);
}


class  GetPromoCodesLastAppliedLoadingState extends ProfileStates{}
class  GetPromoCodesLastAppliedErrorState extends ProfileStates{
  final String error;
  GetPromoCodesLastAppliedErrorState(this.error);

}
class  GetPromoCodesLastAppliedSuccessState extends ProfileStates{
  final PromoCodesLastAppliedModel promoCodesLastAppliedModel;
  GetPromoCodesLastAppliedSuccessState(this.promoCodesLastAppliedModel);
}

class  ApplyPromoCodeLoadingState extends ProfileStates{}
class  ApplyPromoCodeErrorState extends ProfileStates{
  final String error;
  ApplyPromoCodeErrorState(this.error);

}
class  ApplyPromoCodeSuccessState extends ProfileStates{
  final ApplyPromoCodeModel applyPromoCodeModel;
  ApplyPromoCodeSuccessState(this.applyPromoCodeModel);
}