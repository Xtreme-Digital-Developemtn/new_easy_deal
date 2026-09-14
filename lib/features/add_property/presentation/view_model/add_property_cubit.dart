import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../main_imports.dart';
import '../../../search/data/models/cities_model.dart';
import '../../../search/data/models/areas_model.dart';
import '../../../create_request/data/models/sub_areas_model.dart';
import '../../data/config/ap_fields.dart';
import '../../data/config/ap_option_item.dart';
import '../../data/config/ap_options.dart';
import '../../data/repos/add_property_repo.dart';
import 'add_property_states.dart';

/// Drives the broker "Add Property" stepper. Faithful port of
/// `add-property-in-crm.component.ts` (posts to `unit/create-unit`).
class AddPropertyCubit extends Cubit<AddPropertyStates> {
  AddPropertyCubit(this.repo) : super(AddPropertyInitState());

  final AddPropertyRepo repo;

  // Template render order for the dynamic steps (matches the Angular template).
  static const step2Order = <String>[
    'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'terraceArea', 'gardenArea',
    'floorNumber', 'numberOfFloors', 'buildingArea', 'groundArea', 'numberOfRooms',
    'numberOfBathrooms', 'subUnitType', 'unitFacing', 'buildingLayoutStatus',
    'unitLayoutStatus', 'unitDescription', 'buildingDeadline', 'buildingLicense', 'view',
    'finishingType', 'fitOutCondition', 'furnishingStatus', 'groundLayoutStatus',
    'unitDesign', 'activity', 'shopActivity', 'deliveryStatus', 'deliveryDate',
    'legalStatus', 'financialStatus', 'otherAccessories', 'notes',
  ];

  static const step3Order = <String>[
    'requestedOver', 'requiredInsurance', 'insuranceValue', 'rentRecurrence',
    'dailyRent', 'monthlyRent', 'paymentSystem', 'pricePerMeterInCash',
    'totalPriceInCash', 'pricePerMeterInInstallment', 'totalPriceInInstallment',
    'otherExpenses',
  ];

  // ===========================================================================
  // Step navigation
  // ===========================================================================
  int currentStep = 0;
  final int totalSteps = 5;

  void nextStep() {
    if (currentStep < totalSteps) {
      currentStep++;
      emit(MoveStepState());
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(MoveStepState());
    }
  }

  // ===========================================================================
  // Form values + controllers
  // ===========================================================================
  final Map<String, dynamic> formValues = {};
  final Map<String, TextEditingController> controllers = {};
  bool validationAttempted = false;

  /// Fields the user has already interacted with (for live validation).
  final Set<String> _dirty = {};
  bool isDirty(String name) => _dirty.contains(name);

  TextEditingController controller(String name) =>
      controllers.putIfAbsent(name, () => TextEditingController());

  dynamic value(String name) => formValues[name];
  String? valueStr(String name) => formValues[name]?.toString();
  List<String> valueList(String name) {
    final v = formValues[name];
    if (v is List) return v.cast<String>();
    return [];
  }

  void setValue(String name, dynamic v) {
    formValues[name] = v;
    _dirty.add(name);
    emit(FormValueChangedState());
  }

  // ---------------------------------------------------------------------------
  // Live field validators (shown as soon as a field is touched)
  // ---------------------------------------------------------------------------
  static final RegExp _egyptPhone = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
  static final RegExp _url = RegExp(r'^https?://.+');

  bool isPhoneValid(String? v) => v != null && _egyptPhone.hasMatch(v);
  bool isUrlValid(String? v) => v != null && v.isNotEmpty && _url.hasMatch(v);

  /// Live error for a step-1 text field (null = ok). [required] adds an empty check.
  String? liveTextError(String name, {bool required = false}) {
    if (!isDirty(name) && !validationAttempted) return null;
    final v = valueStr(name)?.trim() ?? '';
    if (name == 'ownerPhone') {
      if (v.isEmpty) return LangKeys.fieldRequired.tr();
      if (!_egyptPhone.hasMatch(v)) return LangKeys.phoneEgyptInvalid.tr();
      return null;
    }
    if (name == 'location') {
      if (v.isEmpty) return null; // optional
      if (!_url.hasMatch(v)) return LangKeys.validUrlRequired.tr();
      return null;
    }
    if (required && v.isEmpty) return LangKeys.fieldRequired.tr();
    return null;
  }

  void syncControllers() {
    for (final entry in controllers.entries) {
      formValues[entry.key] = entry.value.text;
    }
  }

