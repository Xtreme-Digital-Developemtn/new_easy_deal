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
