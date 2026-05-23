import 'input_config_model.dart';
import 'stepper_constants.dart';

List<OptionItem> getSubUnitOptions(String unitType) {
  if (unitType == 'chalet_inside') {
    return [
      const OptionItem(key: 'Apartments', value: 'apartments'),
      const OptionItem(key: 'Duplexes', value: 'duplexes'),
      const OptionItem(key: 'Studios', value: 'studios'),
      const OptionItem(key: 'Penthouses', value: 'penthouses'),
    ];
  }
  if (unitType == 'chalet') {
    return [
      const OptionItem(key: 'Apartments', value: 'apartments'),
      const OptionItem(key: 'Duplexes', value: 'duplexes'),
      const OptionItem(key: 'Studios', value: 'studios'),
      const OptionItem(key: 'Penthouses', value: 'penthouses'),
      const OptionItem(key: 'Basements', value: 'basements'),
      const OptionItem(key: 'Roofs', value: 'roofs'),
    ];
  }
  if (unitType == 'vacation_villas') {
    return [
      const OptionItem(key: 'Town Houses', value: 'town_houses'),
      const OptionItem(key: 'Twin Houses', value: 'twin_houses'),
      const OptionItem(key: 'Standalone Villas', value: 'standalone_villas'),
    ];
  }
  return [];
}

class PurchasingConfigService {
  final bool Function()? isClientCallback;
  final bool Function()? getInsideCompoundPrivilegeCallback;

  PurchasingConfigService({
    this.isClientCallback,
    this.getInsideCompoundPrivilegeCallback,
  });

  bool _isClient() => isClientCallback?.call() ?? false;
  bool _getInsideCompoundPrivilege() => getInsideCompoundPrivilegeCallback?.call() ?? true;