  // ===========================================================================
  // Step 0 – category
  // ===========================================================================
  String? get compoundType => valueStr('compoundType');
  String? get unitOperation => valueStr('unitOperation');
  String? get unitType => valueStr('type');

  List<ApOptionItem> filteredUnitTypes = [];

  void selectStep0(String field, String value) {
    formValues[field] = value;
    if (field == 'compoundType' || field == 'unitOperation') {
      _filterUnitTypes();
      formValues['type'] = null;
    }
    emit(Step0ChangedState());
  }

  void _filterUnitTypes() {
    filteredUnitTypes = ApOptions.unitTypesFor(compoundType, unitOperation);
  }

  // ===========================================================================
  // Dynamic option resolution per field
  // ===========================================================================
  List<ApOptionItem> optionsForField(String name) {
    switch (name) {
      case 'floor':
        return ApOptions.floorTypes;
      case 'unitFacing':
        return ApOptions.unitFacingTypes;
      case 'unitDescription':
        return ApOptions.unitDescriptionTypes;
      case 'buildingDeadline':
        return ApOptions.buildingDeadlineTypes;
      case 'buildingLicense':
        return ApOptions.buildingLicenseTypes;
      case 'activity':
        return ApOptions.activityTypes;
      case 'unitDesign':
        return ApOptions.unitDesignTypes;
      case 'groundLayoutStatus':
        return ApOptions.groundLayoutStatusTypes;
      case 'fitOutCondition':
        return ApOptions.fitOutConditionTypes;
      case 'legalStatus':
        return ApOptions.legalTypes;
      case 'financialStatus':
        return ApOptions.financialStatusTypes;
      case 'paymentSystem':
        return ApOptions.paymentTypes;
      case 'rentRecurrence':
        return ApOptions.rentRecurrenceTypes;
      case 'requiredInsurance':
        return ApOptions.requiredInsuranceTypes;
      case 'view':
        return ApOptions.viewTypesFor(compoundType, unitType);
      case 'finishingType':
        return ApOptions.finishingTypesFor(unitOperation, unitType);
      case 'furnishingStatus':
        return ApOptions.furnishingTypesFor(unitOperation, unitType);
      case 'deliveryStatus':
        return ApOptions.deliveryTypesFor(unitType);
      case 'unitLayoutStatus':
        return ApOptions.unitLayoutStatusFor(unitType);
      case 'buildingLayoutStatus':
        return ApOptions.buildingLayoutStatusFor(unitType);
      case 'subUnitType':
        return ApOptions.subUnitTypesFor(compoundType, unitType);
      case 'otherAccessories':
        return ApOptions.otherAccessoriesFor(unitOperation, compoundType, unitType);
      case 'otherExpenses':
        return ApOptions.otherExpenses;
      default:
        return const [];
    }
  }

  // ===========================================================================
  // Visibility
  // ===========================================================================
  List<String> get fieldsToShow => ApFields.getFieldsToShow(
        operation: unitOperation,
        compound: compoundType,
        type: unitType,
      );

  /// Mirrors `shouldShowField` in the Angular component.
  bool shouldShowField(String name) {
    if (unitOperation == 'rent_out' && (name == 'deliveryStatus' || name == 'legalStatus')) {
      return false;
    }
    if (unitOperation == 'rent_out' &&
        (name == 'furnishingStatus' || name == 'dailyRent' || name == 'monthlyRent' || name == 'rentRecurrence')) {
      return true;
    }
    if (name == 'activity' && (unitType == 'pharmacies' || unitType == 'medical_clinics')) {
      return false;
    }
    if (compoundType == 'inside_compound' && name == 'legalStatus') {
      return false;
    }
    return fieldsToShow.contains(name);
  }

  bool _shouldShowFurnishingStatusField() {
    if (unitOperation != 'sell' && (unitType == 'warehouse_lands' || unitType == 'factory_lands')) {
      return false;
    }
    if (unitOperation == 'sell') {
      return !{
        'pharmacies', 'commercial_stores', 'factory_lands', 'warehouse_lands',
        'commercial_administrative_buildings', 'administrative_units',
      }.contains(unitType);
    }
    return !{'pharmacies', 'commercial_stores', 'commercial_administrative_buildings'}.contains(unitType);
  }

  bool _shouldShowGroundLayoutStatusField() => {
        'factory_lands', 'warehouse_lands', 'residential_buildings', 'commercial_administrative_buildings',
      }.contains(unitType);

