import 'package:easy_deal/features/profile/data/models/logout_model.dart';

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