  List<InputConfig> _createLocationInputs() {
    return [
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Compound Name',
        visibility: () => _getInsideCompoundPrivilege(),
      ),
      InputConfig(
        step: 2,
        name: 'locationSuggestions',
        type: InputFieldType.checkbox,
        label: 'Location Suggestions',
        visibility: () => _isClient(),
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
        options: const [],
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
        options: const [],
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
        options: const [],
      ),
    ];
  }

  List<InputConfig> _createPurchaseLocationInputs() {
    return _createLocationInputs();
  }

  List<InputConfig> _createUnitInformationInputs(bool includeRooms) {
    final baseInputs = <InputConfig>[
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: floorTypesOptions,
      ),
    ];

    if (includeRooms) {
      baseInputs.addAll([
        const InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
        ),
        const InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
        ),
      ]);
    }

    baseInputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseSpecificFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ]);

    return baseInputs;
  }

  List<InputConfig> _createCommercialUnitInformationInputs(bool includeFitOut) {
    final baseInputs = <InputConfig>[
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: floorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseSpecificFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      const InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
    ];

    if (includeFitOut) {
      baseInputs.add(
        InputConfig(
          step: 3,
          name: 'fitOutCondition',
          type: InputFieldType.select,
          label: 'Fitout Condition',
          options: fitOutConditionTypesOptions,
        ),
      );
    }

    baseInputs.addAll([
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ]);

    return baseInputs;
  }

  List<InputConfig> _createPharmaciesUnitInformationInputs(bool includeFitOut) {
    final baseInputs = <InputConfig>[
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: floorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseSpecificFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
    ];

    if (includeFitOut) {
      baseInputs.add(
        InputConfig(
          step: 3,
          name: 'fitOutCondition',
          type: InputFieldType.select,
          label: 'Fitout Condition',
          options: fitOutConditionTypesOptions,
        ),
      );
    }

    baseInputs.addAll([
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ]);

    return baseInputs;
  }

  List<InputConfig> _createShopUnitInformationInputs() {
    return [
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: floorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseSpecificFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'shopActivity',
        type: InputFieldType.text,
        label: 'Activity',
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> _createCommercialAdminBuildingUnitInformationInputs() {
    return [
      const InputConfig(
        step: 3,
        name: 'groundAreaMin',
        type: InputFieldType.number,
        label: 'Ground Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'groundAreaMax',
        type: InputFieldType.number,
        label: 'Ground Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      const InputConfig(
        step: 3,
        name: 'buildingAreaMin',
        type: InputFieldType.number,
        label: 'Building Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'buildingAreaMax',
        type: InputFieldType.number,
        label: 'Building Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'buildingAreaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Building Area Suggestions',
        visibility: () => _isClient(),
      ),
      const InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseSpecificFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'activity',
        type: InputFieldType.select,
        label: 'Activity Status',
        options: activityTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> _createVacationVillasInformationInputs() {
    return [
      const InputConfig(
        step: 3,
        name: 'villageName',
        type: InputFieldType.text,
        label: 'Village Name',
      ),
      InputConfig(
        step: 3,
        name: 'subUnitType',
        type: InputFieldType.select,
        label: 'SubUnit Type',
        options: getSubUnitOptions('vacation_villas'),
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      const InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: purchaseVacationUnitViewTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      const InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> _createChaletsInformationInputs(List<OptionItem>? subUnitOptions) {
    return [
      const InputConfig(
        step: 3,
        name: 'villageName',
        type: InputFieldType.text,
        label: 'Village Name',
      ),
      InputConfig(
        step: 3,
        name: 'subUnitType',
        type: InputFieldType.select,
        label: 'SubUnit Type',
        options: subUnitOptions ?? getSubUnitOptions('chalet'),
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: floorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: purchaseVacationUnitViewTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      const InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: allFurnishingStatusOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> _createPurchaseHouseUnitInformationInputs() {
    return [
      const InputConfig(
        step: 3,
        name: 'groundAreaMin',
        type: InputFieldType.number,
        label: 'Ground Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'groundAreaMax',
        type: InputFieldType.number,
        label: 'Ground Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      const InputConfig(
        step: 3,
        name: 'buildingAreaMin',
        type: InputFieldType.number,
        label: 'Building Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'buildingAreaMax',
        type: InputFieldType.number,
        label: 'Building Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'buildingAreaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Building Area Suggestions',
        visibility: () => _isClient(),
      ),
      const InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      const InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      const InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: otherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> _createPenthouseUnitInformationInputs() {
    return [
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      const InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      const InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: otherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> _createVillaUnitInformationInputs() {
    return [
      const InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => _isClient(),
      ),
      const InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      const InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      const InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: otherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> _createFinancialInputs() {
    return [
      const InputConfig(
        step: 5,
        name: 'averageUnitPriceMin',
        type: InputFieldType.number,
        label: 'Unit Price Min',
      ),
      const InputConfig(
        step: 5,
        name: 'averageUnitPriceMax',
        type: InputFieldType.number,
        label: 'Unit Price Max',
      ),
      InputConfig(
        step: 5,
        name: 'unitPriceSuggestions',
        type: InputFieldType.checkbox,
        label: 'Unit Price Suggestions',
        visibility: () => _isClient(),
      ),
      InputConfig(
        step: 5,
        name: 'paymentMethod',
        type: InputFieldType.select,
        label: 'Payment Methods',
        options: paymentMethodOptions,
      ),
    ];
  }

  List<InputConfig> _createPrimaryInsideCompoundPurchasingConfig({
    required bool includeRooms,
  }) {
    return [
      ..._createPurchaseLocationInputs(),
      ..._createUnitInformationInputs(includeRooms),
      ..._createFinancialInputs(),
    ];
  }

  List<OptionItem> _createResaleInsideCompoundPurchasingChaletsSubUnitOptions() {
    final allOptions = getSubUnitOptions('chalet');
    return allOptions.where((option) => option.value != 'basements' && option.value != 'roofs').toList();
  }

  List<StepperConfiguration> getInputConfigs() {
    return [
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_apartments',
        inputs: _createPrimaryInsideCompoundPurchasingConfig(includeRooms: true),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_duplexes',
        inputs: _createPrimaryInsideCompoundPurchasingConfig(includeRooms: true),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_studios',
        inputs: _createPrimaryInsideCompoundPurchasingConfig(includeRooms: false),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_penthouses',
        inputs: [
          ..._createLocationInputs(),
          ..._createPenthouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_i_villa',
        inputs: [
          ..._createLocationInputs(),
          ..._createVillaUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_twin_houses',
        inputs: [
          ..._createLocationInputs(),
          ..._createPurchaseHouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_town_houses',
        inputs: [
          ..._createLocationInputs(),
          ..._createPurchaseHouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_standalone_villas',
        inputs: [
          ..._createLocationInputs(),
          ..._createPurchaseHouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_administrative_units',
        inputs: [
          ..._createLocationInputs(),
          ..._createCommercialUnitInformationInputs(false),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_medical_clinics',
        inputs: [
          ..._createLocationInputs(),
          ..._createCommercialUnitInformationInputs(false),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_pharmacies',
        inputs: [
          ..._createLocationInputs(),
          ..._createPharmaciesUnitInformationInputs(true),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_commercial_stores',
        inputs: [
          ..._createLocationInputs(),
          ..._createShopUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_commercial_administrative_buildings',
        inputs: [
          ..._createLocationInputs(),
          ..._createCommercialAdminBuildingUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_vacation_villa',
        inputs: [
          ..._createLocationInputs(),
          ..._createVacationVillasInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_purchasing_chalets',
        inputs: [
          ..._createLocationInputs(),
          ..._createChaletsInformationInputs(null),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_apartments',
        inputs: [
          ..._createLocationInputs(),
          ..._createUnitInformationInputs(true),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_duplexes',
        inputs: [
          ..._createLocationInputs(),
          ..._createUnitInformationInputs(true),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_studios',
        inputs: [
          ..._createLocationInputs(),
          ..._createUnitInformationInputs(false),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_penthouses',
        inputs: [
          ..._createLocationInputs(),
          ..._createPenthouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_i_villa',
        inputs: [
          ..._createLocationInputs(),
          ..._createVillaUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_twin_houses',
        inputs: [
          ..._createLocationInputs(),
          ..._createPurchaseHouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_town_houses',
        inputs: [
          ..._createLocationInputs(),
          ..._createPurchaseHouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_standalone_villas',
        inputs: [
          ..._createLocationInputs(),
          ..._createPurchaseHouseUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_administrative_units',
        inputs: [
          ..._createLocationInputs(),
          ..._createCommercialUnitInformationInputs(false),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_medical_clinics',
        inputs: [
          ..._createLocationInputs(),
          ..._createCommercialUnitInformationInputs(false),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_pharmacies',
        inputs: [
          ..._createLocationInputs(),
          ..._createPharmaciesUnitInformationInputs(false),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_commercial_stores',
        inputs: [
          ..._createLocationInputs(),
          ..._createShopUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_commercial_administrative_buildings',
        inputs: [
          ..._createLocationInputs(),
          ..._createCommercialAdminBuildingUnitInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_vacation_villa',
        inputs: [
          ..._createLocationInputs(),
          ..._createVacationVillasInformationInputs(),
          ..._createFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_purchasing_chalets',
        inputs: [
          ..._createLocationInputs(),
          ..._createChaletsInformationInputs(_createResaleInsideCompoundPurchasingChaletsSubUnitOptions()),
          ..._createFinancialInputs(),
        ],
      ),
    ];
  }

  List<String> getConfigurationKeys() {
    return [
      'primary_inside_compound_purchasing_apartments',
      'primary_inside_compound_purchasing_duplexes',
      'primary_inside_compound_purchasing_studios',
      'primary_inside_compound_purchasing_penthouses',
      'primary_inside_compound_purchasing_i_villa',
      'primary_inside_compound_purchasing_twin_houses',
      'primary_inside_compound_purchasing_town_houses',
      'primary_inside_compound_purchasing_standalone_villas',
      'primary_inside_compound_purchasing_administrative_units',
      'primary_inside_compound_purchasing_medical_clinics',
      'primary_inside_compound_purchasing_pharmacies',
      'primary_inside_compound_purchasing_commercial_stores',
      'primary_inside_compound_purchasing_commercial_administrative_buildings',
      'primary_inside_compound_purchasing_vacation_villa',
      'primary_inside_compound_purchasing_chalets',
      'resale_inside_compound_purchasing_apartments',
      'resale_inside_compound_purchasing_duplexes',
      'resale_inside_compound_purchasing_studios',
      'resale_inside_compound_purchasing_penthouses',
      'resale_inside_compound_purchasing_i_villa',
      'resale_inside_compound_purchasing_twin_houses',
      'resale_inside_compound_purchasing_town_houses',
      'resale_inside_compound_purchasing_standalone_villas',
      'resale_inside_compound_purchasing_administrative_units',
      'resale_inside_compound_purchasing_medical_clinics',
      'resale_inside_compound_purchasing_pharmacies',
      'resale_inside_compound_purchasing_commercial_stores',
      'resale_inside_compound_purchasing_commercial_administrative_buildings',
      'resale_inside_compound_purchasing_vacation_villa',
      'resale_inside_compound_purchasing_chalets',
    ];
  }
}
