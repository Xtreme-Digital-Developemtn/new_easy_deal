import 'package:easy_deal/features/edit_profile/data/models/update_profile_data_model.dart';

import '../../data/models/get_sub_areas_model.dart';

abstract class EditProfileStates{}

class EditProfileInitState extends EditProfileStates{}

class EditPaperState extends EditProfileStates{}
class DeletePaperState extends EditProfileStates{}
class UploadPaperState extends EditProfileStates{}


class EditProfileDataLoadingState extends EditProfileStates{}
class EditProfileDataErrorState extends EditProfileStates{
  final String error;
  EditProfileDataErrorState(this.error);

}
class EditProfileDataSuccessState extends EditProfileStates{
  final UpdateProfileDataModel updateProfileDataModel;
  EditProfileDataSuccessState(this.updateProfileDataModel);

}

class EditNewPasswordVisibleState extends EditProfileStates{}
class EditConfirmNewPasswordVisibleState extends EditProfileStates{}
class ClearPasswordsConState extends EditProfileStates{}

class EditProfileImageSelectedState extends EditProfileStates {}
class EditProfileImagePickedState extends EditProfileStates {}

class GetSubAreasDataLoadingState extends EditProfileStates{}
class GetSubAreasDataErrorState extends EditProfileStates{
  final String error;
  GetSubAreasDataErrorState(this.error);

}
class GetSubAreasDataSuccessState extends EditProfileStates{
  final GetSubAreasModel getSubAreasModel;
  GetSubAreasDataSuccessState(this.getSubAreasModel);

}
