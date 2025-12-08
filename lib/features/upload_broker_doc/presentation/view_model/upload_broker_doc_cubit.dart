import 'dart:io';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_deal/main_imports.dart';
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
        emit(UploadProfileImageSuccessState());
        validateIndividualDocuments();
      }
    } catch (e) {
      emit(UploadProfileImageErrorState());
    }
  }

  void clearProfileImage() {
    profileImage = null;
    emit(ClearProfileImageSuccessState());
    validateIndividualDocuments();
  }


  File? companyLogo;
  Future<void> uploadCompanyLogo() async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        companyLogo = File(pickedFile.path);
        emit(UploadCompanyLogoSuccessState());
        validateCompanyDocuments();
      }
    } catch (e) {
      emit(UploadCompanyLogoErrorState());
    }
  }

  void clearCompanyLogo() {
    companyLogo = null;
    emit(ClearCompanyLogoSuccessState());
    validateCompanyDocuments();
  }


  File? frontIdCardImage;
  File? backIdCardImage;

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
        validateIndividualDocuments();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
      emit(UploadImageErrorState());
    }
  }

  void clearIdCardImages({
    required bool isFront,
    required UploadBrokerDocStates newEmit,
  }) {
    if (isFront) {
      frontIdCardImage = null;
    } else {
      backIdCardImage = null;
    }
    validateIndividualDocuments();
    emit(newEmit);
  }


  File? commercialFile;
  File? taxFile;

  Future<void> pickCommercialFile({
    required UploadBrokerDocStates newEmit,
  })
  async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        commercialFile = File(pickedFile.path);
        validateCompanyDocuments();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking commercial file: $e");
      emit(UploadImageErrorState());
    }
  }

  void clearCommercialFile({
    required UploadBrokerDocStates newEmit,
  }) {
    commercialFile = null;
    validateCompanyDocuments();
    emit(newEmit);
  }

  Future<void> pickTaxFile({
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
        taxFile = File(pickedFile.path);
        validateCompanyDocuments();
        emit(newEmit);
      }
    } catch (e) {
      debugPrint("Error picking tax file: $e");
      emit(UploadImageErrorState());
    }
  }

  void clearTaxFile({
    required UploadBrokerDocStates newEmit,
  }) {
    taxFile = null;
    validateCompanyDocuments();
    emit(newEmit);
  }


  final ValueNotifier<bool> isIndividualDocumentsValid = ValueNotifier(false);
  final ValueNotifier<bool> isCompanyDocumentsValid = ValueNotifier(false);

  void validateIndividualDocuments() {
    bool isValid = profileImage != null &&
        frontIdCardImage != null &&
        backIdCardImage != null;

    isIndividualDocumentsValid.value = isValid;
  }

  void validateCompanyDocuments() {
    bool isValid = companyLogo != null &&
        commercialFile != null &&
        taxFile != null;

    isCompanyDocumentsValid.value = isValid;
  }


  void submitIndividualDocuments() {
    // منطق إرسال بيانات الفرد
    debugPrint('Submitting individual documents...');
  }

  void submitCompanyDocuments() {
    // منطق إرسال بيانات الشركة
    debugPrint('Submitting company documents...');
  }
}