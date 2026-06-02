import 'input_config_model.dart';
import 'stepper_constants.dart';

class SellConfigService {
  List<InputConfig> createSellLocationInputs() {
    return [
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Compound Name',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'detailedAddress',
        type: InputFieldType.text,
        label: 'Detailed Address',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'addressLink',
        type: InputFieldType.url,
        label: 'Detailed Address Link',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'projectManagement',
        type: InputFieldType.text,
        label: 'Project Management',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'projectConstructor',
        type: InputFieldType.text,
        label: 'Project Constructor',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
        options: [],
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
        options: [],
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
        options: [],
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'mallName',
        type: InputFieldType.text,
        label: 'Mall Name',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createSellResaleLocationInputs() {
    return [
      InputConfig(
        step: 2,
        name: 'mallName',
        type: InputFieldType.text,
        label: 'Mall Name',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Compound Name',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'detailedAddress',
        type: InputFieldType.text,
        label: 'Detailed Address',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'addressLink',
        type: InputFieldType.url,
        label: 'Detailed Address Link',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'projectManagement',
        type: InputFieldType.text,
        label: 'Project Management',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'projectConstructor',
        type: InputFieldType.text,
        label: 'Project Constructor',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
        options: [],
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
        options: [],
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
        options: [],
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createSellResaleLocationInputsWithoutMall() {
    return [
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Compound Name',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'detailedAddress',
        type: InputFieldType.text,
        label: 'Detailed Address',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'addressLink',
        type: InputFieldType.url,
        label: 'Detailed Address Link',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'projectManagement',
        type: InputFieldType.text,
        label: 'Project Management',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'projectConstructor',
        type: InputFieldType.text,
        label: 'Project Constructor',
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
        options: [],
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
        options: [],
        visibility: () => true,
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
        options: [],
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createSellApartmentUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: insideCompoundOtherAccessoriesOptions,
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

  List<InputConfig> createSellDuplexUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'gardenArea',
        type: InputFieldType.number,
        label: 'Garden Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: otherAccessoriesOptions.where((o) => o.value != 'garage').toList(),
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

  List<InputConfig> createSellStudiosUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: insideCompoundOtherAccessoriesOptions,
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

  List<InputConfig> createSellVillasUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'gardenArea',
        type: InputFieldType.number,
        label: 'Garden Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'terraceArea',
        type: InputFieldType.number,
        label: 'Terrace Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: insideCompoundOtherAccessoriesOptions,
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

  List<InputConfig> createSellTwinHousesUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'groundArea',
        type: InputFieldType.number,
        label: 'Ground Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingArea',
        type: InputFieldType.number,
        label: 'Building Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: insideCompoundOtherAccessoriesOptions,
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

  List<InputConfig> createSellStandaloneVillasUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'groundArea',
        type: InputFieldType.number,
        label: 'Ground Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingArea',
        type: InputFieldType.number,
        label: 'Building Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: insideCompoundOtherAccessoriesOptions,
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

  List<InputConfig> createSellPenthousesUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'terraceArea',
        type: InputFieldType.number,
        label: 'Terrace Area (m²)',
        visibility: () => true,
      ),
    ];

    if (includeRooms) {
      inputs.addAll([
        InputConfig(
          step: 3,
          name: 'rooms',
          type: InputFieldType.number,
          label: 'Number of Rooms',
          visibility: () => true,
        ),
        InputConfig(
          step: 3,
          name: 'bathRooms',
          type: InputFieldType.number,
          label: 'Number of Bathrooms',
          visibility: () => true,
        ),
      ]);
    }

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: insideCompoundOtherAccessoriesOptions,
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

  List<InputConfig> createSellAdministrativeUnitsUnitInformationInputs() {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
        visibility: () => true,
      ),
    ];

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
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

  List<InputConfig> createSellShopsInformationInputs() {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
        visibility: () => true,
      ),
    ];

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'shopActivity',
        type: InputFieldType.text,
        label: 'Activity',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: specificFinishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'fitOutCondition',
        type: InputFieldType.select,
        label: 'Fitout Condition',
        options: sellFitOutConditionTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
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

  List<InputConfig> createSellPharmacyUnitInformationInputs() {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
        isDynamic: true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
        visibility: () => true,
      ),
    ];

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: specificFinishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'fitOutCondition',
        type: InputFieldType.select,
        label: 'Fitout Condition',
        options: sellFitOutConditionTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
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

  List<InputConfig> createSellCommercialAdministrativeBuildingsInformationInputs() {
    final inputs = <InputConfig>[
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'groundArea',
        type: InputFieldType.number,
        label: 'Ground Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingArea',
        type: InputFieldType.number,
        label: 'Building Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
        visibility: () => true,
      ),
    ];

    inputs.addAll([
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: rentalUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: specificFinishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingLayoutStatus',
        type: InputFieldType.select,
        label: 'Building Layout Status',
        options: buildingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
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
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: purchaseOtherAccessoriesOptions,
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

  List<InputConfig> createSellVacationVillasInformationInputs({List<OptionItem> Function()? subUnitOptions}) {
    return [
      InputConfig(
        step: 3,
        name: 'villageName',
        type: InputFieldType.text,
        label: 'Village Name',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'subUnitType',
        type: InputFieldType.select,
        label: 'SubUnit Type',
        options: subUnitOptions != null ? subUnitOptions() : [],
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'landArea',
        type: InputFieldType.number,
        label: 'LAND_AREA',
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
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: sellVacationUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: finishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: specificOtherAccessoriesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createSellChaletsInformationInputs({bool includeRooms = true, List<OptionItem> Function()? subUnitOptions}) {
    return [
      InputConfig(
        step: 3,
        name: 'villageName',
        type: InputFieldType.text,
        label: 'Village Name',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'subUnitType',
        type: InputFieldType.select,
        label: 'SubUnit Type',
        options: subUnitOptions != null ? subUnitOptions() : [],
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'View',
        options: sellVacationUnitViewTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'unitFacing',
        type: InputFieldType.select,
        label: 'Unit Facing',
        options: unitFacingTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: allRentalFinishingStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryStatus',
        type: InputFieldType.select,
        label: 'Delivery Status',
        options: deliveryStatusTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'deliveryDate',
        type: InputFieldType.date,
        label: 'Delivery Date',
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'financialStatus',
        type: InputFieldType.select,
        label: 'Financial Status',
        options: financialStatusSellTypesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Other Accessories',
        options: specificOtherAccessoriesOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createSellDocumentInputs() {
    return [
      InputConfig(
        step: 4,
        name: 'mainImage',
        type: InputFieldType.file,
        label: 'Unit Main Image',
        visibility: () => true,
      ),
      InputConfig(
        step: 4,
        name: 'unitInMasterPlanImage',
        type: InputFieldType.file,
        label: 'Unit in Master Plan Image',
        visibility: () => true,
      ),
      InputConfig(
        step: 4,
        name: 'galleryImages',
        type: InputFieldType.file,
        label: 'Unit Gallery Images',
        visibility: () => true,
      ),
      InputConfig(
        step: 4,
        name: 'video',
        type: InputFieldType.file,
        label: 'Videos',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createSellFinancialInputs() {
    return [
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
        name: 'unitPriceSuggestions',
        type: InputFieldType.checkbox,
        label: 'Price Suggestions',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'cashPrice',
        type: InputFieldType.number,
        label: 'cash_price',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'installmentPrice',
        type: InputFieldType.number,
        label: 'installment_price',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'requestedOver',
        type: InputFieldType.number,
        label: 'Request Over',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createSellPrimaryFinancialInputs() {
    return [
      InputConfig(
        step: 5,
        name: 'paymentMethod',
        type: InputFieldType.select,
        label: 'Payment Method',
        options: paymentMethodPrimarySellOptions,
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'unitPriceSuggestions',
        type: InputFieldType.checkbox,
        label: 'Price Suggestions',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'cashPrice',
        type: InputFieldType.number,
        label: 'cash_price',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'installmentPrice',
        type: InputFieldType.number,
        label: 'installment_price',
        visibility: () => true,
      ),
      InputConfig(
        step: 5,
        name: 'requestedOver',
        type: InputFieldType.number,
        label: 'Request Over',
        visibility: () => true,
      ),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundSellApartmentsConfig(String configKey) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellApartmentUnitInformationInputs(includeRooms: true),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createInsideCompoundSellDuplexesConfig(String configKey, {bool includeRooms = true}) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellDuplexUnitInformationInputs(includeRooms: includeRooms),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createInsideCompoundSellStudiosConfig(String configKey, {bool includeRooms = true}) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellStudiosUnitInformationInputs(includeRooms: includeRooms),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createInsideCompoundSellVillasConfig(String configKey) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellVillasUnitInformationInputs(includeRooms: true),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundPurchasingTwinHousesConfig(String configKey) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellResaleLocationInputs()),
      ...createSellTwinHousesUnitInformationInputs(includeRooms: true),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createResaleInsideCompoundSellStandaloneVillasConfig(String configKey) {
    return [
      ...createSellResaleLocationInputsWithoutMall(),
      ...createSellStandaloneVillasUnitInformationInputs(includeRooms: true),
      ...createSellDocumentInputs(),
      ...createSellFinancialInputs(),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundPurchasingPenthouses(String configKey) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellPenthousesUnitInformationInputs(includeRooms: true),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createResaleInsideCompoundSellTwinHousesConfig() {
    return [
      ...createSellResaleLocationInputsWithoutMall(),
      ...createSellTwinHousesUnitInformationInputs(includeRooms: true),
      ...createSellDocumentInputs(),
      ...createSellFinancialInputs(),
    ];
  }

  List<InputConfig> createResaleInsideCompoundSellTownHousesConfig() {
    return [
      ...createSellResaleLocationInputsWithoutMall(),
      ...createSellTwinHousesUnitInformationInputs(includeRooms: true),
      ...createSellDocumentInputs(),
      ...createSellFinancialInputs(),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundPurchasingAdministrativeUnits() {
    return [
      ...createSellLocationInputs(),
      ...createSellAdministrativeUnitsUnitInformationInputs(),
      ...createSellDocumentInputs(),
      ...createSellPrimaryFinancialInputs(),
    ];
  }

  List<InputConfig> createResaleInsideCompoundPurchasingAdministrativeUnits() {
    return [
      ...createSellResaleLocationInputs(),
      ...createSellAdministrativeUnitsUnitInformationInputs(),
      ...createSellDocumentInputs(),
      ...createSellFinancialInputs(),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundPurchasingShops() {
    return [
      ...createSellLocationInputs(),
      ...createSellShopsInformationInputs(),
      ...createSellDocumentInputs(),
      ...createSellPrimaryFinancialInputs(),
    ];
  }

  List<InputConfig> createResaleInsideCompoundPurchasingShops() {
    return [
      ...createSellResaleLocationInputs(),
      ...createSellShopsInformationInputs(),
      ...createSellDocumentInputs(),
      ...createSellFinancialInputs(),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundPurchasingPharmacy() {
    return [
      ...createSellLocationInputs(),
      ...createSellPharmacyUnitInformationInputs(),
      ...createSellDocumentInputs(),
      ...createSellPrimaryFinancialInputs(),
    ];
  }

  List<InputConfig> createResaleInsideCompoundPurchasingPharmacy() {
    return [
      ...createSellResaleLocationInputs(),
      ...createSellPharmacyUnitInformationInputs(),
      ...createSellDocumentInputs(),
      ...createSellFinancialInputs(),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundPurchasingCommercialAdministrativeBuildings(String configKey) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellCommercialAdministrativeBuildingsInformationInputs(),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundSellVacationVillas(String configKey, {List<OptionItem> Function()? subUnitOptions}) {
    final isResale = configKey.contains('resale');
    final compound = configKey.contains('inside');
    return [
      ...(isResale && compound
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellVacationVillasInformationInputs(subUnitOptions: subUnitOptions),
      ...createSellDocumentInputs(),
      ...(isResale ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<InputConfig> createPrimaryInsideCompoundSellChalets(String configKey, {List<OptionItem> Function()? subUnitOptions}) {
    return [
      ...(configKey.contains('resale') && configKey.contains('inside')
          ? createSellResaleLocationInputsWithoutMall()
          : createSellLocationInputs()),
      ...createSellChaletsInformationInputs(includeRooms: true, subUnitOptions: subUnitOptions),
      ...createSellDocumentInputs(),
      ...(configKey.contains('resale') ? createSellFinancialInputs() : createSellPrimaryFinancialInputs()),
    ];
  }

  List<StepperConfiguration> getInputConfigs() {
    return [
      StepperConfiguration(
        key: 'primary_inside_compound_sell_apartments',
        inputs: createPrimaryInsideCompoundSellApartmentsConfig('primary_inside_compound_sell_apartments'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_apartments',
        inputs: createPrimaryInsideCompoundSellApartmentsConfig('resale_inside_compound_sell_apartments'),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_duplexes',
        inputs: createInsideCompoundSellDuplexesConfig('primary_inside_compound_sell_duplexes'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_duplexes',
        inputs: createInsideCompoundSellDuplexesConfig('resale_inside_compound_sell_duplexes'),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_studios',
        inputs: createInsideCompoundSellStudiosConfig('primary_inside_compound_sell_studios', includeRooms: false),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_studios',
        inputs: createInsideCompoundSellStudiosConfig('resale_inside_compound_sell_studios', includeRooms: false),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_i_villa',
        inputs: createInsideCompoundSellVillasConfig('primary_inside_compound_sell_i_villa'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_i_villa',
        inputs: createInsideCompoundSellVillasConfig('resale_inside_compound_sell_i_villa'),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_administrative_units',
        inputs: createPrimaryInsideCompoundPurchasingAdministrativeUnits(),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_administrative_units',
        inputs: createResaleInsideCompoundPurchasingAdministrativeUnits(),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_medical_clinics',
        inputs: createPrimaryInsideCompoundPurchasingAdministrativeUnits(),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_medical_clinics',
        inputs: createResaleInsideCompoundPurchasingAdministrativeUnits(),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_pharmacies',
        inputs: createPrimaryInsideCompoundPurchasingPharmacy(),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_pharmacies',
        inputs: createResaleInsideCompoundPurchasingPharmacy(),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_commercial_stores',
        inputs: createPrimaryInsideCompoundPurchasingShops(),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_commercial_stores',
        inputs: createResaleInsideCompoundPurchasingShops(),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_twin_houses',
        inputs: createPrimaryInsideCompoundPurchasingTwinHousesConfig('primary_inside_compound_sell_twin_houses'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_twin_houses',
        inputs: createResaleInsideCompoundSellTwinHousesConfig(),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_town_houses',
        inputs: createPrimaryInsideCompoundPurchasingTwinHousesConfig('primary_inside_compound_sell_town_houses'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_town_houses',
        inputs: createResaleInsideCompoundSellTownHousesConfig(),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_standalone_villas',
        inputs: createPrimaryInsideCompoundPurchasingTwinHousesConfig('primary_inside_compound_sell_standalone_villas'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_standalone_villas',
        inputs: createResaleInsideCompoundSellStandaloneVillasConfig('resale_inside_compound_sell_standalone_villas'),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_penthouses',
        inputs: createPrimaryInsideCompoundPurchasingPenthouses('primary_inside_compound_sell_penthouses'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_penthouses',
        inputs: createPrimaryInsideCompoundPurchasingPenthouses('resale_inside_compound_sell_penthouses'),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_commercial_administrative_buildings',
        inputs: createPrimaryInsideCompoundPurchasingCommercialAdministrativeBuildings('primary_inside_compound_sell_commercial_administrative_buildings'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_commercial_administrative_buildings',
        inputs: createPrimaryInsideCompoundPurchasingCommercialAdministrativeBuildings('resale_inside_compound_sell_commercial_administrative_buildings'),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_vacation_villa',
        inputs: createPrimaryInsideCompoundSellVacationVillas('primary_inside_compound_sell_vacation_villa'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_vacation_villa',
        inputs: createPrimaryInsideCompoundSellVacationVillas('resale_inside_compound_sell_vacation_villa'),
      ),
      StepperConfiguration(
        key: 'primary_inside_compound_sell_chalets',
        inputs: createPrimaryInsideCompoundSellChalets('primary_inside_compound_sell_chalets'),
      ),
      StepperConfiguration(
        key: 'resale_inside_compound_sell_chalets',
        inputs: createPrimaryInsideCompoundSellChalets('resale_inside_compound_sell_chalets'),
      ),
    ];
  }
}
