import 'dart:io';

import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../main_imports.dart';
import '../../data/repos/upload_broker_doc_repo.dart';

class UploadBrokerDocCubit extends Cubit<UploadBrokerDocStates> {
  UploadBrokerDocCubit(this.appSettingsRepo) : super(UploadBrokerDocInitState());

  UploadBrokerDocRepo? appSettingsRepo;
  static UploadBrokerDocCubit get(context) => BlocProvider.of(context);

  final ImagePicker picker = ImagePicker();

  File? profileImage;
  Future<void> uploadProfilePicture() async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        emit(UploadImageSuccessState());
        validateImages();
      }
    } catch (e) {
      emit(UploadImageErrorState());
    }
  }


  void clearProfileImage() {
    profileImage = null;
    emit(ClearImageSuccessState());
    validateImages();
  }



  /// Front & Back Card Images
  File? frontIdCardImage;
  File? backIdCardImage;

  /// Pick Image (Front or Back)
  Future<void> pickIdCardImages({
    required bool isFront,
    required UploadBrokerDocStates newEmit,
  }) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        if (isFront) {
          frontIdCardImage = File(pickedFile.path);
        } else {
          backIdCardImage = File(pickedFile.path);
        }
        validateImages();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
      emit(UploadImageErrorState());
    }
  }

  /// Clear Image (Front or Back)
  void clearIdCardImages({
    required bool isFront,
    required UploadBrokerDocStates newEmit,
  }) {
    if (isFront) {
      frontIdCardImage = null;
    } else {
      backIdCardImage = null;
    }
    validateImages();
    emit(newEmit);
  }

  final ValueNotifier<bool> isFormValid = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();
  void validateForm() {
    final valid = formKey.currentState?.validate() ?? false;
    isFormValid.value = valid;
  }

  final ValueNotifier<bool> isImagesValid = ValueNotifier(false);

  void validateImages() {
    bool isValid = profileImage != null &&
        frontIdCardImage != null &&
        backIdCardImage != null;

    isImagesValid.value = isValid;
  }

}
