import 'dart:io';
import 'package:easy_deal/core/extensions/log_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../main_imports.dart';
import '../../data/models/category_model.dart';
import '../../data/models/sub_areas_model.dart';
import '../../data/repos/create_request_repo.dart';
import '../../data/stepper_config/stepper_config_factory.dart';
import '../../data/stepper_config/input_config_model.dart';
import '../../../search/data/models/cities_model.dart';
import '../../../search/data/models/areas_model.dart';
import 'create_request_states.dart';

class CreateRequestCubit extends Cubit<CreateRequestStates> {
  CreateRequestCubit(this.createRequestRepo) : super(CreateRequestInitState());

  CreateRequestRepo? createRequestRepo;
  final StepperConfigFactory configFactory = StepperConfigFactory();

  // ========================================================================
  // Dynamic form values (replaces individual field selection)
  // ========================================================================
  Map<String, dynamic> formValues = {};
  Map<String, dynamic> formErrors = {};
  bool validationAttempted = false;

  void setFormValue(String name, dynamic value) {
    formValues[name] = value;
    formErrors.remove(name);
    emit(FormValueChangedState());
  }

  dynamic getFormValue(String name) => formValues[name];
  String? getFormValueString(String name) => formValues[name]?.toString();
  List<String> getFormValueList(String name) {
    final v = formValues[name];
    if (v is List) return v.cast<String>();
    if (v is String && v.isNotEmpty) return [v];
    return [];
  }

  String? getFieldError(InputConfig config) {
    if (!config.required) return null;
    return formErrors[config.name] as String?;
  }

  bool _isFieldEmpty(String name) {
    final v = formValues[name];
    if (v == null) return true;
    if (v is String && v.trim().isEmpty) return true;
    if (v is List && v.isEmpty) return true;
    return false;
  }

  bool _isValidUrl(String value) {
    return Uri.tryParse(value)?.hasScheme == true && value.contains('.');
  }

  bool validateCurrentStep() {
    validationAttempted = true;
    final inputs = currentStepInputs;
    final errors = <String, String>{};

    if (currentStepNumber == 2) {
      if (selectedCityObj == null) errors['cityId'] = LangKeys.fieldRequired.tr();
      if (selectedAreaObj == null) errors['areaId'] = LangKeys.fieldRequired.tr();
    }

    if (currentStepNumber == 4 || currentStepNumber == 5) {
      if (_isFieldEmpty('averageUnitPriceMin')) errors['averageUnitPriceMin'] = LangKeys.fieldRequired.tr();
      if (_isFieldEmpty('averageUnitPriceMax')) errors['averageUnitPriceMax'] = LangKeys.fieldRequired.tr();
    }

    for (final input in inputs) {
      if (!input.required || !input.isVisible()) continue;

      if (input.type == InputFieldType.url) {
        final val = getFormValueString(input.name);
        if (val != null && val.isNotEmpty && !_isValidUrl(val)) {
          errors[input.name] = LangKeys.validUrlRequired.tr();
        } else if (val == null || val.trim().isEmpty) {
          errors[input.name] = LangKeys.fieldRequired.tr();
        }
      } else if (input.type == InputFieldType.text || input.type == InputFieldType.number || input.type == InputFieldType.textarea) {
        if (_isFieldEmpty(input.name) || (getFormValueString(input.name)?.trim().isEmpty == true)) {
          errors[input.name] = LangKeys.fieldRequired.tr();
        }
      } else if (input.type == InputFieldType.select) {
        if (_isFieldEmpty(input.name)) {
          errors[input.name] = LangKeys.fieldRequired.tr();
        }
      } else if (input.type == InputFieldType.date) {
        if (_isFieldEmpty(input.name)) {
          errors[input.name] = LangKeys.fieldRequired.tr();
        }
      }
    }

    formErrors = errors;
    emit(FormValidationState());
    return errors.isEmpty;
  }

  // ========================================================================
  // Controllers (for text fields)
  // ========================================================================
  final Map<String, TextEditingController> controllers = {};

  TextEditingController getOrCreateController(String name) {
    if (!controllers.containsKey(name)) {
      controllers[name] = TextEditingController();
    }
    return controllers[name]!;
  }

  void syncControllerToFormValue(String name) {
    final c = controllers[name];
    if (c != null && c.text.isNotEmpty) {
      formValues[name] = c.text;
    }
  }