  bool get _cashSelected {
    final p = valueStr('paymentSystem');
    return p == 'cash' || p == 'all_of_the_above_are_suitable';
  }

  bool get _installmentSelected {
    final p = valueStr('paymentSystem');
    return p == 'installment' || p == 'all_of_the_above_are_suitable';
  }

  /// Full visibility for a single dynamic field (membership + conditionals).
  bool isFieldVisible(String name) {
    switch (name) {
      case 'floorNumber':
        return shouldShowField('floor') && valueStr('floor') == 'repeated';
      case 'buildingLicense':
        return shouldShowField('buildingDeadline');
      case 'furnishingStatus':
        return _shouldShowFurnishingStatusField() && shouldShowField('furnishingStatus');
      case 'groundLayoutStatus':
        return _shouldShowGroundLayoutStatusField() && shouldShowField('groundLayoutStatus');
      case 'deliveryDate':
        return shouldShowField('deliveryStatus') && valueStr('deliveryStatus') == 'under_construction';
      case 'insuranceValue':
        return shouldShowField('requiredInsurance') && valueStr('requiredInsurance') == 'fixed_amount';
      case 'dailyRent':
        return shouldShowField('dailyRent') && valueStr('rentRecurrence') == 'daily';
      case 'monthlyRent':
        final r = valueStr('rentRecurrence');
        return shouldShowField('monthlyRent') && (r == 'monthly' || r == 'annually');
      case 'pricePerMeterInCash':
      case 'totalPriceInCash':
        return _cashSelected && shouldShowField('pricePerMeterInCash');
      case 'pricePerMeterInInstallment':
        return _installmentSelected && shouldShowField('pricePerMeterInInstallment');
      case 'totalPriceInInstallment':
        return _installmentSelected &&
            shouldShowField('pricePerMeterInInstallment') &&
            shouldShowField('totalPriceInInstallment');
      default:
        return shouldShowField(name);
    }
  }

  List<String> visibleStep2Fields() =>
      step2Order.where(isFieldVisible).toList();

  List<String> visibleStep3Fields() =>
      step3Order.where(isFieldVisible).toList();

  // ===========================================================================
  // Payment side effects
  // ===========================================================================
  void selectPaymentSystem(String v) {
    formValues['paymentSystem'] = v;
    // Clear price fields when payment system changes.
    for (final k in ['pricePerMeterInCash', 'totalPriceInCash', 'pricePerMeterInInstallment', 'totalPriceInInstallment']) {
      formValues.remove(k);
      controllers[k]?.clear();
    }
    emit(FormValueChangedState());
  }

  /// Auto-computes total from price/meter using the primary area (unit → building → ground).
  double? get _primaryArea {
    final unit = double.tryParse(valueStr('unitArea') ?? '');
    if (unit != null && unit > 0) return unit;
    final building = double.tryParse(valueStr('buildingArea') ?? '');
    if (building != null && building > 0) return building;
    return double.tryParse(valueStr('groundArea') ?? '');
  }

  void onPricePerMeterChanged(String field, String raw) {
    formValues[field] = raw;
    final area = _primaryArea;
    final ppm = double.tryParse(raw);
    if (area != null && ppm != null) {
      final totalField = field.contains('Cash') ? 'totalPriceInCash' : 'totalPriceInInstallment';
      final total = (ppm * area).round().toString();
      formValues[totalField] = total;
      controller(totalField).text = total;
    }
    emit(FormValueChangedState());
  }

  // ===========================================================================
  // Multi-select (accessories / expenses)
  // ===========================================================================
  final List<String> selectedAccessories = [];
  final List<String> selectedExpenses = [];

  void toggleAccessory(String v) {
    selectedAccessories.contains(v) ? selectedAccessories.remove(v) : selectedAccessories.add(v);
    formValues['otherAccessories'] = List<String>.from(selectedAccessories);
    emit(FormValueChangedState());
  }

  void toggleAllAccessories(bool checked) {
    selectedAccessories
      ..clear()
      ..addAll(checked ? optionsForField('otherAccessories').map((e) => e.value) : const []);
    formValues['otherAccessories'] = List<String>.from(selectedAccessories);
    emit(FormValueChangedState());
  }

  void toggleExpense(String v) {
    selectedExpenses.contains(v) ? selectedExpenses.remove(v) : selectedExpenses.add(v);
    formValues['otherExpenses'] = List<String>.from(selectedExpenses);
    emit(FormValueChangedState());
  }

