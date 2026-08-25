import 'dart:io';

import 'package:easy_deal/features/edit_profile/data/models/get_sub_areas_model.dart';
import 'package:easy_deal/features/edit_profile/data/models/update_profile_data_model.dart';
import 'package:easy_deal/features/profile/data/models/client_profile_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

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



  String? role;
  UpdateProfileDataModel? updateProfileDataModel;
  File? commercialRegistryImage;
  File? taxCardImage;
  File? idBack;
  File? idFront;
  File? image;
  File? selectedProfileImage;
  File? selectedIdFront;
  File? selectedIdBack;
  File? selectedCommercialRegistryImage;
  File? selectedTaxCardImage;
  ClientProfileModel? profileModel;
  Future<void> updateProfileData({required int? id  ,
    required String? fullName,
    required String? phone,
    required String? email,
    List<int>? areaIds,
  }) async {
    emit(EditProfileDataLoadingState());
    final result = await editProfileRepo!.updateProfileData(
      id: id,
      fullName: fullName,
      phone: phone,
      email: email,
      role: role ?? profileModel?.data?.role,
      areaIds: areaIds ??
          profileModel?.data?.areas
              ?.where((a) => a.id != null)
              .map((a) => a.id!)
              .toList() ??
          [],
      password: newPasswordCon.text.trim().isNotEmpty
          ? newPasswordCon.text.trim()
          : null,

      passwordConfirmation: confirmNewPasswordCon.text.trim().isNotEmpty
          ? confirmNewPasswordCon.text.trim()
          : null,
    );

    result.fold(
          (failure) {
        emit(EditProfileDataErrorState(failure.errMessage));
      },
          (data) {
        updateProfileDataModel = data;
        emit(EditProfileDataSuccessState(data));
      },
    );
  }

  Future<void> updateSpecializationsAreas({
    required int id,
    required Map<String, List<String>> specializationScopes,
    List<int>? areaIds,
    List<int>? subAreas,
  }) async {
    emit(EditProfileDataLoadingState());
    final result = await editProfileRepo!.updateSpecializationsAreas(
      id: id,
      specializationScopes: specializationScopes,
      areaIds: areaIds,
      subAreas: subAreas,
    );

    result.fold(
          (failure) {
        emit(EditProfileDataErrorState(failure.errMessage));
      },
          (data) {
        updateProfileDataModel = data;
        emit(EditProfileDataSuccessState(data));
      },
    );
  }

  String _imageEndpointFor(String key) {
    switch (key) {
      case 'image':
        return 'update-image';
      case 'idFront':
        return 'update-id-front';
      case 'idBack':
        return 'update-id-back';
      case 'taxCardImage':
        return 'update-tax-card-image';
      case 'commercialRegistryImage':
        return 'update-commercial-registry-image';
      default:
        return 'update-image';
    }
  }

  Future<void> updateUserImages(Map<String, File> files)
  async {
    emit(EditProfileDataLoadingState());
    String? firstError;
    for (final entry in files.entries) {
      final result = await editProfileRepo!.updateUserImage(
        endpoint: _imageEndpointFor(entry.key),
        key: entry.key,
        file: entry.value,
      );
      final failure = result.fold((f) => f, (d) => null);
      if (failure != null) {
        firstError = failure.errMessage;
        break;
      }
    }
    if (firstError != null) {
      emit(EditProfileDataErrorState(firstError));
    } else {
      emit(EditProfileDataSuccessState(UpdateProfileDataModel()));
    }
  }

  Future<File?> pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result == null || result.files.single.path == null) {
      return null;
    }

    return File(result.files.single.path!);
  }

  Future<void> pickProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedProfileImage = File(pickedFile.path);
      emit(EditProfileImagePickedState());
    }
  }

  Future<void> pickIdFront() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedIdFront = File(pickedFile.path);
      emit(EditProfileImagePickedState());
    }
  }

  Future<void> pickIdBack() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedIdBack = File(pickedFile.path);
      emit(EditProfileImagePickedState());
    }
  }

  Future<void> pickCommercialRegistryImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedCommercialRegistryImage = File(pickedFile.path);
      emit(EditProfileImagePickedState());
    }
  }

  Future<void> pickTaxCardImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedTaxCardImage = File(pickedFile.path);
      emit(EditProfileImagePickedState());
    }
  }

  final ValueNotifier<bool> isFormValid = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();
  var emailCon = TextEditingController();
  var nameCon = TextEditingController();
  var mobileNumberCon = TextEditingController();
  String phoneNumber = '';
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



  void clearPasswordsCon()
  {
    confirmNewPasswordCon.clear();
    newPasswordCon.clear();
    emit(ClearPasswordsConState());
  }




  GetSubAreasModel? getSubAreasModel;

  Future<void> getSubAreas({  required String cityId,}) async {
    emit(GetSubAreasDataLoadingState());
    var result = await editProfileRepo!.getSubAreas(cityId: cityId);
    return result.fold(
          (failure) {
        emit(GetSubAreasDataErrorState(failure.errMessage));
      },
          (data) async {
            getSubAreasModel = data;
        emit(GetSubAreasDataSuccessState(data));
      },
    );
  }

}
