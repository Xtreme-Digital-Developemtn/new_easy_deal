import 'input_config_model.dart';
import 'stepper_constants.dart';

class PurchaseOutsideCompoundConfigService {
  List<StepperConfiguration> getInputConfigs() {
    return [
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_apartments',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundApartmentsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_duplexes',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundDuplexesUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_studios',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundStudiosUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_penthouses',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundPenthousesUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_basements',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundBasementsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_roofs',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundRoofsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_villas',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundStandaloneVillasUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_administrative_units',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundAdministrativeUnitsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_medical_clinics',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundMedicalClinicsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_pharmacies',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundPharmaciesUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_commercial_stores',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundCommercialStoresUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_factory_lands',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundFactoryLandsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_warehouse_lands',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundWarehousesUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_residential_buildings',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundResidentialBuildingsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_residential_lands',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundResidentialLandsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
          const InputConfig(step: 4, name: 'financialStatus', type: InputFieldType.select, label: 'Financial Status', options: financialStatusTypesOptions),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_commercial_administrative_buildings',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundCommercialAdministrativeBuildingsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_commercial_administrative_lands',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundCommercialAdministrativeLandsUnitInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
          const InputConfig(step: 4, name: 'financialStatus', type: InputFieldType.select, label: 'Financial Status', options: financialStatusTypesOptions),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_vacation_villa',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundVacationVillasInformationInputs(),
          ..._createPurchaseOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'purchase_sell_outside_compound_purchasing_chalets',
        inputs: [
          ..._createPurchaseOutsideCompoundLocationInputs(),
          ..._createPurchaseOutsideCompoundChaletsInformationInputs(),
          ..._createPurchaseOutsideCompoundChaletsFinancialInputs(),
        ],
      ),
    ];
  }

  List<String> getPurchaseOutsideCompoundConfigurationKeys() {
    return [
      'purchase_sell_outside_compound_purchasing_apartments',
      'purchase_sell_outside_compound_purchasing_duplexes',
      'purchase_sell_outside_compound_purchasing_studios',
      'purchase_sell_outside_compound_purchasing_penthouses',
      'purchase_sell_outside_compound_purchasing_basements',
      'purchase_sell_outside_compound_purchasing_roofs',
      'purchase_sell_outside_compound_purchasing_villas',
      'purchase_sell_outside_compound_purchasing_administrative_units',
      'purchase_sell_outside_compound_purchasing_medical_clinics',
      'purchase_sell_outside_compound_purchasing_pharmacies',
      'purchase_sell_outside_compound_purchasing_commercial_stores',
      'purchase_sell_outside_compound_purchasing_factory_lands',
      'purchase_sell_outside_compound_purchasing_warehouse_lands',
      'purchase_sell_outside_compound_purchasing_residential_buildings',
      'purchase_sell_outside_compound_purchasing_residential_lands',
      'purchase_sell_outside_compound_purchasing_commercial_administrative_buildings',
      'purchase_sell_outside_compound_purchasing_commercial_administrative_lands',
      'purchase_sell_outside_compound_purchasing_vacation_villa',
      'purchase_sell_outside_compound_purchasing_chalets',
    ];
  }

  bool isPurchaseOutsideCompoundConfiguration(String key) {
    return key.contains('purchase_sell_outside_compound_purchasing_');
  }

  // ============================================================================
  // LOCATION INPUTS
  // ============================================================================

  List<InputConfig> _createPurchaseOutsideCompoundLocationInputs() {
    return [
      const InputConfig(step: 2, name: 'locationSuggestions', type: InputFieldType.checkbox, label: 'Location Suggestion'),
    ];
  }

  // ============================================================================
  // UNIT INFORMATION INPUTS
  // ============================================================================

  List<InputConfig> _createPurchaseOutsideCompoundApartmentsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Bedrooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundDuplexesUnitInformationInputs() {
    return _createPurchaseOutsideCompoundApartmentsUnitInformationInputs();
  }

  List<InputConfig> _createPurchaseOutsideCompoundStudiosUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundPenthousesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Bedrooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundBasementsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'unitStatus', type: InputFieldType.select, label: 'Unit Status', options: basementUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Bedrooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundRoofsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'unitStatus', type: InputFieldType.select, label: 'Unit Status', options: purchaseRoofUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: buildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Bedrooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Bathrooms'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundStandaloneVillasUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Ground Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Ground Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Building Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Building Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaSuggestions', type: InputFieldType.checkbox, label: 'Building Area Suggestions'),
      const InputConfig(step: 3, name: 'unitDesign', type: InputFieldType.select, label: 'Unit Design', options: unitDesignTypesOptions),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: purchaseBuildingStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundAdministrativeUnitsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: pharmacySellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundMedicalClinicsUnitInformationInputs() {
    return _createPurchaseOutsideCompoundAdministrativeUnitsUnitInformationInputs();
  }

  List<InputConfig> _createPurchaseOutsideCompoundPharmaciesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseSpecificFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: fitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: pharmacySellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundCommercialStoresUnitInformationInputs() {
    return _createPurchaseOutsideCompoundCommercialStoreInputs();
  }

  List<InputConfig> _createPurchaseOutsideCompoundCommercialStoreInputs() {
    return [
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: pharmacySellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundFactoryLandsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Ground Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Ground Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Building Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Building Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaSuggestions', type: InputFieldType.checkbox, label: 'Building Area Suggestions'),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'groundStatus', type: InputFieldType.select, label: 'Ground Status', options: groundLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: fitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundWarehousesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Ground Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Ground Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Building Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Building Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaSuggestions', type: InputFieldType.checkbox, label: 'Building Area Suggestions'),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'groundStatus', type: InputFieldType.select, label: 'Ground Status', options: groundLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: fitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: sellOutOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundResidentialBuildingsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Ground Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Ground Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Building Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Building Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: purchaseBuildingStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingAreaSuggestions', type: InputFieldType.checkbox, label: 'Building Area Suggestions'),
      const InputConfig(step: 3, name: 'unitDesign', type: InputFieldType.select, label: 'Unit Design', options: unitDesignTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Ground Description', options: unitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundResidentialLandsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Ground Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Ground Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Building Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Building Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaSuggestions', type: InputFieldType.checkbox, label: 'Building Area Suggestions'),
      const InputConfig(step: 3, name: 'groundStatus', type: InputFieldType.select, label: 'Ground Status', options: groundLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Ground Description', options: unitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseLandDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundCommercialAdministrativeBuildingsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundStatus', type: InputFieldType.select, label: 'Ground Status', options: groundLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Ground Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Ground Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Building Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Building Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaSuggestions', type: InputFieldType.checkbox, label: 'Building Area Suggestions'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Ground Description', options: unitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'activity', type: InputFieldType.select, label: 'Activity', options: activityTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundCommercialAdministrativeLandsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundStatus', type: InputFieldType.select, label: 'Ground Status', options: groundLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Ground Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Ground Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Building Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Building Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'buildingAreaSuggestions', type: InputFieldType.checkbox, label: 'Building Area Suggestions'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitDescription', type: InputFieldType.select, label: 'Ground Description', options: unitDescriptionTypesOptions),
      const InputConfig(step: 3, name: 'activity', type: InputFieldType.select, label: 'Activity', options: activityTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseLandDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundVacationVillasInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'villageName', type: InputFieldType.text, label: 'Village Name'),
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: purchaseVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundChaletsInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'villageName', type: InputFieldType.text, label: 'Village Name'),
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Unit Area Min (m\u00B2)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Unit Area Max (m\u00B2)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: purchaseVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: purchaseChaletsOutsideFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'deliveryStatus', type: InputFieldType.select, label: 'Delivery Status', options: purchaseDeliveryStatusTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  // ============================================================================
  // FINANCIAL INPUTS
  // ============================================================================

  List<InputConfig> _createPurchaseOutsideCompoundFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'paymentMethod', type: InputFieldType.select, label: 'Payment Method', options: paymentMethodOptions),
      const InputConfig(step: 5, name: 'averageUnitPriceMin', type: InputFieldType.number, label: 'Average Unit Price Min'),
      const InputConfig(step: 5, name: 'averageUnitPriceMax', type: InputFieldType.number, label: 'Average Unit Price Max'),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Price Suggestion'),
    ];
  }

  List<InputConfig> _createPurchaseOutsideCompoundChaletsFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'averageUnitPriceMin', type: InputFieldType.number, label: 'Average Unit Price Min'),
      const InputConfig(step: 5, name: 'averageUnitPriceMax', type: InputFieldType.number, label: 'Average Unit Price Max'),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Price Suggestion'),
    ];
  }
}