  void toggleAllExpenses(bool checked) {
    selectedExpenses
      ..clear()
      ..addAll(checked ? ApOptions.otherExpenses.map((e) => e.value) : const []);
    formValues['otherExpenses'] = List<String>.from(selectedExpenses);
    emit(FormValueChangedState());
  }

  // ===========================================================================
  // Location cascade
  // ===========================================================================
  List<Cities> citiesList = [];
  List<Areas> areasList = [];
  List<SubArea> subAreasList = [];
  Cities? selectedCity;
  Areas? selectedArea;
  SubArea? selectedSubArea;
  bool isOtherSubArea = false;

  Future<void> getCities() async {
    emit(GetCitiesLoadingState());
    final result = await repo.getAllCities();
    result.fold(
      (f) => emit(GetCitiesErrorState(f.errMessage)),
      (data) {
        citiesList = data.data ?? [];
        emit(GetCitiesSuccessState());
      },
    );
  }

  Future<void> selectCityItem(Cities city) async {
    selectedCity = city;
    selectedArea = null;
    selectedSubArea = null;
    isOtherSubArea = false;
    areasList = [];
    subAreasList = [];
    formValues['cityId'] = city.id;
    emit(SelectLocationState());
    emit(GetAreasLoadingState());
    final result = await repo.getAreas(cityId: city.id ?? 0);
    result.fold(
      (f) => emit(GetAreasErrorState(f.errMessage)),
      (data) {
        areasList = data.data ?? [];
        emit(GetAreasSuccessState());
      },
    );
  }

  Future<void> selectAreaItem(Areas area) async {
    selectedArea = area;
    selectedSubArea = null;
    isOtherSubArea = false;
    subAreasList = [];
    formValues['areaId'] = area.id;
    emit(SelectLocationState());
    emit(GetSubAreasLoadingState());
    final result = await repo.getSubAreas(areaId: area.id ?? 0);
    result.fold(
      (f) => emit(GetSubAreasErrorState(f.errMessage)),
      (data) {
        subAreasList = data.data ?? [];
        emit(GetSubAreasSuccessState());
      },
    );
  }

  void selectSubAreaItem(SubArea subArea) {
    selectedSubArea = subArea;
    formValues['subAreaId'] = subArea.id;
    // The API itself provides an "أخرى / Other" entry; selecting it reveals the
    // custom free-text field (keeping its id for `otherSubAreas[0][sub_area_id]`).
    final ar = (subArea.nameAr ?? '').trim();
    final en = (subArea.nameEn ?? '').trim().toLowerCase();
    isOtherSubArea = ar == 'أخرى' || ar == 'اخرى' || en == 'other';
    emit(SelectLocationState());
  }

  // ===========================================================================
  // Files
  // ===========================================================================
  final ImagePicker _picker = ImagePicker();
  final List<File> diagram = []; // main unit images
  final List<File> layout = []; // gallery images (multiple)
  final List<File> locationInMasterPlan = []; // unit plan

  Future<void> pickFiles(String field) async {
    try {
      final picked = await _picker.pickMultiImage(maxWidth: 1200, imageQuality: 85);
      if (picked.isEmpty) return;
      final files = picked.map((e) => File(e.path)).toList();
      switch (field) {
        case 'diagram':
          diagram
            ..clear()
            ..addAll(files);
          break;
        case 'layout':
          layout
            ..clear()
            ..addAll(files);
          break;
        case 'locationInMasterPlan':
          locationInMasterPlan
            ..clear()
            ..addAll(files);
          break;
      }
      emit(FilesChangedState());
    } catch (_) {
      emit(PickFileErrorState());
    }
  }

  int fileCount(String field) {
    switch (field) {
      case 'diagram':
        return diagram.length;
      case 'layout':
        return layout.length;
      case 'locationInMasterPlan':
        return locationInMasterPlan.length;
      default:
        return 0;
    }
  }

  // ===========================================================================
  // Validation (mirrors isCurrentFormValid / isStep2FormValid / isStep3FormValid)
  // ===========================================================================
  bool _isEmpty(String name) {
    final v = formValues[name];
    if (v == null) return true;
    if (v is String) return v.trim().isEmpty;
    if (v is List) return v.isEmpty;
    return false;
  }

