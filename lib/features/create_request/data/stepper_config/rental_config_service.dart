import 'input_config_model.dart';
import 'stepper_constants.dart';

class RentalConfigService {
  // ============================================================================
  // RENT-IN LOCATION INPUTS
  // ============================================================================

  List<InputConfig> createRentInLocationInputs() {
    return const [
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Preferred Compound Name',
      ),
      InputConfig(
        step: 2,
        name: 'locationSuggestions',
        type: InputFieldType.checkbox,
        label: 'Location Suggestions',
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'Preferred City',
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Preferred Area',
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Preferred Sub Area',
      ),
    ];
  }

  // ============================================================================
  // RENT-IN UNIT INFORMATION INPUTS
  // ============================================================================

  InputConfig _rentInUnitBaseInputs() {
    return const InputConfig(
      step: 3,
      name: 'floor',
      type: InputFieldType.select,
      label: 'Favorite Floor',
      options: floorTypesOptions,
    );
  }

  InputConfig _rentInUnitAreaMin() {
    return const InputConfig(
      step: 3,
      name: 'unitAreaMin',
      type: InputFieldType.number,
      label: 'Minimum Unit Area (m²)',
    );
  }

  InputConfig _rentInUnitAreaMax() {
    return const InputConfig(
      step: 3,
      name: 'unitAreaMax',
      type: InputFieldType.number,
      label: 'Maximum Unit Area (m²)',
    );
  }

  InputConfig _rentInRooms() {
    return const InputConfig(
      step: 3,
      name: 'rooms',
      type: InputFieldType.number,
      label: 'Number of Rooms',
    );
  }

  InputConfig _rentInBathRooms() {
    return const InputConfig(
      step: 3,
      name: 'bathRooms',
      type: InputFieldType.number,
      label: 'Number of Bathrooms',
    );
  }

  InputConfig _rentInUnitView() {
    return const InputConfig(
      step: 3,
      name: 'unitView',
      type: InputFieldType.select,
      label: 'Preferred View',
      options: specificRentalUnitViewTypesOptions,
    );
  }

  InputConfig _rentInAllFinishingStatus() {
    return const InputConfig(
      step: 3,
      name: 'finishingStatus',
      type: InputFieldType.select,
      label: 'Preferred Finishing Status',
      options: allRentalFinishingStatusTypesOptions,
    );
  }

  InputConfig _rentInRentalinFinishingStatus() {
    return const InputConfig(
      step: 3,
      name: 'finishingStatus',
      type: InputFieldType.select,
      label: 'Preferred Finishing Status',
      options: rentalinFinishingStatusTypesOptions,
    );
  }

  InputConfig _rentInFinishingStatus() {
    return const InputConfig(
      step: 3,
      name: 'finishingStatus',
      type: InputFieldType.select,
      label: 'Preferred Finishing Status',
      options: rentalFinishingStatusTypesOptions,
    );
  }

  InputConfig _rentInCompanySpecialFinishingStatus() {
    return const InputConfig(
      step: 3,
      name: 'finishingStatus',
      type: InputFieldType.select,
      label: 'Preferred Finishing Status',
      options: companySpecialRentalFinishingStatusTypesOptions,
    );
  }

  InputConfig _rentInAllFurnishingStatus() {
    return const InputConfig(
      step: 3,
      name: 'furnishingStatus',
      type: InputFieldType.select,
      label: 'PREFERRED_FURNISHING_STATUS',
      options: allFurnishingStatusOptions,
    );
  }

  InputConfig _rentInFurnishingStatus() {
    return const InputConfig(
      step: 3,
      name: 'furnishingStatus',
      type: InputFieldType.select,
      label: 'Furnishing Status',
      options: furnishingStatusOptions,
    );
  }

  InputConfig _rentInInsideCompoundOtherAccessories() {
    return const InputConfig(
      step: 3,
      name: 'otherAccessories',
      type: InputFieldType.multiSelect,
      label: 'Desired Accessories',
      options: insideCompoundOtherAccessoriesOptions,
    );
  }

  InputConfig _rentInPurchaseOtherAccessories() {
    return const InputConfig(
      step: 3,
      name: 'otherAccessories',
      type: InputFieldType.multiSelect,
      label: 'Desired Accessories',
      options: purchaseOtherAccessoriesOptions,
    );
  }

  InputConfig _rentInNotes() {
    return const InputConfig(
      step: 3,
      name: 'notes',
      type: InputFieldType.textarea,
      label: 'Additional Requirements',
    );
  }

  List<InputConfig> _rentInCommonInputs() {
    return [
      _rentInUnitView(),
      _rentInAllFinishingStatus(),
      _rentInAllFurnishingStatus(),
      _rentInInsideCompoundOtherAccessories(),
      _rentInNotes(),
    ];
  }

  List<InputConfig> _rentInRoomInputs() {
    return [
      _rentInBathRooms(),
      _rentInRooms(),
    ];
  }

  List<InputConfig> createRentInUnitInformationInputs({bool includeRooms = true}) {
    final inputs = <InputConfig>[
      _rentInUnitBaseInputs(),
      _rentInUnitAreaMin(),
      _rentInUnitAreaMax(),
    ];
    if (includeRooms) {
      inputs.addAll(_rentInRoomInputs());
    }
    inputs.addAll(_rentInCommonInputs());
    return inputs;
  }

  List<InputConfig> createRentInPenthousesUnitInformationInputs() {
    return [
      _rentInUnitAreaMin(),
      _rentInUnitAreaMax(),
      _rentInBathRooms(),
      _rentInRooms(),
      _rentInUnitView(),
      _rentInRentalinFinishingStatus(),
      _rentInAllFurnishingStatus(),
      _rentInInsideCompoundOtherAccessories(),
      _rentInNotes(),
    ];
  }

  List<InputConfig> createRentInVillasUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Preferred View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Preferred Finishing Status',
        options: companySpecialRentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'PREFERRED_FURNISHING_STATUS',
        options: allFurnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Desired Accessories',
        options: insideCompoundOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Additional Requirements',
      ),
    ];
  }

  List<InputConfig> createRentInHouseUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'groundAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Ground Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'groundAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Ground Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Preferred View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Preferred Finishing Status',
        options: companySpecialRentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'PREFERRED_FURNISHING_STATUS',
        options: allFurnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Desired Accessories',
        options: insideCompoundOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Additional Requirements',
      ),
    ];
  }

  List<InputConfig> createRentInAdministrativeUnitsUnitInformationInputs() {
    return [
      _rentInUnitBaseInputs(),
      _rentInUnitAreaMin(),
      _rentInUnitAreaMax(),
      _rentInUnitView(),
      _rentInFinishingStatus(),
      _rentInFurnishingStatus(),
      _rentInPurchaseOtherAccessories(),
      _rentInNotes(),
    ];
  }

  List<InputConfig> createRentInCommercialUnitInformationInputs() {
    return [
      _rentInUnitBaseInputs(),
      _rentInUnitAreaMin(),
      _rentInUnitAreaMax(),
      _rentInUnitView(),
      _rentInCompanySpecialFinishingStatus(),
      _rentInAllFurnishingStatus(),
      _rentInPurchaseOtherAccessories(),
      _rentInNotes(),
    ];
  }

  List<InputConfig> createRentInPharmaciesUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Favorite Floor',
        options: floorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Preferred View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Preferred Finishing Status',
        options: buildRentFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'fitOutCondition',
        type: InputFieldType.select,
        label: 'Preferred Fit-Out Condition',
        options: fitOutConditionTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Desired Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Additional Requirements',
      ),
    ];
  }

  List<InputConfig> createRentInCommercialStoresUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Favorite Floor',
        options: floorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Preferred View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Preferred Finishing Status',
        options: buildRentFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'fitOutCondition',
        type: InputFieldType.select,
        label: 'Preferred Fit-Out Condition',
        options: fitOutConditionTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'shopActivity',
        type: InputFieldType.text,
        label: 'Activity',
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Desired Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Additional Requirements',
      ),
    ];
  }

  List<InputConfig> createRentInCommercialAdministrativeBuildingsUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'buildingAreaMin',
        type: InputFieldType.number,
        label: 'MINIMUM_BUILDING_AREA',
      ),
      InputConfig(
        step: 3,
        name: 'buildingAreaMax',
        type: InputFieldType.number,
        label: 'MAXIMUM_BUILDING_AREA',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Preferred View',
        options: specificRentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: buildRentFinishingStatusTypesOptions,
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
        label: 'Desired Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Additional Requirements',
      ),
    ];
  }

  List<InputConfig> createRentInVacationVillasUnitInformationInputs() {
    return const [
      InputConfig(
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
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
      ),
      InputConfig(
        step: 3,
        name: 'rentDuration',
        type: InputFieldType.select,
        label: 'Rent Duration',
        options: rentDurationOptions,
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMin',
        type: InputFieldType.date,
        label: 'Rent Date Min',
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMax',
        type: InputFieldType.date,
        label: 'Rent Date Max',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
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
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: purchaseFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: allFurnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> createRentInInsideCompoundVacationVillasUnitInformationInputs() {
    return const [
      InputConfig(
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
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
      ),
      InputConfig(
        step: 3,
        name: 'rentDuration',
        type: InputFieldType.select,
        label: 'Rent Duration',
        options: rentDurationOptions,
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMin',
        type: InputFieldType.date,
        label: 'Rent Date Min',
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMax',
        type: InputFieldType.date,
        label: 'Rent Date Max',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
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
        options: purchaseVacationUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalinFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: hotelFurnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> createRentInChaletsUnitInformationInputs() {
    return const [
      InputConfig(
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
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
      ),
      InputConfig(
        step: 3,
        name: 'rentDuration',
        type: InputFieldType.select,
        label: 'Rent Duration',
        options: rentDurationOptions,
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMin',
        type: InputFieldType.date,
        label: 'Rent Date Min',
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMax',
        type: InputFieldType.date,
        label: 'Rent Date Max',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
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
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalinFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: allFurnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  List<InputConfig> createRentInHotelsUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'subUnitType',
        type: InputFieldType.select,
        label: 'SubUnit Type',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMin',
        type: InputFieldType.number,
        label: 'Minimum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitAreaMax',
        type: InputFieldType.number,
        label: 'Maximum Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'areaSuggestions',
        type: InputFieldType.checkbox,
        label: 'Area Suggestions',
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Favorite Floor',
        options: floorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'rentDuration',
        type: InputFieldType.select,
        label: 'Rent Duration',
        options: rentDurationOptions,
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMin',
        type: InputFieldType.date,
        label: 'Rent Date Min',
      ),
      InputConfig(
        step: 3,
        name: 'rentDateMax',
        type: InputFieldType.date,
        label: 'Rent Date Max',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
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
        options: purchaseVacationUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalinFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: hotelFurnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Notes',
      ),
    ];
  }

  // ============================================================================
  // RENT-IN FINANCIAL INPUTS
  // ============================================================================

  List<InputConfig> createRentInFinancialInputs() {
    return const [
      InputConfig(
        step: 5,
        name: 'averageUnitPriceMin',
        type: InputFieldType.number,
        label: 'Minimum Average Monthly Rent Price',
      ),
      InputConfig(
        step: 5,
        name: 'averageUnitPriceMax',
        type: InputFieldType.number,
        label: 'Maximum Average Monthly Rent Price',
      ),
      InputConfig(
        step: 5,
        name: 'unitPriceSuggestions',
        type: InputFieldType.checkbox,
        label: 'Monthly Unit Price Suggestions',
      ),
      InputConfig(
        step: 5,
        name: 'rentRecurrence',
        type: InputFieldType.select,
        label: 'Rent Recurrence',
        options: rentRecurrenceOptions,
      ),
    ];
  }

  List<InputConfig> createRentInSpecificFinancialInputs() {
    return const [
      InputConfig(
        step: 5,
        name: 'averageUnitPriceMonthlyMin',
        type: InputFieldType.number,
        label: 'Minimum Monthly Average Rent Price',
      ),
      InputConfig(
        step: 5,
        name: 'averageUnitPriceMonthlyMax',
        type: InputFieldType.number,
        label: 'Maximum Monthly Average Rent Price',
      ),
      InputConfig(
        step: 5,
        name: 'averageUnitPriceMonthlySuggestions',
        type: InputFieldType.checkbox,
        label: 'Monthly Unit Price Suggestions',
      ),
      InputConfig(
        step: 5,
        name: 'averageUnitPriceDailyMin',
        type: InputFieldType.number,
        label: 'الحد الأدنى للسعر اليومي المتوسط',
      ),
      InputConfig(
        step: 5,
        name: 'averageUnitPriceDailyMax',
        type: InputFieldType.number,
        label: 'الحد الأقصى للسعر اليومي المتوسط',
      ),
      InputConfig(
        step: 5,
        name: 'averageUnitPriceDailySuggestions',
        type: InputFieldType.checkbox,
        label: 'Daily Unit Price Suggestions',
      ),
    ];
  }

  // ============================================================================
  // RENT-OUT LOCATION INPUTS
  // ============================================================================

  List<InputConfig> createRentOutLocationInputs() {
    return const [
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Compound Name',
      ),
      InputConfig(
        step: 2,
        name: 'locationSuggestions',
        type: InputFieldType.checkbox,
        label: 'Location Suggestions',
      ),
      InputConfig(
        step: 2,
        name: 'detailedAddress',
        type: InputFieldType.text,
        label: 'Detailed Address',
      ),
      InputConfig(
        step: 2,
        name: 'addressLink',
        type: InputFieldType.url,
        label: 'Address Link',
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
      ),
    ];
  }

  List<InputConfig> createRentOutAdministrativeUnitsLocationInputs() {
    return const [
      InputConfig(
        step: 2,
        name: 'mallName',
        type: InputFieldType.text,
        label: 'Mall Name',
      ),
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Compound Name',
      ),
      InputConfig(
        step: 2,
        name: 'locationSuggestions',
        type: InputFieldType.checkbox,
        label: 'Location Suggestions',
      ),
      InputConfig(
        step: 2,
        name: 'detailedAddress',
        type: InputFieldType.text,
        label: 'Detailed Address',
      ),
      InputConfig(
        step: 2,
        name: 'addressLink',
        type: InputFieldType.url,
        label: 'Address Link',
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
      ),
    ];
  }

  List<InputConfig> createRentOutSpecificLocationInputs() {
    return const [
      InputConfig(
        step: 2,
        name: 'compoundName',
        type: InputFieldType.text,
        label: 'Compound Name',
      ),
      InputConfig(
        step: 2,
        name: 'locationSuggestions',
        type: InputFieldType.checkbox,
        label: 'Location Suggestions',
      ),
      InputConfig(
        step: 2,
        name: 'detailedAddress',
        type: InputFieldType.text,
        label: 'Detailed Address',
      ),
      InputConfig(
        step: 2,
        name: 'addressLink',
        type: InputFieldType.url,
        label: 'Address Link',
      ),
      InputConfig(
        step: 2,
        name: 'cityId',
        type: InputFieldType.select,
        label: 'City',
      ),
      InputConfig(
        step: 2,
        name: 'areaId',
        type: InputFieldType.select,
        label: 'Area',
      ),
      InputConfig(
        step: 2,
        name: 'subAreaId',
        type: InputFieldType.select,
        label: 'Sub Area',
      ),
    ];
  }

  // ============================================================================
  // RENT-OUT UNIT INFORMATION INPUTS
  // ============================================================================

  List<InputConfig> createRentOutUnitInformationInputs({bool includeRooms = true}) {
    final baseInputs = <InputConfig>[
      const InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      const InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      const InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
      ),
    ];

    final roomInputs = includeRooms
        ? <InputConfig>[
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
          ]
        : <InputConfig>[];

    final commonInputs = <InputConfig>[
      const InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: rentalUnitViewTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];

    return [...baseInputs, ...roomInputs, ...commonInputs];
  }

  List<InputConfig> createRentOutDuplexUnitInformationInputs({bool includeRooms = true}) {
    final baseInputs = <InputConfig>[
      const InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      const InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      const InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'gardenArea',
        type: InputFieldType.number,
        label: 'garden Area (m²)',
      ),
      const InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor Number',
        options: sellFloorTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
      ),
    ];

    final roomInputs = includeRooms
        ? <InputConfig>[
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
          ]
        : <InputConfig>[];

    final commonInputs = <InputConfig>[
      const InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: rentalUnitViewTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      const InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];

    return [...baseInputs, ...roomInputs, ...commonInputs];
  }

  List<InputConfig> createRentOutPenthouseUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'terraceArea',
        type: InputFieldType.number,
        label: 'Terrace Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: rentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutVillaUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'terraceArea',
        type: InputFieldType.number,
        label: 'Terrace Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'gardenArea',
        type: InputFieldType.number,
        label: 'Garden Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: rentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutHouseUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'groundArea',
        type: InputFieldType.number,
        label: 'Ground Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: rentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutCommercialUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: sellVacationUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutPharmacyUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: rentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'fitOutCondition',
        type: InputFieldType.select,
        label: 'Fit-Out Condition',
        options: sellFitOutConditionTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: pharmacyFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutCommercialStoreUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: sellVacationUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'fitOutCondition',
        type: InputFieldType.select,
        label: 'Fit-Out Condition',
        options: sellFitOutConditionTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'shopActivity',
        type: InputFieldType.text,
        label: 'Activity',
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: pharmacyFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutCommercialAdministrativeBuildingUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'groundArea',
        type: InputFieldType.number,
        label: 'Ground Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'buildingArea',
        type: InputFieldType.number,
        label: 'Building Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Building View',
        options: rentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'activity',
        type: InputFieldType.select,
        label: 'Activity Type',
        options: activityTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: purchaseOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutVacationVillasAndChaletsUnitInformationInputs() {
    return const [
      InputConfig(
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
      ),
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'groundArea',
        type: InputFieldType.number,
        label: 'Ground Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'numberOfFloors',
        type: InputFieldType.number,
        label: 'Number of Floors',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: sellVacationUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutSChaletsUnitInformationInputs() {
    return const [
      InputConfig(
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
      ),
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: sellVacationUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: furnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  List<InputConfig> createRentOutHotelsUnitInformationInputs() {
    return const [
      InputConfig(
        step: 3,
        name: 'subUnitType',
        type: InputFieldType.select,
        label: 'SubUnit Type',
      ),
      InputConfig(
        step: 3,
        name: 'unitNumber',
        type: InputFieldType.text,
        label: 'Unit Number',
      ),
      InputConfig(
        step: 3,
        name: 'buildingNumber',
        type: InputFieldType.text,
        label: 'Building Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitArea',
        type: InputFieldType.number,
        label: 'Unit Area (m²)',
      ),
      InputConfig(
        step: 3,
        name: 'rooms',
        type: InputFieldType.number,
        label: 'Number of Rooms',
      ),
      InputConfig(
        step: 3,
        name: 'bathRooms',
        type: InputFieldType.number,
        label: 'Number of Bathrooms',
      ),
      InputConfig(
        step: 3,
        name: 'floor',
        type: InputFieldType.select,
        label: 'Floor',
        options: sellFloorTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'floorNumber',
        type: InputFieldType.number,
        label: 'Floor Number',
      ),
      InputConfig(
        step: 3,
        name: 'unitView',
        type: InputFieldType.select,
        label: 'Unit View',
        options: rentalUnitViewTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'finishingStatus',
        type: InputFieldType.select,
        label: 'Finishing Status',
        options: rentalFinishingStatusTypesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'furnishingStatus',
        type: InputFieldType.select,
        label: 'Furnishing Status',
        options: sellHotelFurnishingStatusOptions,
      ),
      InputConfig(
        step: 3,
        name: 'otherAccessories',
        type: InputFieldType.multiSelect,
        label: 'Available Accessories',
        options: specificOtherAccessoriesOptions,
      ),
      InputConfig(
        step: 3,
        name: 'notes',
        type: InputFieldType.textarea,
        label: 'Property Description',
      ),
    ];
  }

  // ============================================================================
  // RENT-OUT FINANCIAL INPUTS
  // ============================================================================

  List<InputConfig> createRentOutFinancialInputs() {
    return const [
      InputConfig(
        step: 5,
        name: 'unitPrice',
        type: InputFieldType.number,
        label: 'Rentfor',
      ),
      InputConfig(
        step: 5,
        name: 'unitPriceSuggestions',
        type: InputFieldType.checkbox,
        label: 'Rent Price Suggestions',
      ),
      InputConfig(
        step: 5,
        name: 'rentRecurrence',
        type: InputFieldType.select,
        label: 'Rent Recurrence',
        options: rentRecurrenceOptions,
      ),
      InputConfig(
        step: 5,
        name: 'requiredInsurance',
        type: InputFieldType.select,
        label: 'Required Insurance',
        options: requiredInsuranceTypesOptions,
      ),
      InputConfig(
        step: 5,
        name: 'requiredInsuranceValue',
        type: InputFieldType.text,
        label: 'Required Insurance Value',
      ),
      InputConfig(
        step: 5,
        name: 'otherExpenses',
        type: InputFieldType.multiSelect,
        label: 'Other Expenses (Tenant Responsibility)',
        options: otherExpensesOptions,
      ),
    ];
  }

  List<InputConfig> createRentOutSpecificFinancialInputs() {
    return const [
      InputConfig(
        step: 5,
        name: 'rentRecurrence',
        type: InputFieldType.select,
        label: 'Rent Recurrence',
        options: rentRecurrenceOptions,
      ),
      InputConfig(
        step: 5,
        name: 'requiredInsurance',
        type: InputFieldType.select,
        label: 'Required Insurance',
        options: requiredInsuranceTypesOptions,
      ),
      InputConfig(
        step: 5,
        name: 'requiredInsuranceValue',
        type: InputFieldType.text,
        label: 'Required Insurance Value',
      ),
      InputConfig(
        step: 5,
        name: 'unitPriceMonthly',
        type: InputFieldType.number,
        label: 'Monthly Unit Price',
      ),
      InputConfig(
        step: 5,
        name: 'UnitPriceMonthlySuggestions',
        type: InputFieldType.checkbox,
        label: 'Monthly Price Suggestions',
      ),
      InputConfig(
        step: 5,
        name: 'unitPriceDaily',
        type: InputFieldType.number,
        label: 'Daily Unit Price',
      ),
      InputConfig(
        step: 5,
        name: 'UnitPriceDailySuggestions',
        type: InputFieldType.checkbox,
        label: 'Daily Price Suggestions',
      ),
      InputConfig(
        step: 5,
        name: 'otherExpenses',
        type: InputFieldType.multiSelect,
        label: 'Other Expenses (Tenant Responsibility)',
        options: otherExpensesOptions,
      ),
    ];
  }

  // ============================================================================
  // MEDIA INPUTS
  // ============================================================================

  List<InputConfig> createMediaInputs() {
    return const [
      InputConfig(
        step: 4,
        name: 'mainImage',
        type: InputFieldType.file,
        label: 'Main Image',
      ),
      InputConfig(
        step: 4,
        name: 'galleryImages',
        type: InputFieldType.file,
        label: 'Gallery Images',
      ),
      InputConfig(
        step: 4,
        name: 'unitInMasterPlanImage',
        type: InputFieldType.file,
        label: 'Unit in Master Plan Image',
      ),
      InputConfig(
        step: 4,
        name: 'video',
        type: InputFieldType.file,
        label: 'Video',
      ),
    ];
  }

  // ============================================================================
  // RENT-IN CONFIG BUILDERS
  // ============================================================================

  List<InputConfig> createRentInConfig({bool includeRooms = true}) {
    return [
      ...createRentInLocationInputs(),
      ...createRentInUnitInformationInputs(includeRooms: includeRooms),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInPenthousesConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInPenthousesUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInVillasConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInVillasUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInTwinHousesConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInHouseUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInTownHousesConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInHouseUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInStandaloneVillasConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInHouseUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInAdministrativeUnitsConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInAdministrativeUnitsUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInMedicalClinicsConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInCommercialUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInPharmaciesConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInPharmaciesUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInCommercialStoresConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInCommercialStoresUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInCommercialAdministrativeBuildingsConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInCommercialAdministrativeBuildingsUnitInformationInputs(),
      ...createRentInFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInVacationVillasAndChaletsConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInVacationVillasUnitInformationInputs(),
      ...createRentInSpecificFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInInsideCompoundVacationVillasAndChaletsConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInInsideCompoundVacationVillasUnitInformationInputs(),
      ...createRentInSpecificFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInChaletsConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInChaletsUnitInformationInputs(),
      ...createRentInSpecificFinancialInputs(),
    ];
  }

  List<InputConfig> createRentInHotelsConfig() {
    return [
      ...createRentInLocationInputs(),
      ...createRentInHotelsUnitInformationInputs(),
      ...createRentInSpecificFinancialInputs(),
    ];
  }

  // ============================================================================
  // RENT-OUT CONFIG BUILDERS
  // ============================================================================

  List<InputConfig> createRentOutConfig({bool includeRooms = true}) {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutUnitInformationInputs(includeRooms: includeRooms),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutDuplexConfig({bool includeRooms = true}) {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutDuplexUnitInformationInputs(includeRooms: includeRooms),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutVillasConfig() {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutVillaUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutPenthousesConfig() {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutPenthouseUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutTwinHousesConfig() {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutHouseUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutTownHousesConfig() {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutHouseUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutStandaloneVillasConfig() {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutHouseUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutAdministrativeUnitsConfig() {
    return [
      ...createRentOutAdministrativeUnitsLocationInputs(),
      ...createRentOutCommercialUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutMedicalClinicsConfig() {
    return [
      ...createRentOutAdministrativeUnitsLocationInputs(),
      ...createRentOutCommercialUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutPharmaciesConfig() {
    return [
      ...createRentOutAdministrativeUnitsLocationInputs(),
      ...createRentOutPharmacyUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutCommercialStoresConfig() {
    return [
      ...createRentOutAdministrativeUnitsLocationInputs(),
      ...createRentOutCommercialStoreUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutCommercialAdministrativeBuildingsConfig() {
    return [
      ...createRentOutLocationInputs(),
      ...createRentOutCommercialAdministrativeBuildingUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutVacationVillasAndChaletsConfig() {
    return [
      ...createRentOutSpecificLocationInputs(),
      ...createRentOutVacationVillasAndChaletsUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutSpecificFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutSChaletsConfig() {
    return [
      ...createRentOutSpecificLocationInputs(),
      ...createRentOutSChaletsUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutSpecificFinancialInputs(),
    ];
  }

  List<InputConfig> createRentOutHotelsConfig() {
    return [
      ...createRentOutSpecificLocationInputs(),
      ...createRentOutHotelsUnitInformationInputs(),
      ...createMediaInputs(),
      ...createRentOutSpecificFinancialInputs(),
    ];
  }

  // ============================================================================
  // PUBLIC API
  // ============================================================================

  List<StepperConfiguration> getInputConfigs() {
    return [
      // RENT-IN
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_apartments',
        inputs: createRentInConfig(includeRooms: true),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_duplexes',
        inputs: createRentInConfig(includeRooms: true),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_studios',
        inputs: createRentInConfig(includeRooms: false),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_i_villa',
        inputs: createRentInVillasConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_penthouses',
        inputs: createRentInPenthousesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_twin_houses',
        inputs: createRentInTwinHousesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_town_houses',
        inputs: createRentInTownHousesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_standalone_villas',
        inputs: createRentInStandaloneVillasConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_administrative_units',
        inputs: createRentInAdministrativeUnitsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_medical_clinics',
        inputs: createRentInMedicalClinicsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_pharmacies',
        inputs: createRentInPharmaciesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_commercial_stores',
        inputs: createRentInCommercialStoresConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_commercial_administrative_buildings',
        inputs: createRentInCommercialAdministrativeBuildingsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_vacation_villa',
        inputs: createRentInInsideCompoundVacationVillasAndChaletsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_chalets',
        inputs: createRentInChaletsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_in_hotels',
        inputs: createRentInHotelsConfig(),
      ),

      // RENT-OUT
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_apartments',
        inputs: createRentOutConfig(includeRooms: true),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_duplexes',
        inputs: createRentOutDuplexConfig(includeRooms: true),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_studios',
        inputs: createRentOutConfig(includeRooms: false),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_i_villa',
        inputs: createRentOutVillasConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_penthouses',
        inputs: createRentOutPenthousesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_twin_houses',
        inputs: createRentOutTwinHousesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_town_houses',
        inputs: createRentOutTownHousesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_standalone_villas',
        inputs: createRentOutStandaloneVillasConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_administrative_units',
        inputs: createRentOutAdministrativeUnitsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_medical_clinics',
        inputs: createRentOutMedicalClinicsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_pharmacies',
        inputs: createRentOutPharmaciesConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_commercial_stores',
        inputs: createRentOutCommercialStoresConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_commercial_administrative_buildings',
        inputs: createRentOutCommercialAdministrativeBuildingsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_vacation_villa',
        inputs: createRentOutVacationVillasAndChaletsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_chalets',
        inputs: createRentOutSChaletsConfig(),
      ),
      StepperConfiguration(
        key: 'rentals_inside_compound_rent_out_hotels',
        inputs: createRentOutHotelsConfig(),
      ),
    ];
  }

  List<String> getRentalConfigurationKeys() {
    return [
      // RENT-IN
      'rentals_inside_compound_rent_in_apartments',
      'rentals_inside_compound_rent_in_duplexes',
      'rentals_inside_compound_rent_in_studios',
      'rentals_inside_compound_rent_in_i_villa',
      'rentals_inside_compound_rent_in_penthouses',
      'rentals_inside_compound_rent_in_twin_houses',
      'rentals_inside_compound_rent_in_town_houses',
      'rentals_inside_compound_rent_in_standalone_villas',
      'rentals_inside_compound_rent_in_administrative_units',
      'rentals_inside_compound_rent_in_medical_clinics',
      'rentals_inside_compound_rent_in_pharmacies',
      'rentals_inside_compound_rent_in_commercial_stores',
      'rentals_inside_compound_rent_in_commercial_administrative_buildings',
      'rentals_inside_compound_rent_in_vacation_villa',
      'rentals_inside_compound_rent_in_chalets',
      'rentals_inside_compound_rent_in_hotels',

      // RENT-OUT
      'rentals_inside_compound_rent_out_apartments',
      'rentals_inside_compound_rent_out_duplexes',
      'rentals_inside_compound_rent_out_studios',
      'rentals_inside_compound_rent_out_i_villa',
      'rentals_inside_compound_rent_out_penthouses',
      'rentals_inside_compound_rent_out_twin_houses',
      'rentals_inside_compound_rent_out_town_houses',
      'rentals_inside_compound_rent_out_standalone_villas',
      'rentals_inside_compound_rent_out_administrative_units',
      'rentals_inside_compound_rent_out_medical_clinics',
      'rentals_inside_compound_rent_out_pharmacies',
      'rentals_inside_compound_rent_out_commercial_stores',
      'rentals_inside_compound_rent_out_vacation_villa',
      'rentals_inside_compound_rent_out_commercial_administrative_buildings',
      'rentals_inside_compound_rent_out_chalets',
      'rentals_inside_compound_rent_out_hotels',
    ];
  }

  bool isRentInConfiguration(String key) {
    return key.contains('_rent_in_');
  }

  bool isRentOutConfiguration(String key) {
    return key.contains('_rent_out_');
  }
}
