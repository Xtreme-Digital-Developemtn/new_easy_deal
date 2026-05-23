import 'input_config_model.dart';
import 'stepper_constants.dart';

class RentalOutsideCompoundConfigService {
  List<StepperConfiguration> getInputConfigs() {
    return [
      // RENT-OUT OUTSIDE COMPOUND CONFIGURATIONS
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_apartments',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_duplexes',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutDuplexOutsideCompoundUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_studios',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundStudiosUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_penthouses',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundPenthousesUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_basements',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundBasementsUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_roofs',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundRoofsUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_villas',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundStandaloneVillasUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_administrative_units',
        inputs: [
          ..._createRentOutOutsideCompoundAdministrativeUnitsLocationInputs(),
          ..._createRentOutOutsideCompoundAdministrativeUnitsUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_medical_clinics',
        inputs: [
          ..._createRentOutOutsideCompoundAdministrativeUnitsLocationInputs(),
          ..._createRentOutOutsideCompoundMedicalClinicsUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_pharmacies',
        inputs: [
          ..._createRentOutOutsideCompoundAdministrativeUnitsLocationInputs(),
          ..._createRentOutOutsideCompoundPharmaciesUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_commercial_stores',
        inputs: [
          ..._createRentOutOutsideCompoundAdministrativeUnitsLocationInputs(),
          ..._createRentOutOutsideCompoundCommercialStoresUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_factory_lands',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_factories',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_warehouses',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_warehouse_lands',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_commercial_administrative_buildings',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundCommercialAdministrativeBuildingsUnitInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_residential_buildings',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundResidentialBuildingInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundFinancialInputsWithoutDaily(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_vacation_villa',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideCompoundVacationVillasInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundChaletVacationvillaSpecificFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_chalets',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideChaletsInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundChaletVacationvillaSpecificFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_out_hotels',
        inputs: [
          ..._createRentOutOutsideCompoundLocationInputs(),
          ..._createRentOutOutsideHotelsInformationInputs(),
          ..._createMediaInputs(),
          ..._createRentOutOutsideCompoundSpecificFinancialInputs(),
        ],
      ),
      // RENT-IN OUTSIDE COMPOUND CONFIGURATIONS
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_apartments',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_duplexes',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_studios',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundStudiosUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_penthouses',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundPenthousesUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_basements',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundBasementsUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_roofs',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundRoofsUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_villas',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundStandaloneVillasUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_administrative_units',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundAdministrativeUnitsUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_medical_clinics',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundMedicalClinicsUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_pharmacies',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundPharmaciesUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_commercial_stores',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundCommercialStoresUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_factory_lands',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_factories',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_warehouses',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_warehouse_lands',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundIndustrialUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_commercial_administrative_buildings',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundCommericalAdminstrativeBuildingUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_residential_buildings',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundResidentialBuildingUnitInformationInputs(),
          ..._createRentInOutsideCompoundFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_vacation_villa',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundVacationVillasAndChalets(),
          ..._createRentInOutsideCompoundSpecificFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_chalets',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundChalets(),
          ..._createRentInOutsideCompoundSpecificFinancialInputs(),
        ],
      ),
      StepperConfiguration(
        key: 'rentals_outside_compound_rent_in_hotels',
        inputs: [
          ..._createRentInOutsideCompoundLocationInputs(),
          ..._createRentInOutsideCompoundHotels(),
          ..._createRentInOutsideCompoundSpecificFinancialInputs(),
        ],
      ),
    ];
  }

  List<String> getRentalOutsideCompoundConfigurationKeys() {
    return [
      'rentals_outside_compound_rent_out_apartments',
      'rentals_outside_compound_rent_out_duplexes',
      'rentals_outside_compound_rent_out_studios',
      'rentals_outside_compound_rent_out_penthouses',
      'rentals_outside_compound_rent_out_basements',
      'rentals_outside_compound_rent_out_roofs',
      'rentals_outside_compound_rent_out_villas',
      'rentals_outside_compound_rent_out_administrative_units',
      'rentals_outside_compound_rent_out_medical_clinics',
      'rentals_outside_compound_rent_out_pharmacies',
      'rentals_outside_compound_rent_out_commercial_stores',
      'rentals_outside_compound_rent_out_factory_lands',
      'rentals_outside_compound_rent_out_factories',
      'rentals_outside_compound_rent_out_warehouses',
      'rentals_outside_compound_rent_out_warehouse_lands',
      'rentals_outside_compound_rent_out_commercial_administrative_buildings',
      'rentals_outside_compound_rent_out_residential_buildings',
      'rentals_outside_compound_rent_out_vacation_villa',
      'rentals_outside_compound_rent_out_chalets',
      'rentals_outside_compound_rent_out_hotels',
      'rentals_outside_compound_rent_in_apartments',
      'rentals_outside_compound_rent_in_duplexes',
      'rentals_outside_compound_rent_in_studios',
      'rentals_outside_compound_rent_in_penthouses',
      'rentals_outside_compound_rent_in_basements',
      'rentals_outside_compound_rent_in_roofs',
      'rentals_outside_compound_rent_in_villas',
      'rentals_outside_compound_rent_in_administrative_units',
      'rentals_outside_compound_rent_in_medical_clinics',
      'rentals_outside_compound_rent_in_pharmacies',
      'rentals_outside_compound_rent_in_commercial_stores',
      'rentals_outside_compound_rent_in_factory_lands',
      'rentals_outside_compound_rent_in_factories',
      'rentals_outside_compound_rent_in_warehouses',
      'rentals_outside_compound_rent_in_warehouse_lands',
      'rentals_outside_compound_rent_in_commercial_administrative_buildings',
      'rentals_outside_compound_rent_in_residential_buildings',
      'rentals_outside_compound_rent_in_vacation_villa',
      'rentals_outside_compound_rent_in_chalets',
      'rentals_outside_compound_rent_in_hotels',
    ];
  }

  bool isRentOutOutsideCompoundConfiguration(String key) {
    return key.contains('rentals_outside_compound_rent_out_');
  }

  bool isRentInOutsideCompoundConfiguration(String key) {
    return key.contains('rentals_outside_compound_rent_in_');
  }

  // ============================================================================
  // RENT-OUT LOCATION INPUTS
  // ============================================================================

  List<InputConfig> _createRentOutOutsideCompoundLocationInputs() {
    return [
      const InputConfig(step: 2, name: 'cityId', type: InputFieldType.select, label: 'City'),
      const InputConfig(step: 2, name: 'areaId', type: InputFieldType.select, label: 'Area'),
      const InputConfig(step: 2, name: 'subAreaId', type: InputFieldType.select, label: 'Sub Area'),
      const InputConfig(step: 2, name: 'detailedAddress', type: InputFieldType.text, label: 'Detailed Address'),
      const InputConfig(step: 2, name: 'addressLink', type: InputFieldType.url, label: 'Address Link'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundAdministrativeUnitsLocationInputs() {
    return [
      const InputConfig(step: 2, name: 'cityId', type: InputFieldType.select, label: 'City'),
      const InputConfig(step: 2, name: 'areaId', type: InputFieldType.select, label: 'Area'),
      const InputConfig(step: 2, name: 'subAreaId', type: InputFieldType.select, label: 'Sub Area'),
      const InputConfig(step: 2, name: 'detailedAddress', type: InputFieldType.text, label: 'Detailed Address'),
      const InputConfig(step: 2, name: 'addressLink', type: InputFieldType.url, label: 'Address Link'),
      const InputConfig(step: 2, name: 'mallName', type: InputFieldType.text, label: 'Mall Name'),
    ];
  }

  // ============================================================================
  // RENT-OUT UNIT INFORMATION INPUTS
  // ============================================================================

  List<InputConfig> _createRentOutOutsideCompoundUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutDuplexOutsideCompoundUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'gardenArea', type: InputFieldType.number, label: 'Garden Area (m²)'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundStudiosUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundPenthousesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'terraceArea', type: InputFieldType.number, label: 'Terrace Area (m²)'),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundBasementsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitLayoutStatus', type: InputFieldType.select, label: 'Unit Layout Status', options: basementUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundRoofsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitLayoutStatus', type: InputFieldType.select, label: 'Unit Layout Status', options: sellRoofUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: basementUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundStandaloneVillasUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'unitDesign', type: InputFieldType.select, label: 'Unit Design', options: unitDesignTypesOptions),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundAdministrativeUnitsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundMedicalClinicsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundPharmaciesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: pharmacyFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: sellFitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundCommercialStoresUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: pharmacyFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: sellFitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundIndustrialUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: sellFitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: allRentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundResidentialBuildingInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'unitDesign', type: InputFieldType.select, label: 'Unit Design', options: unitDesignTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: specificOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundCommercialAdministrativeBuildingsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'groundArea', type: InputFieldType.number, label: 'Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingArea', type: InputFieldType.number, label: 'Building Area (m²)'),
      const InputConfig(step: 3, name: 'activity', type: InputFieldType.select, label: 'Activity', options: activityTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundVacationVillasInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: specificOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideChaletsInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: furnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: specificOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  List<InputConfig> _createRentOutOutsideHotelsInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'unitNumber', type: InputFieldType.text, label: 'Unit Number'),
      const InputConfig(step: 3, name: 'buildingNumber', type: InputFieldType.text, label: 'Building Number'),
      const InputConfig(step: 3, name: 'unitArea', type: InputFieldType.number, label: 'Unit Area (m²)'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: sellFloorTypesOptions),
      const InputConfig(step: 3, name: 'floorNumber', type: InputFieldType.number, label: 'Floor Number'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: sellVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'unitFacing', type: InputFieldType.select, label: 'Unit Facing', options: unitFacingTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: sellHotelFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Available Accessories', options: specificOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Property Description'),
    ];
  }

