import 'package:easy_deal/features/profile/data/models/logout_model.dart';

import '../../data/models/client_profile_model.dart';
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