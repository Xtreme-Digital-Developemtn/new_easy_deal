import 'package:easy_deal/features/edit_profile/data/models/update_profile_data_model.dart';

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