  bool _isFieldRequiredForUnitType(String name) {
    switch (name) {
      case 'unitFacing':
        return {'apartments', 'duplexes', 'studios', 'penthouses'}.contains(unitType);
      case 'legalStatus':
        return {'duplexes', 'penthouses', 'basements', 'roofs', 'medical_clinics', 'vacation_villa'}.contains(unitType);
      case 'fitOutCondition':
        return {
          'villas', 'residential_buildings', 'pharmacies', 'factory_lands',
          'warehouse_lands', 'commercial_stores', 'commercial_administrative_buildings',
        }.contains(unitType);
      case 'furnishingStatus':
        return _shouldShowFurnishingStatusField();
      case 'groundLayoutStatus':
        return _shouldShowGroundLayoutStatusField();
      case 'unitDesign':
        return unitType == 'standalone_villas';
      case 'activity':
        return {'commercial_stores', 'factory_lands', 'warehouse_lands', 'commercial_administrative_buildings'}.contains(unitType);
      default:
        return false;
    }
  }

  static const _step2RequiredFields = ['unitArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType'];

  bool _isStep1Valid() {
    if (selectedCity == null || selectedArea == null) return false;
    if (_isEmpty('detailedAddress')) return false;
    final phone = valueStr('ownerPhone') ?? '';
    return RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(phone);
  }

  bool _isStep2Valid() {
    final show = fieldsToShow;
    for (final name in _step2RequiredFields) {
      if (show.contains(name) && _isEmpty(name)) return false;
    }
    const conditional = ['unitFacing', 'legalStatus', 'fitOutCondition', 'furnishingStatus', 'groundLayoutStatus', 'unitDesign', 'activity'];
    for (final name in conditional) {
      if (show.contains(name) && _isFieldRequiredForUnitType(name) && _isEmpty(name)) return false;
    }
    return true;
  }

  /// Whether a step-2/3 field should render a required marker.
  bool isRequired(String name) =>
      _step2RequiredFields.contains(name) || _isFieldRequiredForUnitType(name);

  /// Inline error for a field once a next attempt has been made.
  String? errorFor(String name) {
    if (!validationAttempted && !isDirty(name)) return null;
    if (isRequired(name) && _isEmpty(name)) return LangKeys.fieldRequired.tr();
    return null;
  }

  bool isCurrentStepValid() {
    switch (currentStep) {
      case 0:
        return (compoundType?.isNotEmpty ?? false) && (unitType?.isNotEmpty ?? false);
      case 1:
        return _isStep1Valid();
      case 2:
        return _isStep2Valid();
      default:
        return true;
    }
  }

  void onNextPressed() {
    syncControllers();
    validationAttempted = true;
    if (isCurrentStepValid()) {
      validationAttempted = false;
      nextStep();
    } else {
      emit(ValidationState());
    }
  }

  // ===========================================================================
  // Submit  →  POST unit/create-unit
  // ===========================================================================
  static const _additionalDetailsFields = [
    'compoundName', 'groundArea', 'buildingArea', 'terraceArea', 'gardenArea', 'activity',
    'shopActivity', 'fitOutCondition', 'furnishingStatus', 'groundLayoutStatus',
    'unitLayoutStatus', 'buildingLayoutStatus', 'buildingLicense', 'unitDesign', 'unitFacing',
    'subUnitType', 'legalStatus', 'numberOfFloors', 'buildingDeadline', 'unitDescription',
    'financialStatus', 'floorNumber', 'insuranceValue', 'rentRecurrence', 'requiredInsurance',
    'otherExpenses', 'notes', 'caption',
  ];

  // step0 + step1 + step2 top-level keys sent flat (not inside additionalDetails).
  static const _step0Keys = ['compoundType', 'unitOperation', 'type'];
  static const _step1FlatKeys = ['cityId', 'areaId', 'subAreaId', 'mallName', 'villageName', 'compoundName', 'detailedAddress', 'location', 'ownerName', 'ownerPhone'];
  static const _step2FlatKeys = ['buildingNumber', 'unitNumber', 'floor', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'deliveryDate'];

