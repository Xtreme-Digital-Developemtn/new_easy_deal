import 'input_config_model.dart';
import 'stepper_constants.dart';

class SellOutsideCompoundConfigService {
  List<StepperConfiguration> getInputConfigs() {
    return [
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_apartments',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundApartmentsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_duplexes',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundDuplexesUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_studios',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundStudiosUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_penthouses',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundPenthousesUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_basements',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundBasementsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_roofs',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundRoofsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_villas',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundStandaloneVillasUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_residential_buildings',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundStandaloneVillasUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_administrative_units',
        inputs: [
          ..._createSellOutsideCompoundMallLocationInputs(),
          ..._createSellOutsideCompoundAdministrativeUnitsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundMallFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_medical_clinics',
        inputs: [
          ..._createSellOutsideCompoundMallLocationInputs(),
          ..._createSellOutsideCompoundMedicalClinicsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundMallFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_pharmacies',
        inputs: [
          ..._createSellOutsideCompoundMallLocationInputs(),
          ..._createSellOutsideCompoundPharmaciesUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundMallFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_commercial_stores',
        inputs: [
          ..._createSellOutsideCompoundMallLocationInputs(),
          ..._createSellOutsideCompoundCommercialStoresUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundMallFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_factory_lands',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundFactoryLandsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundIndustrialFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_warehouse_lands',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundWarehousesUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundIndustrialFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_commercial_administrative_buildings',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundCommercialAdministrativeBuildingsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundIndustrialFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_commercial_administrative_lands',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundCommercialAdministrativeLandUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundIndustrialFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_residential_lands',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundResidentialBuildingsUnitInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundIndustrialFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_vacation_villa',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundVacationVillasInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundIndustrialFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_sell_chalets',
        inputs: [
          ..._createSellOutsideCompoundLocationInputs(),
          ..._createSellOutsideCompoundChaletsInformationInputs(),
          ..._createSellOutsideCompoundMediaInputs(),
          ..._createSellOutsideCompoundIndustrialFinancialInputs(),
        ],
      ),
    ];
  }

  List<String> getSellOutsideCompoundConfigurationKeys() {
    return [
      'purchase_sell_outside_compound_sell_apartments',
      'purchase_sell_outside_compound_sell_duplexes',
      'purchase_sell_outside_compound_sell_studios',
      'purchase_sell_outside_compound_sell_penthouses',
      'purchase_sell_outside_compound_sell_basements',
      'purchase_sell_outside_compound_sell_roofs',
      'purchase_sell_outside_compound_sell_villas',
      'purchase_sell_outside_compound_sell_administrative_units',
      'purchase_sell_outside_compound_sell_medical_clinics',
      'purchase_sell_outside_compound_sell_pharmacies',
      'purchase_sell_outside_compound_sell_commercial_stores',
      'purchase_sell_outside_compound_sell_factory_lands',
      'purchase_sell_outside_compound_sell_warehouse_lands',
      'purchase_sell_outside_compound_sell_vacation_villa',
      'purchase_sell_outside_compound_sell_chalets',
      'purchase_sell_outside_compound_sell_residential_buildings',
      'purchase_sell_outside_compound_sell_residential_lands',
      'purchase_sell_outside_compound_sell_commercial_administrative_lands',
      'purchase_sell_outside_compound_sell_commercial_administrative_buildings',
    ];
  }

  bool isSellOutsideCompoundConfiguration(String key) {
    return key.contains('purchase_sell_outside_compound_sell_');
  }

  List<InputConfig> _createSellOutsideCompoundLocationInputs() {
    return [
      const InputConfig(step: 2, name: 'cityId', type: InputFieldType.select, label: 'City'),
      const InputConfig(step: 2, name: 'areaId', type: InputFieldType.select, label: 'Area'),
      const InputConfig(step: 2, name: 'subAreaId', type: InputFieldType.select, label: 'Sub Area'),
      const InputConfig(step: 2, name: 'detailedAddress', type: InputFieldType.text, label: 'Detailed Address'),
      const InputConfig(step: 2, name: 'addressLink', type: InputFieldType.url, label: 'Address Link'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundMallLocationInputs() {
    return [
      const InputConfig(step: 2, name: 'cityId', type: InputFieldType.select, label: 'City'),
      const InputConfig(step: 2, name: 'areaId', type: InputFieldType.select, label: 'Area'),
      const InputConfig(step: 2, name: 'subAreaId', type: InputFieldType.select, label: 'Sub Area'),
      const InputConfig(step: 2, name: 'mallName', type: InputFieldType.text, label: 'Mall Name'),
      const InputConfig(step: 2, name: 'detailedAddress', type: InputFieldType.text, label: 'Detailed Address'),
      const InputConfig(step: 2, name: 'addressLink', type: InputFieldType.url, label: 'Address Link'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundApartmentsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundDuplexesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'gardenArea', type: InputFieldType.number, label: 'Garden Area (m²)'),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundStudiosUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundPenthousesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'terraceArea', type: InputFieldType.number, label: 'Terrace Area (m²)'),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundBasementsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitLayoutStatus', type: InputFieldType.select, label: 'Unit Layout Status', options: basementUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundRoofsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitLayoutStatus', type: InputFieldType.select, label: 'Unit Layout Status', options: sellRoofUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: basementUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundStandaloneVillasUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'unitDesign', type: InputFieldType.select, label: 'Unit Design', options: sellUnitDesignTypesOptions),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Unit Description', options: sellVillaUnitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: buildingStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundAdministrativeUnitsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundMedicalClinicsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundPharmaciesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: specificFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: sellFitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundCommercialStoresUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: specificFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundFactoryLandsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building / Land Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: sellOutBuildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Land Description', options: sellUnitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: sellFitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundWarehousesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building / Land Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: sellOutBuildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Land Description', options: sellUnitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: sellFitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundCommercialAdministrativeBuildingsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: sellOutAdministrativeBuildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingLicense', type: InputFieldType.select, label: 'Building License', options: buildingLicenseTypesOptions),
      const InputConfig(step: 3, name: 'buildingDeadline', type: InputFieldType.select, label: 'Building Deadline', options: buildingDeadlineTypesOptions),
      const InputConfig(step: 3, name: 'activity', type: InputFieldType.select, label: 'Activity', options: activityTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: specificFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Land Description', options: sellUnitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundCommercialAdministrativeLandUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: landOutBuildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingLicense', type: InputFieldType.select, label: 'Building License', options: buildingLicenseTypesOptions),
      const InputConfig(step: 3, name: 'buildingDeadline', type: InputFieldType.select, label: 'Building Deadline', options: buildingDeadlineTypesOptions),
      const InputConfig(step: 3, name: 'activity', type: InputFieldType.select, label: 'Activity', options: activityTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: specificFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Land Description', options: sellUnitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundResidentialBuildingsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: landOutBuildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingLicense', type: InputFieldType.select, label: 'Building License', options: buildingLicenseTypesOptions),
      const InputConfig(step: 3, name: 'buildingDeadline', type: InputFieldType.select, label: 'Building Deadline', options: buildingDeadlineTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Land View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Land Description', options: sellUnitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: landDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundVacationVillasInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'villageName', type: InputFieldType.text, label: 'Village Name'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: sellVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: specificOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundChaletsInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'villageName', type: InputFieldType.text, label: 'Village Name'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: sellVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: deliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryDate', type: InputFieldType.date, label: 'Delivery Date'),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'legalStatus', type: InputFieldType.select, label: 'Legal Status', options: legalStatusTypesOptions),
      const InputConfig(step: 3, name: 'gardenArea', type: InputFieldType.number, label: 'Garden Area (m²)'),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: otherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundMediaInputs() {
    return [
      const InputConfig(step: 4, name: 'mainImage', type: InputFieldType.file, label: 'Main Image'),
      const InputConfig(step: 4, name: 'unitInMasterPlanImage', type: InputFieldType.file, label: 'Unit in Master Plan Image'),
      const InputConfig(step: 4, name: 'galleryImages', type: InputFieldType.file, label: 'Gallery Images'),
      const InputConfig(step: 4, name: 'video', type: InputFieldType.file, label: 'Video'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'paymentMethod', type: InputFieldType.select, label: 'Payment Method', options: paymentMethodOptions),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Unit Price Suggestions'),
      const InputConfig(step: 5, name: 'cashPrice', type: InputFieldType.number, label: 'cash_price'),
      const InputConfig(step: 5, name: 'installmentPrice', type: InputFieldType.number, label: 'installment_price'),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundMallFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'paymentMethod', type: InputFieldType.select, label: 'Payment Method', options: paymentMethodOptions),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Unit Price Suggestions'),
      const InputConfig(step: 5, name: 'cashPrice', type: InputFieldType.number, label: 'cash_price'),
      const InputConfig(step: 5, name: 'installmentPrice', type: InputFieldType.number, label: 'installment_price'),
      const InputConfig(step: 5, name: 'financialStatus', type: InputFieldType.select, label: 'Financial Status', options: financialStatusSellTypesOptions),
    ];
  }

  List<InputConfig> _createSellOutsideCompoundIndustrialFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'paymentMethod', type: InputFieldType.select, label: 'Payment Method', options: paymentMethodOptions),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Unit Price Suggestions'),
      const InputConfig(step: 5, name: 'cashPrice', type: InputFieldType.number, label: 'cash_price'),
      const InputConfig(step: 5, name: 'installmentPrice', type: InputFieldType.number, label: 'installment_price'),
      const InputConfig(step: 5, name: 'financialStatus', type: InputFieldType.select, label: 'Financial Status', options: financialStatusSellTypesOptions),
    ];
  }
}
