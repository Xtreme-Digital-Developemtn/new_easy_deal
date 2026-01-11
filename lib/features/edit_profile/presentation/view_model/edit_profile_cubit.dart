import 'package:easy_deal/features/edit_profile/data/models/update_profile_data_model.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../main_imports.dart';
import '../../data/repos/edit_profile_repo.dart';
import 'edit_profile_states.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitState());

  EditProfileRepo? editProfileRepo;

  static EditProfileCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> uploadedFiles = [];

  Future<void> editFile(int index) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null) {
      uploadedFiles[index] = {
        "name": result.files.single.name,
        "path": result.files.single.path,
      };

      emit(EditPaperState());
    }
  }

  void deleteFile(int index) {
    uploadedFiles.removeAt(index);
    emit(DeletePaperState());
  }

  Future<void> pickNewFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null) {
      uploadedFiles.add({
        "name": result.files.single.name,
        "path": result.files.single.path,
      });
      emit(UploadPaperState());
    }
  }



  UpdateProfileDataModel? updateProfileDataModel;
  Future<void> updateProfileData({
    String? phone,
    String? gender,
  }) async {
    emit(EditProfileDataLoadingState());
    var result = await editProfileRepo!.updateProfileData(
      fullName: nameCon.text,
      phone: phone,
      email: emailCon.text,
      passwordConfirmation: newPasswordCon.text,
      password: confirmNewPasswordCon.text,
      gender: gender,

    );
    return result.fold(
      (failure) {
        emit(EditProfileDataErrorState(failure.errMessage));
      },
      (data) async {
        updateProfileDataModel = data;
        emit(EditProfileDataSuccessState(data));
      },
    );
  }


  final ValueNotifier<bool> isFormValid = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();
  var emailCon = TextEditingController();
  var nameCon = TextEditingController();
  bool hasUserInteracted = false;
  void onUserInteraction() {
    hasUserInteracted = true;
    validateForm();
  }
  void validateForm() {
    if (!hasUserInteracted) return;

    final isValid = formKey.currentState?.validate() ?? false;
    isFormValid.value = isValid;
  }



  var newPasswordCon = TextEditingController();
  var confirmNewPasswordCon = TextEditingController();
  bool isNewPasswordVisible = true;
  bool isConfirmNewPasswordVisible = true;


  editNewPasswordVisible()
  {
    isNewPasswordVisible = !isNewPasswordVisible;
    emit(EditNewPasswordVisibleState());
  }


  changeConfirmNewPasswordVisible()
  {
    isConfirmNewPasswordVisible = !isConfirmNewPasswordVisible;
    emit(EditConfirmNewPasswordVisibleState());
  }
}