  // ============================================================================
  // RENT-OUT FINANCIAL INPUTS
  // ============================================================================

  List<InputConfig> _createRentOutOutsideCompoundFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'unitPrice', type: InputFieldType.number, label: 'Monthly Rent'),
      const InputConfig(step: 5, name: 'unitPriceDaily', type: InputFieldType.number, label: 'Daily Rent'),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Monthly Rent Suggestions'),
      const InputConfig(step: 5, name: 'rentRecurrence', type: InputFieldType.select, label: 'Rent Recurrence', options: rentRecurrenceOptions),
      const InputConfig(step: 5, name: 'requiredInsurance', type: InputFieldType.select, label: 'Required Insurance', options: requiredInsuranceTypesOptions),
      const InputConfig(step: 5, name: 'requiredInsuranceValue', type: InputFieldType.text, label: 'Required Insurance Value'),
      const InputConfig(step: 5, name: 'otherExpenses', type: InputFieldType.multiSelect, label: 'Other Expenses (Tenant Responsibility)', options: otherExpensesOptions),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundFinancialInputsWithoutDaily() {
    return [
      const InputConfig(step: 5, name: 'unitPrice', type: InputFieldType.number, label: 'Monthly Rent'),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Monthly Rent Suggestions'),
      const InputConfig(step: 5, name: 'rentRecurrence', type: InputFieldType.select, label: 'Rent Recurrence', options: createRentOutOutsideCompoundFinancialInputsWithoutDaily),
      const InputConfig(step: 5, name: 'requiredInsurance', type: InputFieldType.select, label: 'Required Insurance', options: requiredInsuranceTypesOptions),
      const InputConfig(step: 5, name: 'requiredInsuranceValue', type: InputFieldType.text, label: 'Required Insurance Value'),
      const InputConfig(step: 5, name: 'otherExpenses', type: InputFieldType.multiSelect, label: 'Other Expenses (Tenant Responsibility)', options: otherExpensesOptions),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundSpecificFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'rentRecurrence', type: InputFieldType.select, label: 'Rent Recurrence', options: rentRecurrenceOptions),
      const InputConfig(step: 5, name: 'requiredInsurance', type: InputFieldType.select, label: 'Required Insurance', options: requiredInsuranceTypesOptions),
      const InputConfig(step: 5, name: 'requiredInsuranceValue', type: InputFieldType.text, label: 'Required Insurance Value'),
      const InputConfig(step: 5, name: 'unitPriceMonthly', type: InputFieldType.number, label: 'Monthly Unit Price'),
      const InputConfig(step: 5, name: 'unitPriceMonthlySuggestions', type: InputFieldType.checkbox, label: 'Monthly Unit Price Suggestions'),
      const InputConfig(step: 5, name: 'unitPriceDaily', type: InputFieldType.number, label: 'Daily Unit Price'),
      const InputConfig(step: 5, name: 'unitPriceDailySuggestions', type: InputFieldType.checkbox, label: 'Daily Unit Price Suggestions'),
      const InputConfig(step: 5, name: 'otherExpenses', type: InputFieldType.multiSelect, label: 'Other Expenses (Tenant Responsibility)', options: otherExpensesOptions),
    ];
  }

  List<InputConfig> _createRentOutOutsideCompoundChaletVacationvillaSpecificFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'rentRecurrence', type: InputFieldType.select, label: 'Rent Recurrence', options: rentRecurrenceOptions),
      const InputConfig(step: 5, name: 'requiredInsurance', type: InputFieldType.select, label: 'Required Insurance', options: requiredInsuranceTypesOptions),
      const InputConfig(step: 5, name: 'requiredInsuranceValue', type: InputFieldType.text, label: 'Required Insurance Value'),
      const InputConfig(step: 5, name: 'unitPriceMonthly', type: InputFieldType.number, label: 'Monthly Unit Price'),
      const InputConfig(step: 5, name: 'unitPriceMonthlySuggestions', type: InputFieldType.checkbox, label: 'Monthly Unit Price Suggestions'),
      const InputConfig(step: 5, name: 'unitPriceDaily', type: InputFieldType.number, label: 'Daily Unit Price'),
      const InputConfig(step: 5, name: 'unitPriceDailySuggestions', type: InputFieldType.checkbox, label: 'Daily Unit Price Suggestions'),
      const InputConfig(step: 5, name: 'otherExpenses', type: InputFieldType.multiSelect, label: 'Other Expenses (Tenant Responsibility)', options: otherExpensesOptions),
    ];
  }

  // ============================================================================
  // MEDIA INPUTS
  // ============================================================================

  List<InputConfig> _createMediaInputs() {
    return [
      const InputConfig(step: 4, name: 'mainImage', type: InputFieldType.file, label: 'Main Image'),
      const InputConfig(step: 4, name: 'galleryImages', type: InputFieldType.file, label: 'Gallery Images'),
      const InputConfig(step: 4, name: 'video', type: InputFieldType.file, label: 'Video'),
    ];
  }

  // ============================================================================
  // RENT-IN LOCATION INPUTS
  // ============================================================================

  List<InputConfig> _createRentInOutsideCompoundLocationInputs() {
    return [
      const InputConfig(step: 2, name: 'cityId', type: InputFieldType.select, label: 'City'),
      const InputConfig(step: 2, name: 'areaId', type: InputFieldType.select, label: 'Area'),
      const InputConfig(step: 2, name: 'subAreaId', type: InputFieldType.select, label: 'Sub Area'),
      const InputConfig(step: 2, name: 'locationSuggestions', type: InputFieldType.checkbox, label: 'Location Suggestions'),
    ];
  }

  // ============================================================================
  // RENT-IN UNIT INFORMATION INPUTS
  // ============================================================================

  List<InputConfig> _createRentInOutsideCompoundUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor Number', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundStudiosUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor Number', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundPenthousesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundBasementsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'unitLayoutStatus', type: InputFieldType.select, label: 'Unit Layout Status', options: buildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundRoofsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'unitLayoutStatus', type: InputFieldType.select, label: 'Unit Layout Status', options: purchaseRoofUnitLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'buildingLayoutStatus', type: InputFieldType.select, label: 'Building Layout Status', options: buildingLayoutStatusTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundStandaloneVillasUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Minimum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Maximum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Minimum Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Maximum Building Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'unitDesign', type: InputFieldType.select, label: 'Unit Design', options: unitDesignTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundAdministrativeUnitsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundMedicalClinicsUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundPharmaciesUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: buildRentFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: fitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundCommercialStoresUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: buildRentFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: fitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundIndustrialUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Minimum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Maximum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Minimum Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Maximum Building Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'fitOutCondition', type: InputFieldType.select, label: 'Fit Out Condition', options: fitOutConditionTypesOptions),
      const InputConfig(step: 3, name: 'shopActivity', type: InputFieldType.text, label: 'Activity'),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: buildRentFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundCommericalAdminstrativeBuildingUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Minimum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Maximum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Minimum Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Maximum Building Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'activity', type: InputFieldType.select, label: 'Activity Type', options: activityTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: buildRentFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: purchaseOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundResidentialBuildingUnitInformationInputs() {
    return [
      const InputConfig(step: 3, name: 'groundAreaMin', type: InputFieldType.number, label: 'Minimum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'groundAreaMax', type: InputFieldType.number, label: 'Maximum Ground Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMin', type: InputFieldType.number, label: 'Minimum Building Area (m²)'),
      const InputConfig(step: 3, name: 'buildingAreaMax', type: InputFieldType.number, label: 'Maximum Building Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'unitDesign', type: InputFieldType.select, label: 'Unit Design', options: unitDesignTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'Unit View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: finishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'otherAccessories', type: InputFieldType.multiSelect, label: 'Other Accessories', options: specificOtherAccessoriesOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundVacationVillasAndChalets() {
    return [
      const InputConfig(step: 3, name: 'villageName', type: InputFieldType.text, label: 'Village Name'),
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'rentDuration', type: InputFieldType.select, label: 'Rent Duration', options: rentDurationOptions),
      const InputConfig(step: 3, name: 'rentDateMin', type: InputFieldType.date, label: 'Rent Date Min'),
      const InputConfig(step: 3, name: 'rentDateMax', type: InputFieldType.date, label: 'Rent Date Max'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'numberOfFloors', type: InputFieldType.number, label: 'Number of Floors'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: purchaseVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundChalets() {
    return [
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rentDuration', type: InputFieldType.select, label: 'Rent Duration', options: rentDurationOptions),
      const InputConfig(step: 3, name: 'rentDateMin', type: InputFieldType.date, label: 'Rent Date Min'),
      const InputConfig(step: 3, name: 'rentDateMax', type: InputFieldType.date, label: 'Rent Date Max'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: purchaseVacationUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: allFurnishingStatusOptions),
      const InputConfig(step: 3, name: 'notes', type: InputFieldType.textarea, label: 'Notes'),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundHotels() {
    return [
      const InputConfig(step: 3, name: 'subUnitType', type: InputFieldType.select, label: 'SubUnit Type'),
      const InputConfig(step: 3, name: 'unitAreaMin', type: InputFieldType.number, label: 'Minimum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'unitAreaMax', type: InputFieldType.number, label: 'Maximum Unit Area (m²)'),
      const InputConfig(step: 3, name: 'areaSuggestions', type: InputFieldType.checkbox, label: 'Area Suggestions'),
      const InputConfig(step: 3, name: 'rentDuration', type: InputFieldType.select, label: 'Rent Duration', options: rentDurationOptions),
      const InputConfig(step: 3, name: 'rentDateMin', type: InputFieldType.date, label: 'Rent Date Min'),
      const InputConfig(step: 3, name: 'rentDateMax', type: InputFieldType.date, label: 'Rent Date Max'),
      const InputConfig(step: 3, name: 'rooms', type: InputFieldType.number, label: 'Number of Rooms'),
      const InputConfig(step: 3, name: 'bathRooms', type: InputFieldType.number, label: 'Number of Bathrooms'),
      const InputConfig(step: 3, name: 'floor', type: InputFieldType.select, label: 'Floor', options: floorTypesOptions),
      const InputConfig(step: 3, name: 'unitView', type: InputFieldType.select, label: 'View', options: specialPurchaseUnitViewTypesOptions),
      const InputConfig(step: 3, name: 'finishingStatus', type: InputFieldType.select, label: 'Finishing Status', options: rentalinFinishingStatusTypesOptions),
      const InputConfig(step: 3, name: 'furnishingStatus', type: InputFieldType.select, label: 'Furnishing Status', options: hotelFurnishingStatusOptions),
    ];
  }

  // ============================================================================
  // RENT-IN FINANCIAL INPUTS
  // ============================================================================

  List<InputConfig> _createRentInOutsideCompoundFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'averageUnitPriceMin', type: InputFieldType.number, label: 'Minimum Average Monthly Rent Price'),
      const InputConfig(step: 5, name: 'averageUnitPriceMax', type: InputFieldType.number, label: 'Maximum Average Monthly Rent Price'),
      const InputConfig(step: 5, name: 'unitPriceSuggestions', type: InputFieldType.checkbox, label: 'Monthly Rent Suggestions'),
      const InputConfig(step: 5, name: 'rentRecurrence', type: InputFieldType.select, label: 'Rent Recurrence', options: rentRecurrenceOptions),
    ];
  }

  List<InputConfig> _createRentInOutsideCompoundSpecificFinancialInputs() {
    return [
      const InputConfig(step: 5, name: 'averageUnitPriceMonthlyMin', type: InputFieldType.number, label: 'Minimum Monthly Average Rent Price'),
      const InputConfig(step: 5, name: 'averageUnitPriceMonthlyMax', type: InputFieldType.number, label: 'Maximum Monthly Average Rent Price'),
      const InputConfig(step: 5, name: 'averageUnitPriceMonthlySuggestions', type: InputFieldType.checkbox, label: 'Monthly Rent Price Suggestions'),
      const InputConfig(step: 5, name: 'averageUnitPriceDailyMin', type: InputFieldType.number, label: 'Minimum Daily Average Rent Price'),
      const InputConfig(step: 5, name: 'averageUnitPriceDailyMax', type: InputFieldType.number, label: 'Maximum Daily Average Rent Price'),
      const InputConfig(step: 5, name: 'averageUnitPriceDailySuggestions', type: InputFieldType.checkbox, label: 'Daily Rent Price Suggestions'),
    ];
  }
}
