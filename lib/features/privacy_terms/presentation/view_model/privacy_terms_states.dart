import 'package:easy_deal/features/privacy_terms/data/models/terms_model.dart';

abstract class PrivacyTermsStates{}

class PrivacyTermsInitState extends PrivacyTermsStates{}

class GetPrivacyTermsLoadingState extends PrivacyTermsStates{}
class GetPrivacyTermsErrorState extends PrivacyTermsStates{
  final String error;
  GetPrivacyTermsErrorState(this.error);

}
class GetPrivacyTermsSuccessState extends PrivacyTermsStates{
  final TermsModel termsModel;
  GetPrivacyTermsSuccessState(this.termsModel);

}



