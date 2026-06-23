abstract class UploadBrokerDocStates{}

class UploadBrokerDocInitState extends UploadBrokerDocStates {}

class UploadProfileImageSuccessState extends UploadBrokerDocStates {}
class UploadProfileImageErrorState extends UploadBrokerDocStates {}
class ClearProfileImageSuccessState extends UploadBrokerDocStates {}

class UploadCompanyLogoSuccessState extends UploadBrokerDocStates {}
class UploadCompanyLogoErrorState extends UploadBrokerDocStates {}
class ClearCompanyLogoSuccessState extends UploadBrokerDocStates {}

class UploadCommercialFileSuccessState extends UploadBrokerDocStates {}
class ClearCommercialFileSuccessState extends UploadBrokerDocStates {}

class UploadTaxFileSuccessState extends UploadBrokerDocStates {}
class ClearTaxFileSuccessState extends UploadBrokerDocStates {}

class UploadImageErrorState extends UploadBrokerDocStates {}

class UploadFrontCardIdPhotoSuccessState extends UploadBrokerDocStates {}
class ClearFrontCardIdPhotoSuccessState extends UploadBrokerDocStates {}

class UploadBackCardIdPhotoSuccessState extends UploadBrokerDocStates {}
class ClearBackCardIdPhotoSuccessState extends UploadBrokerDocStates {}

class GetCitiesLoadingState extends UploadBrokerDocStates {}
class GetCitiesSuccessState extends UploadBrokerDocStates {}
class GetCitiesErrorState extends UploadBrokerDocStates {
  final String error;
  GetCitiesErrorState(this.error);
}

class GetAreasLoadingState extends UploadBrokerDocStates {}
class GetAreasSuccessState extends UploadBrokerDocStates {}
class GetAreasErrorState extends UploadBrokerDocStates {
  final String error;
  GetAreasErrorState(this.error);
}

class GetSubAreasLoadingState extends UploadBrokerDocStates {}
class GetSubAreasSuccessState extends UploadBrokerDocStates {}
class GetSubAreasErrorState extends UploadBrokerDocStates {
  final String error;
  GetSubAreasErrorState(this.error);
}
