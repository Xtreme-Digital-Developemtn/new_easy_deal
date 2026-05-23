import 'input_config_model.dart';
import 'stepper_constants.dart';

class BaseConfigService {
  List<StepperConfiguration> getInputConfigs() => [];

  bool hasConfiguration(String key) {
    return getInputConfigs().any((config) => config.key == key);
  }

  List<InputConfig> getInputsForKey(String key) {
    final configs = getInputConfigs();
    for (final config in configs) {
      if (config.key == key) {
        return config.inputs;
      }
    }
    return [];
  }

  List<InputConfig> createLocationInputs() {
    return [
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> _createBaseUnitInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Unit Area Min',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Unit Area Max',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: floorTypesOptions,
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: specificRentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseSpecificFinishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: purchaseDeliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: otherAccessoriesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
        visibility: () => true,
      ),
    ]);

    return inputs;
  }

  List<InputConfig> createUnitInformationInputs({bool includeRooms = true}) {
    return _createBaseUnitInputs(includeRooms: includeRooms);
  }

  List<InputConfig> createPenthouseUnitInformationInputs() {
    return createUnitInformationInputs()
        .where((input) => input.name != 'floor')
        .toList();
  }

  List<InputConfig> createVillaUnitInformationInputs() {
    final inputs = createUnitInformationInputs();
    inputs.add(InputConfig(
      step: 3,
      name: 'numberOfFloors',
      type: InputFieldType.number,
      label: 'Number of Floors',
      visibility: () => true,
    ));
    return inputs;
  }

  List<InputConfig> createHouseUnitInformationInputs() {
    final inputs = createUnitInformationInputs();
    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'buildingAreaMin',
        type: InputFieldType.number,
        label: 'Building Area Min',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingAreaMax',
        type: InputFieldType.number,
        label: 'Building Area Max',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingAreaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Building Area Suggestions',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
        visibility: () => true,
      ),
    ]);
    return inputs;
  }

  List<InputConfig> createCommercialUnitInformationInputs({
    bool includeFitOut = false,
  }) {
    final inputs = createUnitInformationInputs();
    if (includeFitOut) {
      inputs.add(InputConfig(
        step: 3,
        name: 'fitOutCondition',
        type: InputFieldType.select,
        label: 'Fit Out Condition',
        options: fitOutConditionTypesOptions,
        visibility: () => true,
      ));
    }
    return inputs;
  }

  List<InputConfig> createShopUnitInformationInputs() {
    final inputs = createUnitInformationInputs();
    inputs.add(InputConfig(
      step: 3,
      name: 'activity',
      type: InputFieldType.select,
      label: 'Activity',
      options: activityTypesOptions,
      visibility: () => true,
    ));
    return inputs;
  }

  List<InputConfig> createCommercialAdminBuildingUnitInformationInputs() {
    return [
      InputConfig(
        step: 3,
        name: 'groundAreaMin',
        type: InputFieldType.number,
        label: 'Ground Area Min',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'groundAreaMax',
        type: InputFieldType.number,
        label: 'Ground Area Max',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingAreaMin',
        type: InputFieldType.number,
        label: 'Building Area Min',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingAreaMax',
        type: InputFieldType.number,
        label: 'Building Area Max',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'activity',
        type: InputFieldType.select,
        label: 'Activity',
        options: activityTypesOptions,
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createFinancialInputs() {
    return [
      InputConfig(
        step: 5,
        name: 'averageUnitPriceMin',
        type: InputFieldType.number,
        label: 'Average Unit Price Min',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'averageUnitPriceMax',
        type: InputFieldType.number,
        label: 'Average Unit Price Max',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'unitPriceSuggestions',
        type: InputFieldType.checkbox,
        label: 'Unit Price Suggestions',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'paymentMethod',
        type: InputFieldType.select,
        label: 'Payment Method',
        options: paymentMethodOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'cashPrice',
        type: InputFieldType.number,
        label: 'Cash Price',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'installmentPrice',
        type: InputFieldType.number,
        label: 'Installment Price',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createDocumentInputs() {
    return [
      InputConfig(
        step: 4,
        name: 'mainImage',
        type: InputFieldType.file,
        label: 'Main Image',
        visibility: () => true,
      ),
      InputConfig(
        step: 4,
        name: 'galleryImages',
        type: InputFieldType.file,
        label: 'Gallery Images',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> getDefaultInputsForStep(int step) {
    switch (step) {
      case 2:
        return createLocationInputs();
      default:
        return [];
    }
  }
}
