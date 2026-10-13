import 'dart:io';
import 'package:easy_deal/features/create_request/data/stepper_config/stepper_constants.dart';
import 'package:easy_deal/features/search/data/models/areas_model.dart';
import 'package:easy_deal/features/search/data/models/cities_model.dart';
import 'package:easy_deal/features/create_request/data/models/sub_areas_model.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_deal/main_imports.dart';
import '../../data/repos/upload_broker_doc_repo.dart';

class UploadBrokerDocCubit extends Cubit<UploadBrokerDocStates> {
  UploadBrokerDocCubit(this.appSettingsRepo) : super(UploadBrokerDocInitState());

  UploadBrokerDocRepo? appSettingsRepo;
  static UploadBrokerDocCubit get(context) => BlocProvider.of(context);

  final ImagePicker picker = ImagePicker();

  static const int maxFileSizeBytes = 10 * 1024 * 1024;
  static const List<String> allowedExtensions = ['jpg', 'jpeg', 'png'];

  String? lastFileError;

  /// Shared validation: extension + size. Returns File if valid, else emits error.
  Future<File?> _pickAndValidate(ImageSource source) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1600,
        maxHeight: 1600,
        imageQuality: 85,
      );
      if (pickedFile == null) return null;

      final ext = pickedFile.path.split('.').last.toLowerCase();
      if (!allowedExtensions.contains(ext)) {
        lastFileError = 'الصيغة غير مدعومة ($ext) — المسموح: jpg, png فقط';
        emit(UploadFileValidationErrorState(lastFileError!));
        return null;
      }

      final file = File(pickedFile.path);
      final size = await file.length();
      if (size > maxFileSizeBytes) {
        lastFileError =
            'حجم الصورة أكبر من 10 ميجا (${(size / 1024 / 1024).toStringAsFixed(1)} MB)';
        emit(UploadFileValidationErrorState(lastFileError!));
        return null;
      }

      lastFileError = null;
      return file;
    } catch (e) {
      lastFileError = 'تعذر اختيار الصورة';
      emit(UploadFileValidationErrorState(lastFileError!));
      return null;
    }
  }

  File? profileImage;
  Future<void> uploadProfilePicture({ImageSource source = ImageSource.gallery}) async {
    try {
      final file = await _pickAndValidate(source);
      if (file != null) {
        profileImage = file;
        validateIndividualDocuments();
        emit(UploadProfileImageSuccessState());
      }
    } catch (e) {
      emit(UploadProfileImageErrorState());
    }
  }

  void clearProfileImage() {
    profileImage = null;
    validateIndividualDocuments();
    emit(ClearProfileImageSuccessState());
  }


  File? companyLogo;
  Future<void> uploadCompanyLogo({ImageSource source = ImageSource.gallery}) async {
    try {
      final file = await _pickAndValidate(source);
      if (file != null) {
        companyLogo = file;
        validateCompanyDocuments();
        emit(UploadCompanyLogoSuccessState());
      }
    } catch (e) {
      emit(UploadCompanyLogoErrorState());
    }
  }

  void clearCompanyLogo() {
    companyLogo = null;
    validateCompanyDocuments();
    emit(ClearCompanyLogoSuccessState());
  }


  File? frontIdCardImage;
  File? backIdCardImage;

  Future<void> pickIdCardImages({
    required bool isFront,
    required UploadBrokerDocStates newEmit,
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      final file = await _pickAndValidate(source);
      if (file != null) {
        if (isFront) {
          frontIdCardImage = file;
        } else {
          backIdCardImage = file;
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
    ImageSource source = ImageSource.gallery,
  })
  async {
    try {
      final file = await _pickAndValidate(source);
      if (file != null) {
        commercialFile = file;
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
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      final file = await _pickAndValidate(source);
      if (file != null) {
        taxFile = file;
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


  bool isIndividualDocumentsValid = false;
  bool isCompanyDocumentsValid = false;

  void validateIndividualDocuments() {
    isIndividualDocumentsValid = profileImage != null &&
        frontIdCardImage != null &&
        backIdCardImage != null;
  }

  void validateCompanyDocuments() {
    isCompanyDocumentsValid = companyLogo != null &&
        commercialFile != null &&
        taxFile != null;
  }


  void submitIndividualDocuments() {
    debugPrint('Submitting individual documents...');
  }

  void submitCompanyDocuments() {
    debugPrint('Submitting company documents...');
  }

  List<Cities> citiesList = [];
  List<Areas> areasList = [];
  List<SubArea> subAreasList = [];

  Cities? selectedCity;
  Areas? selectedArea;
  SubArea? selectedSubArea;

  List<String> specializationScopesList = specializationScopeOptions
      .map((e) => e.value)
      .toList();
  List<String> selectedSpecializationScopes = [];

  String? get selectedCityName {
    if (selectedCity == null) return null;
    return selectedCity!.nameAr ?? selectedCity!.nameEn ?? '';
  }

  String? get selectedAreaName {
    if (selectedArea == null) return null;
    return selectedArea!.nameAr ?? selectedArea!.nameEn ?? '';
  }

  String? get selectedSubAreaName {
    if (selectedSubArea == null) return null;
    return selectedSubArea!.nameAr ?? selectedSubArea!.nameEn ?? '';
  }

  Future<void> getAllCities() async {
    emit(GetCitiesLoadingState());
    final result = await appSettingsRepo!.getAllCities();
    result.fold(
      (failure) => emit(GetCitiesErrorState(failure.errMessage)),
      (model) {
        citiesList = model.data ?? [];
        emit(GetCitiesSuccessState());
      },
    );
  }

  Future<void> getAllAreas({required int cityId}) async {
    emit(GetAreasLoadingState());
    selectedArea = null;
    selectedSubArea = null;
    subAreasList = [];
    emit(GetAreasSuccessState());
    final result = await appSettingsRepo!.getAllAreas(cityId: cityId);
    result.fold(
      (failure) => emit(GetAreasErrorState(failure.errMessage)),
      (model) {
        areasList = model.data ?? [];
        emit(GetAreasSuccessState());
      },
    );
  }

  Future<void> getAllSubAreas({required int areaId}) async {
    emit(GetSubAreasLoadingState());
    selectedSubArea = null;
    emit(GetSubAreasSuccessState());
    final result = await appSettingsRepo!.getAllSubAreas(areaId: areaId);
    result.fold(
      (failure) => emit(GetSubAreasErrorState(failure.errMessage)),
      (model) {
        subAreasList = model.data ?? [];
        emit(GetSubAreasSuccessState());
      },
    );
  }

  void selectCity(Cities? city) {
    selectedCity = city;
    selectedArea = null;
    selectedSubArea = null;
    areasList = [];
    subAreasList = [];
  }

  void selectArea(Areas? area) {
    selectedArea = area;
    selectedSubArea = null;
    subAreasList = [];
  }

  void selectSubArea(SubArea? subArea) {
    selectedSubArea = subArea;
  }

  void toggleSpecializationScope(String scope) {
    if (selectedSpecializationScopes.contains(scope)) {
      selectedSpecializationScopes.remove(scope);
    } else {
      selectedSpecializationScopes.add(scope);
    }
    emit(UploadBrokerDocInitState());
  }
}