  Future<void> submit({required bool publish, String? caption}) async {
    syncControllers();
    emit(CreateUnitLoadingState());

    final brokerId = CacheHelper.getData(key: StorageKeys.brokerId);
    final formData = FormData();

    void add(String key, dynamic v) => formData.fields.add(MapEntry(key, v?.toString() ?? ''));
    void addIf(String key, dynamic v) {
      if (v != null && v.toString().trim().isNotEmpty) {
        formData.fields.add(MapEntry(key, v.toString()));
      }
    }

    // step0
    for (final k in _step0Keys) {
      add(k, formValues[k]);
    }
    // step1 flat (excluding otherSubArea)
    for (final k in _step1FlatKeys) {
      add(k, formValues[k]);
    }
    // otherSubAreas array
    final otherSubArea = valueStr('otherSubArea');
    if (isOtherSubArea && otherSubArea != null && otherSubArea.trim().isNotEmpty) {
      add('otherSubAreas[0][id]', 0);
      add('otherSubAreas[0][name]', otherSubArea.trim());
      add('otherSubAreas[0][sub_area_id]', selectedSubArea?.id ?? 0);
    }
    // step2 flat
    for (final k in _step2FlatKeys) {
      add(k, formValues[k]);
    }

    // step3 payment
    final paymentSystem = valueStr('paymentSystem') ?? '';
    add('paymentSystem', paymentSystem);
    addIf('dailyRent', formValues['dailyRent']);
    addIf('monthlyRent', formValues['monthlyRent']);
    if (paymentSystem == 'cash') {
      addIf('pricePerMeterInCash', formValues['pricePerMeterInCash']);
      addIf('totalPriceInCash', formValues['totalPriceInCash']);
    } else if (paymentSystem == 'installment') {
      addIf('pricePerMeterInInstallment', formValues['pricePerMeterInInstallment']);
      addIf('totalPriceInInstallment', formValues['totalPriceInInstallment']);
    } else if (paymentSystem == 'all_of_the_above_are_suitable') {
      addIf('pricePerMeterInCash', formValues['pricePerMeterInCash']);
      addIf('totalPriceInCash', formValues['totalPriceInCash']);
      addIf('pricePerMeterInInstallment', formValues['pricePerMeterInInstallment']);
      addIf('totalPriceInInstallment', formValues['totalPriceInInstallment']);
    }

    // additionalDetails
    final additionalDetails = <String, String>{};
    void addDetail(String key, dynamic v) {
      if (v != null && v.toString().trim().isNotEmpty) {
        additionalDetails[key] = v.toString();
      }
    }

    for (final field in _additionalDetailsFields) {
      // These live in step2 (formValues) except the ones handled explicitly below.
      if (['rentRecurrence', 'requiredInsurance', 'otherExpenses', 'caption', 'insuranceValue',
        'mallName', 'compoundName', 'villageName'].contains(field)) {
        continue;
      }
      addDetail(field, formValues[field]);
    }
    addDetail('rentRecurrence', formValues['rentRecurrence']);
    addDetail('requestedOver', formValues['requestedOver']);
    addDetail('requiredInsurance', formValues['requiredInsurance']);
    addDetail('requiredInsuranceValue', formValues['insuranceValue']);
    addDetail('mallName', formValues['mallName']);
    addDetail('compoundName', formValues['compoundName']);
    addDetail('villageName', formValues['villageName']);

    if (publish && caption != null && caption.trim().isNotEmpty) {
      add('caption', caption.trim());
    }

    // otherExpenses inside additionalDetails[otherExpenses][i]
    final expenses = valueList('otherExpenses');
    for (var i = 0; i < expenses.length; i++) {
      add('additionalDetails[otherExpenses][$i]', expenses[i]);
    }
    additionalDetails.forEach((key, v) {
      formData.fields.add(MapEntry('additionalDetails[$key]', v));
    });

    // files
    if (diagram.isNotEmpty) {
      formData.files.add(MapEntry('diagram', await MultipartFile.fromFile(diagram.first.path)));
    }
    for (var i = 0; i < layout.length; i++) {
      formData.files.add(MapEntry('layout[]', await MultipartFile.fromFile(layout[i].path)));
    }
    if (locationInMasterPlan.isNotEmpty) {
      formData.files.add(MapEntry('locationInMasterPlan', await MultipartFile.fromFile(locationInMasterPlan.first.path)));
    }

    // otherAccessories[i]
    final accessories = valueList('otherAccessories');
    for (var i = 0; i < accessories.length; i++) {
      add('otherAccessories[$i]', accessories[i]);
    }

    add('brokerId', brokerId);
    if (publish) add('isAdvertisement', '1');

    final result = await repo.createUnit(formData);
    result.fold(
      (f) => emit(CreateUnitErrorState(f.errMessage)),
      (_) => emit(CreateUnitSuccessState(published: publish)),
    );
  }

  @override
  Future<void> close() {
    for (final c in controllers.values) {
      c.dispose();
    }
    return super.close();
  }
}
