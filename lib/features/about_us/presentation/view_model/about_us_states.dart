import 'package:easy_deal/features/about_us/data/models/about_us_model.dart';

abstract class AboutUsStates{}

class AboutUsInitState extends AboutUsStates{}

class GetAboutUsLoadingState extends AboutUsStates{}
class GetAboutUsErrorState extends AboutUsStates{
  final String error;
  GetAboutUsErrorState(this.error);
}
class GetAboutUsSuccessState extends AboutUsStates{
  final AboutUsModel aboutUsModel;
  GetAboutUsSuccessState(this.aboutUsModel);

}