  // ========================================================================
  // File fields
  // ========================================================================
  final ImagePicker picker = ImagePicker();
  File? mainImage;
  File? unitInMasterPlanImage;
  List<File> galleryImages = [];
  File? video;

  Future<void> pickUnitInMasterPlanImage({required CreateRequestStates newEmit}) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        unitInMasterPlanImage = File(pickedFile.path);
        emit(newEmit);
      }
    } catch (e) {
      emit(UploadImageErrorState());
    }
  }

  void clearUnitInMasterPlanImage({required CreateRequestStates newEmit}) {
    unitInMasterPlanImage = null;
    emit(newEmit);
  }

  Future<void> pickMainImage({required CreateRequestStates newEmit}) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        mainImage = File(pickedFile.path);
        emit(newEmit);
      }
    } catch (e) {
      emit(UploadImageErrorState());
    }
  }

  void clearMainImage({required CreateRequestStates newEmit}) {
    mainImage = null;
    emit(newEmit);
  }

  Future<void> pickGalleryImages({required CreateRequestStates newEmit}) async {
    try {
      final List<XFile> pickedFiles = await picker.pickMultiImage(
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (pickedFiles.isNotEmpty) {
        galleryImages = pickedFiles.map((f) => File(f.path)).toList();
        emit(newEmit);
      }
    } catch (e) {
      emit(UploadImageErrorState());
    }
  }

  void clearGalleryImages({required CreateRequestStates newEmit}) {
    galleryImages = [];
    emit(newEmit);
  }

  Future<void> pickVideo({required CreateRequestStates newEmit}) async {
    try {
      final XFile? pickedFile = await picker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: const Duration(minutes: 2),
      );
      if (pickedFile != null) {
        video = File(pickedFile.path);
        emit(newEmit);
      }
    } catch (e) {
      emit(UploadImageErrorState());
    }
  }

  void clearVideo({required CreateRequestStates newEmit}) {
    video = null;
    emit(newEmit);
  }

  // ========================================================================
  // Legacy field selections (kept for backward compat with existing widgets)
  // ========================================================================
  String? selectedSpecializationValue;
  String? selectedSpecializationLabel;
  String? selectedDealTypeValue;
  String? selectedDealTypeLabel;
  String? selectedUnitTypeValue;
  String? selectedUnitTypeLabel;

  // Legacy individual field values
  String? selectedPaymentSystem;
  String? selectedTheUnitView;
  String? selectedFinishingCondition;
  String? selectedDeliveryStatus;
  String? selectedOtherLuxuries;
  String? selectedFloor;

  // Legacy controllers
  var addressCon = TextEditingController();
  var locationLinkCon = TextEditingController();
  var unitAreaMinCon = TextEditingController();
  var unitAreaMaxCon = TextEditingController();
  var propertyNumberCon = TextEditingController();
  var unitNumberCon = TextEditingController();
  var numberOfRoomsCon = TextEditingController();
  var bathroomsCon = TextEditingController();
  var notesCon = TextEditingController();
  var otherSubAreaCon = TextEditingController();
  var priceMinCon = TextEditingController();
  var priceMaxCon = TextEditingController();
  bool requestPriceQuotes = false;
  bool areaSuggestions = false;
  bool isSubAreaOther = false;

  void toggleAreaSuggestions(bool? value) {
    areaSuggestions = value ?? false;
    emit(AreaSuggestionsState());
  }

  void toggleRequestPriceQuotes(bool? value) {
    requestPriceQuotes = value ?? false;
    emit(RequestPriceQuotesState());
  }

  void selectSubAreaOther() {
    isSubAreaOther = true;
    selectedSubAreaObj = null;
    emit(SelectSubAreaState());
  }

  List<CategoryModel> categories = [
    CategoryModel(id: 1, name: LangKeys.buyingPropertyPart1.tr(), des: LangKeys.buyingPropertyPart2.tr(), image: SvgImages.house),
    CategoryModel(id: 2, name: LangKeys.propertyRentalPart1.tr(), des: LangKeys.propertyRentalPart2.tr(), image: SvgImages.key),
    CategoryModel(id: 3, name: LangKeys.propertyForSalePart1.tr(), des: LangKeys.propertyForSalePart2.tr(), image: SvgImages.buy),
    CategoryModel(id: 4, name: LangKeys.rentingPropertyPart1.tr(), des: LangKeys.rentingPropertyPart2.tr(), image: SvgImages.transfer),
    CategoryModel(id: 5, name: LangKeys.rentHotelUnitPart1.tr(), des: LangKeys.rentHotelUnitPart2.tr(), image: SvgImages.hands),
    CategoryModel(id: 6, name: LangKeys.rentingHotelUnitPart1.tr(), des: LangKeys.rentingHotelUnitPart2.tr(), image: SvgImages.welfare),
  ];

  int selectedIndex = -1;
  void selectCategory(int index) { selectedIndex = index; emit(CategorySelectedState(selectedIndex)); }

  void selectSpecialization({String? value, String? label}) {
    selectedSpecializationValue = value;
    selectedSpecializationLabel = label;
    selectedDealTypeLabel = null;
    selectedDealTypeValue = null;
    selectedUnitTypeLabel = null;
    selectedUnitTypeValue = null;
    emit(SelectSpecializationState());
  }

  void selectDealType({String? value, String? label}) {
    selectedDealTypeValue = value;
    selectedDealTypeLabel = label;
    selectedUnitTypeLabel = null;
    selectedUnitTypeValue = null;
    emit(SelectDealTypeState());
  }

  void selectUnitType({String? value, String? label}) {
    selectedUnitTypeValue = value;
    selectedUnitTypeLabel = label;
    emit(SelectUnitTypeState());
  }

  // ========================================================================
  // Step navigation
  // ========================================================================
  int currentStepNumber = 1;

  List<String> get titleNames {
    final names = <String>[
      LangKeys.orderSettings.tr(),
      LangKeys.siteInformation.tr(),
      LangKeys.unitData.tr(),
    ];

    final shouldSkipDoc = configFactory.shouldSkipStep4(selectedDealTypeValue);
    if (!shouldSkipDoc) {
      names.add(LangKeys.projectDocuments.tr());
    }
    names.add(LangKeys.financialInformation.tr());
    return names;
  }

  int get totalSteps {
    return configFactory.shouldSkipStep4(selectedDealTypeValue) ? 4 : 5;
  }

  int get adjustedCurrentStep => currentStepNumber;

  void moveNextStep(int step) {
    currentStepNumber = step;
    emit(MoveNextStepState());
  }

  // ========================================================================
  // Config key & inputs for current step
  // ========================================================================
  String get configKey => configFactory.getConfigKey(
    selectedSpecializationValue,
    selectedDealTypeValue,
    selectedUnitTypeValue,
  );

  List<InputConfig> get currentStepInputs {
    return configFactory.getInputsForKey(configKey, currentStepNumber);
  }

  List<InputConfig> getInputsForStep(int step) {
    return configFactory.getInputsForKey(configKey, step);
  }

  bool get shouldShowStep4 => !configFactory.shouldSkipStep4(selectedDealTypeValue);
  bool get isInsideCompound => configFactory.getInsideCompoundPrivilege(selectedSpecializationValue);
  bool get isOutsideCompound => configFactory.getOutsideCompoundPrivilege(selectedSpecializationValue);
  bool get isSellInside => configFactory.isSellInsideCompound(selectedSpecializationValue, selectedDealTypeValue);
  bool get isRentOutOutside => configFactory.isRentOutOutsideCompound(selectedSpecializationValue, selectedDealTypeValue);
  bool get isRentInOutside => configFactory.isRentInOutsideCompound(selectedSpecializationValue, selectedDealTypeValue);

  // Conditional display helpers
  bool get shouldShowDeliveryDate => getFormValueString('deliveryStatus') == 'under_construction';
  bool get shouldShowFloorNumber => getFormValueString('floor') == 'repeated';
  bool get shouldShowCashPrice {
    final paymentMethod = getFormValueString('paymentMethod');
    return paymentMethod == 'cash' || paymentMethod == 'all_of_the_above_are_suitable';
  }
  bool get shouldShowInstallmentPrice {
    final paymentMethod = getFormValueString('paymentMethod');
    return paymentMethod == 'installment' || paymentMethod == 'all_of_the_above_are_suitable';
  }
  bool get isUserClient => false; // Will be set from user role

  // ========================================================================
  // Location
  // ========================================================================
  List<Cities> citiesList = [];
  List<Areas> areasList = [];
  List<SubArea> subAreasList = [];

  Cities? selectedCityObj;
  Areas? selectedAreaObj;
  SubArea? selectedSubAreaObj;

  String? get selectedCity => selectedCityObj?.nameEn;
  String? get selectedArea => selectedAreaObj?.nameEn;
  String? get selectedSubArea => selectedSubAreaObj?.nameEn;
  int? get selectedCityId => selectedCityObj?.id;
  int? get selectedAreaId => selectedAreaObj?.id;
  int? get selectedSubAreaId => selectedSubAreaObj?.id;

  Future<void> getCities() async {
    emit(GetCitiesLoadingState());
    var result = await createRequestRepo!.getAllCities();
    return result.fold(
      (failure) => emit(GetCitiesErrorState(failure.errMessage)),
      (data) { citiesList = data.data ?? []; emit(GetCitiesSuccessState()); },
    );
  }

  Future<void> getAreas({required int cityId}) async {
    emit(GetAreasLoadingState());
    selectedAreaObj = null;
    selectedSubAreaObj = null;
    isSubAreaOther = false;
    otherSubAreaCon.clear();
    areasList = [];
    subAreasList = [];
    var result = await createRequestRepo!.getAreas(cityId: cityId);
    return result.fold(
      (failure) => emit(GetAreasErrorState(failure.errMessage)),
      (data) { areasList = data.data ?? []; emit(GetAreasSuccessState()); },
    );
  }

  Future<void> getSubAreas({required int areaId}) async {
    emit(GetSubAreasLoadingState());
    selectedSubAreaObj = null;
    isSubAreaOther = false;
    otherSubAreaCon.clear();
    subAreasList = [];
    var result = await createRequestRepo!.getSubAreas(areaId: areaId);
    return result.fold(
      (failure) => emit(GetSubAreasErrorState(failure.errMessage)),
      (data) { subAreasList = data.data ?? []; emit(GetSubAreasSuccessState()); },
    );
  }

  void selectCity(Cities city) {
    selectedCityObj = city;
    setFormValue('cityId', city.id);
    emit(SelectCityState());
  }
  void selectArea(Areas area) {
    selectedAreaObj = area;
    setFormValue('areaId', area.id);
    emit(SelectAreaState());
  }
  void selectSubArea(SubArea subArea) { selectedSubAreaObj = subArea; isSubAreaOther = false; emit(SelectSubAreaState()); }

  // Legacy selection methods
  void selectPaymentSystem(String? v) { selectedPaymentSystem = v; setFormValue('paymentMethod', v); emit(SelectPaymentSystemState()); }
  void selectTheUnitView(String? v) { selectedTheUnitView = v; setFormValue('unitView', v); emit(SelectTheUnitViewState()); }
  void selectFinishingCondition(String? v) { selectedFinishingCondition = v; setFormValue('finishingStatus', v); emit(SelectFinishingConditionState()); }
  void selectDeliveryStatus(String? v) { selectedDeliveryStatus = v; setFormValue('deliveryStatus', v); emit(SelectDeliveryStatusState()); }
  void selectOtherLuxuries(String? v) { selectedOtherLuxuries = v; setFormValue('otherAccessories', v); emit(SelectOtherLuxuriesState()); }
  void selectFloor(String? v) { selectedFloor = v; setFormValue('floor', v); emit(SelectFloorState()); }

  // ========================================================================
  // Step validation & navigation
  // ========================================================================
  void handleStepOne(BuildContext context) {
    if (selectedSpecializationValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LangKeys.youMustChooseFieldOfSpecialization.tr())));
    } else if (selectedDealTypeValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LangKeys.youMustChooseFieldOfDealType.tr())));
    } else if (selectedUnitTypeValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LangKeys.youMustChooseFieldOfUnitType.tr())));
    } else {
      moveNextStep(currentStepNumber + 1);
    }
  }

  void handleNextSteps(BuildContext context) {
    // Sync all controller values to formValues
    for (final entry in controllers.entries) {
      if (entry.value.text.isNotEmpty) {
        formValues[entry.key] = entry.value.text;
      }
    }

    if (!validateCurrentStep()) return;

    final total = totalSteps;
    if (currentStepNumber < total) {
      moveNextStep(currentStepNumber + 1);
    } else {
      submitCreateRequest(context);
    }
  }

  // ========================================================================
  // Submit
  // ========================================================================
  Future<void> submitCreateRequest(BuildContext context) async {
    emit(CreateRequestLoadingState());

    final userId = CacheHelper.getData(key: "userId");
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please login first")));
      emit(CreateRequestErrorState("User not logged in"));
      return;
    }

    // Sync controller values
    for (final entry in controllers.entries) {
      if (entry.value.text.isNotEmpty) {
        formValues[entry.key] = entry.value.text;
      }
    }

    final formData = FormData();

    // Step 1: top-level fields
    formData.fields.add(MapEntry('userId', userId.toString()));
    formData.fields.add(MapEntry('specializationScope', selectedSpecializationValue ?? ''));
    formData.fields.add(MapEntry('type', selectedDealTypeValue ?? ''));
    formData.fields.add(MapEntry('unitType', selectedUnitTypeValue ?? ''));
    formData.fields.add(MapEntry('projectType', 'residential'));

    // Location: nested structure
    if (selectedCityId != null) {
      formData.fields.add(MapEntry('locations[0][city]', selectedCityId.toString()));
    }
    if (selectedAreaId != null) {
      formData.fields.add(MapEntry('locations[0][areas][0][id]', selectedAreaId.toString()));
    }
    if (selectedSubAreaId != null) {
      formData.fields.add(MapEntry('locations[0][areas][0][subAreas][0]', selectedSubAreaId.toString()));
    }

    // otherSubArea top-level
    if (isSubAreaOther && otherSubAreaCon.text.isNotEmpty) {
      formData.fields.add(MapEntry('otherSubArea', otherSubAreaCon.text));
    }

    // Step 2 extra fields (compoundName, detailedAddress, addressLink, etc.)
    void addTopLevel(String key, String? value) {
      if (value != null && value.isNotEmpty) {
        formData.fields.add(MapEntry(key, value));
      }
    }

    addTopLevel('compoundName', getFormValueString('compoundName'));
    addTopLevel('detailedAddress', getFormValueString('detailedAddress'));
    addTopLevel('addressLink', getFormValueString('addressLink'));
    addTopLevel('mallName', getFormValueString('mallName'));
    addTopLevel('projectManagement', getFormValueString('projectManagement'));
    addTopLevel('projectConstructor', getFormValueString('projectConstructor'));

    // Attributes helper
    void addAttr(String key, String? value) {
      if (value != null && value.isNotEmpty) {
        formData.fields.add(MapEntry('attributes[$key]', value));
      }
    }

    void addAttrBool(String key, bool value) {
      formData.fields.add(MapEntry('attributes[$key]', value ? '1' : '0'));
    }

    void addAttrArray(String key, List<String> values) {
      for (int i = 0; i < values.length; i++) {
        if (values[i].isNotEmpty) {
          formData.fields.add(MapEntry('attributes[$key][$i]', values[i]));
        }
      }
    }

    // Step 3: Unit info
    addAttr('unitAreaMin', getFormValueString('unitAreaMin') ?? unitAreaMinCon.text);
    addAttr('unitAreaMax', getFormValueString('unitAreaMax') ?? unitAreaMaxCon.text);
    addAttr('floor', selectedFloor ?? getFormValueString('floor'));
    addAttr('floorNumber', getFormValueString('floorNumber'));
    addAttr('unitNumber', getFormValueString('unitNumber'));
    addAttr('buildingNumber', getFormValueString('buildingNumber'));
    addAttr('unitArea', getFormValueString('unitArea'));
    addAttr('rooms', getFormValueString('rooms') ?? numberOfRoomsCon.text);
    addAttr('bathRooms', getFormValueString('bathRooms') ?? bathroomsCon.text);
    addAttr('unitView', selectedTheUnitView ?? getFormValueString('unitView'));
    addAttr('finishingStatus', selectedFinishingCondition ?? getFormValueString('finishingStatus'));
    addAttr('deliveryStatus', selectedDeliveryStatus ?? getFormValueString('deliveryStatus'));
    addAttr('deliveryDate', getFormValueString('deliveryDate'));
    addAttr('financialStatus', getFormValueString('financialStatus'));
    addAttr('legalStatus', getFormValueString('legalStatus'));
    addAttr('notes', getFormValueString('notes') ?? notesCon.text);
    addAttr('numberOfFloors', getFormValueString('numberOfFloors'));
    addAttr('gardenArea', getFormValueString('gardenArea'));
    addAttr('buildingAreaMin', getFormValueString('buildingAreaMin'));
    addAttr('buildingAreaMax', getFormValueString('buildingAreaMax'));
    addAttr('groundAreaMin', getFormValueString('groundAreaMin'));
    addAttr('groundAreaMax', getFormValueString('groundAreaMax'));
    addAttr('unitFacing', getFormValueString('unitFacing'));
    addAttr('unitStatus', getFormValueString('unitStatus'));
    addAttr('buildingLayoutStatus', getFormValueString('buildingLayoutStatus'));
    addAttr('unitDesign', getFormValueString('unitDesign'));
    addAttr('activity', getFormValueString('activity'));
    addAttr('shopActivity', getFormValueString('shopActivity'));
    addAttr('fitOutCondition', getFormValueString('fitOutCondition'));
    addAttr('unitDescription', getFormValueString('unitDescription'));
    addAttr('buildingLicense', getFormValueString('buildingLicense'));
    addAttr('buildingDeadline', getFormValueString('buildingDeadline'));
    addAttr('groundDescription', getFormValueString('groundDescription'));

    // areaSuggestions boolean
    addAttrBool('areaSuggestions', areaSuggestions);

    // otherAccessories multi-select array
    final accessories = getFormValueList('otherAccessories');
    if (selectedOtherLuxuries != null && selectedOtherLuxuries!.isNotEmpty) {
      if (!accessories.contains(selectedOtherLuxuries)) {
        accessories.add(selectedOtherLuxuries!);
      }
    }
    addAttrArray('otherAccessories', accessories);

    // Furnishing (rental)
    addAttr('furnishingStatus', getFormValueString('furnishingStatus'));

    // Step 5: Financial
    addAttr('paymentMethod', selectedPaymentSystem ?? getFormValueString('paymentMethod'));
    addAttr('averageUnitPriceMin', getFormValueString('averageUnitPriceMin') ?? priceMinCon.text);
    addAttr('averageUnitPriceMax', getFormValueString('averageUnitPriceMax') ?? priceMaxCon.text);
    addAttrBool('unitPriceSuggestions', requestPriceQuotes);
    addAttr('rentRecurrence', getFormValueString('rentRecurrence'));
    addAttr('monthlyRentMin', getFormValueString('monthlyRentMin'));
    addAttr('monthlyRentMax', getFormValueString('monthlyRentMax'));
    addAttr('rentDuration', getFormValueString('rentDuration'));
    addAttr('requiredInsurance', getFormValueString('requiredInsurance'));
    addAttr('requiredInsuranceValue', getFormValueString('requiredInsuranceValue'));

    // Cash/installment price
    final paymentMethod = getFormValueString('paymentMethod');
    if (paymentMethod == 'cash' || paymentMethod == 'all_of_the_above_are_suitable') {
      addAttr('cashPrice', getFormValueString('cashPrice'));
    }
    if (paymentMethod == 'installment' || paymentMethod == 'all_of_the_above_are_suitable') {
      addAttr('installmentPrice', getFormValueString('installmentPrice'));
    }

    // otherExpenses multi-select (rental)
    final expenses = getFormValueList('otherExpenses');
    addAttrArray('otherExpenses', expenses);

    // Files
    if (mainImage != null) {
      formData.files.add(MapEntry('attributes[mainImage]', await MultipartFile.fromFile(mainImage!.path, filename: 'main_image.jpg')));
    }
    if (galleryImages.isNotEmpty) {
      for (int i = 0; i < galleryImages.length; i++) {
        formData.files.add(MapEntry('attributes[galleryImages][$i]', await MultipartFile.fromFile(galleryImages[i].path, filename: 'gallery_$i.jpg')));
      }
    }
    if (video != null) {
      formData.files.add(MapEntry('attributes[video][0]', await MultipartFile.fromFile(video!.path, filename: 'video.mp4')));
    }

    logSuccess("FormData prepared for submission");

    var result = await createRequestRepo!.createRequest(formData);
    return result.fold(
      (failure) {
        emit(CreateRequestErrorState(failure.errMessage));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.errMessage)));
      },
      (data) {
        final requestId = data['data']?['id'] ?? data['id'];
        if (requestId != null) {
          emit(CreateRequestSuccessState(requestId));
          context.pushNamedAndRemoveUntil(Routes.successAssignView);
        } else {
          emit(CreateRequestErrorState('Failed to get request ID'));
        }
      },
    );
  }
}
