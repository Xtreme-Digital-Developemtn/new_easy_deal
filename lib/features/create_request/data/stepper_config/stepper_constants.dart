class OptionItem {
  final String key;
  final String value;
  const OptionItem({required this.key, required this.value});
}

class TranslatableOptionItem {
  final String key;
  final String value;
  final String? translationKey;
  const TranslatableOptionItem({required this.key, required this.value, this.translationKey});
}

const specializationScopeOptions = [
  TranslatableOptionItem(key: 'Purchase/ Sell Outside Compound', value: 'purchase_sell_outside_compound', translationKey: 'PURCHASE_SELL_OUTSIDE_COMPOUND'),
  TranslatableOptionItem(key: 'Primary Inside Compound', value: 'primary_inside_compound', translationKey: 'PRIMARY_INSIDE_COMPOUND'),
  TranslatableOptionItem(key: 'Resale Inside Compound', value: 'resale_inside_compound', translationKey: 'RESALE_INSIDE_COMPOUND'),
  TranslatableOptionItem(key: 'Rentals Outside Compound', value: 'rentals_outside_compound', translationKey: 'RENTALS_OUTSIDE_COMPOUND'),
  TranslatableOptionItem(key: 'Rentals Inside Compound', value: 'rentals_inside_compound', translationKey: 'RENTALS_INSIDE_COMPOUND'),
];

const typeOptions = [
  TranslatableOptionItem(key: 'Purchasing', value: 'purchasing', translationKey: 'PURCHASING'),
  TranslatableOptionItem(key: 'Sell', value: 'sell', translationKey: 'SELL'),
  TranslatableOptionItem(key: 'Rent Out', value: 'rent_out', translationKey: 'RENT_OUT'),
  TranslatableOptionItem(key: 'Rent In', value: 'rent_in', translationKey: 'RENT_IN'),
];

const floorTypesOptions = [
  OptionItem(key: 'Ground Floor', value: 'ground'),
  OptionItem(key: 'Last Floor', value: 'last_floor'),
  OptionItem(key: 'Repeated', value: 'repeated'),
  OptionItem(key: 'All The Above Are Suitable', value: 'all_the_above_are_suitable'),
];

const sellFloorTypesOptions = [
  OptionItem(key: 'Ground Floor', value: 'ground'),
  OptionItem(key: 'Last Floor', value: 'last_floor'),
  OptionItem(key: 'Repeated', value: 'repeated'),
];

const buildingLicenseTypesOptions = [
  OptionItem(key: 'Permit Available', value: 'Permit_Available'),
  OptionItem(key: 'No Permit', value: 'No_Permit'),
];

const unitLayoutStatusTypesOptions = [
  OptionItem(key: 'Partial Roof', value: 'partial_roof'),
  OptionItem(key: 'Full Roof', value: 'full_roof'),
  OptionItem(key: 'Open Space', value: 'open_space'),
  OptionItem(key: 'Single Apartment', value: 'single_apartment'),
  OptionItem(key: 'Two Apartments', value: 'two_apartments'),
  OptionItem(key: 'All Acceptable', value: 'all_acceptable'),
];

const roofUnitLayoutStatusTypesOptions = [
  OptionItem(key: 'Partial Roof', value: 'partial_roof'),
  OptionItem(key: 'Full Roof', value: 'full_roof'),
  OptionItem(key: 'Single Apartment', value: 'single_apartment'),
  OptionItem(key: 'Two Apartments', value: 'two_apartments'),
];

const sellRoofUnitLayoutStatusTypesOptions = [
  OptionItem(key: 'Partial Roof', value: 'partial_roof'),
  OptionItem(key: 'Full Roof', value: 'full_roof'),
];

const purchaseRoofUnitLayoutStatusTypesOptions = [
  OptionItem(key: 'Partial Roof', value: 'partial_roof'),
  OptionItem(key: 'Full Roof', value: 'full_roof'),
  OptionItem(key: 'All Acceptable', value: 'all_acceptable'),
];

const basementUnitLayoutStatusTypesOptions = [
  OptionItem(key: 'Open Space', value: 'open_space'),
  OptionItem(key: 'Single Apartment', value: 'single_apartment'),
  OptionItem(key: 'Two Apartments', value: 'two_apartments'),
];

const buildingLayoutStatusTypesOptions = [
  OptionItem(key: 'Open Space', value: 'open_space'),
  OptionItem(key: 'Single Apartment', value: 'single_apartment'),
  OptionItem(key: 'Two Apartments', value: 'two_apartments'),
  OptionItem(key: 'All Acceptable', value: 'all_acceptable'),
];

const sellOutBuildingLayoutStatusTypesOptions = [
  OptionItem(key: 'Open Space', value: 'open_space'),
  OptionItem(key: 'Fully Built ', value: 'fully_built'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
];

const sellOutAdministrativeBuildingLayoutStatusTypesOptions = [
  OptionItem(key: 'Fully Built ', value: 'fully_built'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
];

const specialRentBuildingLayoutStatusTypesOptions = [
  OptionItem(key: 'Open Space', value: 'open_space'),
  OptionItem(key: 'Fully Built ', value: 'fully_built'),
];

const rentBuildingLayoutStatusTypesOptions = [
  OptionItem(key: 'Open Space', value: 'open_space'),
  OptionItem(key: 'Fully Built ', value: 'fully_built'),
  OptionItem(key: 'All Acceptable', value: 'all_acceptable'),
];

const landOutBuildingLayoutStatusTypesOptions = [
  OptionItem(key: 'Open Space', value: 'open_space'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
];

const groundLayoutStatusTypesOptions = [
  OptionItem(key: 'Vacant Land', value: 'vacant_land'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
  OptionItem(key: 'Fully Built', value: 'fully_built'),
  OptionItem(key: 'All Acceptable', value: 'all_acceptable'),
];

const unitDesignTypesOptions = [
  OptionItem(key: 'Custom Design', value: 'custom_design'),
  OptionItem(key: 'One Apartment Per Floor', value: 'one_apartment_per_floor'),
  OptionItem(key: 'Two Apartments Per Floor', value: 'two_apartments_per_floor'),
  OptionItem(key: 'More Than Two Apartments Per Floor', value: 'more_than_two_apartments_per_floor'),
];

const sellUnitDesignTypesOptions = [
  OptionItem(key: 'Custom Design', value: 'custom_design'),
  OptionItem(key: 'One Apartment Per Floor', value: 'one_apartment_per_floor'),
  OptionItem(key: 'Two Apartments Per Floor', value: 'two_apartments_per_floor'),
  OptionItem(key: 'More Than Two Apartments Per Floor', value: 'more_than_two_apartments_per_floor'),
];

const activityTypesOptions = [
  OptionItem(key: 'Administrative Only', value: 'administrative_only'),
  OptionItem(key: 'Commercial Only', value: 'commercial_only'),
  OptionItem(key: 'Medical Only', value: 'medical_only'),
  OptionItem(key: 'Administrative and Commercial', value: 'administrative_and_commercial'),
  OptionItem(key: 'Administrative, Commercial and Medical', value: 'administrative_commercial_and_medical'),
];

const unitDescriptionTypesOptions = [
  OptionItem(key: 'Single Front', value: 'single_front'),
  OptionItem(key: 'Corner', value: 'corner'),
  OptionItem(key: 'Double Front', value: 'double_front'),
  OptionItem(key: 'Triple Corner', value: 'triple_corner'),
  OptionItem(key: 'Quad Corner', value: 'quad_corner'),
  OptionItem(key: 'All Acceptable', value: 'all_acceptable'),
];

const sellUnitDescriptionTypesOptions = [
  OptionItem(key: 'Single Front', value: 'single_front'),
  OptionItem(key: 'Corner', value: 'corner'),
  OptionItem(key: 'Double Front', value: 'double_front'),
  OptionItem(key: 'Triple Corner', value: 'triple_corner'),
  OptionItem(key: 'Quad Corner', value: 'quad_corner'),
];

const sellVillaUnitDescriptionTypesOptions = [
  OptionItem(key: 'Single Front', value: 'single_front'),
  OptionItem(key: 'Corner', value: 'corner'),
  OptionItem(key: 'Double Front', value: 'double_front'),
  OptionItem(key: 'Triple Corner', value: 'triple_corner'),
];

const paymentMethodOptions = [
  OptionItem(key: 'Cash', value: 'cash'),
  OptionItem(key: 'Installment', value: 'installment'),
  OptionItem(key: 'Both', value: 'all_of_the_above_are_suitable'),
];

const paymentMethodPrimarySellOptions = [
  OptionItem(key: 'Cash', value: 'cash'),
  OptionItem(key: 'Installment', value: 'installment'),
];

const requiredInsuranceTypesOptions = [
  OptionItem(key: 'One Month', value: 'one_month'),
  OptionItem(key: 'Two Months', value: 'two_months'),
  OptionItem(key: 'Fixed Amount', value: 'fixed_amount'),
];

const otherExpensesOptions = [
  OptionItem(key: 'Other', value: 'other'),
  OptionItem(key: 'Electricity', value: 'electricity'),
  OptionItem(key: 'Gas', value: 'gas'),
  OptionItem(key: 'Water', value: 'water'),
  OptionItem(key: 'Security Maintenance', value: 'security_maintenance'),
];

const otherExpensesOptionsWithoutOther = [
  OptionItem(key: 'Electricity', value: 'electricity'),
  OptionItem(key: 'Gas', value: 'gas'),
  OptionItem(key: 'Water', value: 'water'),
  OptionItem(key: 'Security Maintenance', value: 'security_maintenance'),
];

const furnishingStatusOptions = [
  OptionItem(key: 'Unfurnished', value: 'unfurnished'),
  OptionItem(key: 'Furnished with Air Conditioners', value: 'furnished_with_air_conditioners'),
  OptionItem(key: 'Furnished without Air Conditioners', value: 'furnished_without_air_conditioners'),
];

const sellHotelFurnishingStatusOptions = [
  OptionItem(key: 'Furnished with Air Conditioners', value: 'furnished_with_air_conditioners'),
  OptionItem(key: 'Furnished without Air Conditioners', value: 'furnished_without_air_conditioners'),
];

const allFurnishingStatusOptions = [
  OptionItem(key: 'Unfurnished', value: 'unfurnished'),
  OptionItem(key: 'Furnished with Air Conditioners', value: 'furnished_with_air_conditioners'),
  OptionItem(key: 'Furnished without Air Conditioners', value: 'furnished_without_air_conditioners'),
  OptionItem(key: 'ALL OF THE ABOVE', value: 'all_of_the_above'),
];

const hotelFurnishingStatusOptions = [
  OptionItem(key: 'Furnished with Air Conditioners', value: 'furnished_with_air_conditioners'),
  OptionItem(key: 'Furnished without Air Conditioners', value: 'furnished_without_air_conditioners'),
  OptionItem(key: 'ALL OF THE ABOVE', value: 'all_of_the_above'),
];

const deliveryStatusTypesOptions = [
  OptionItem(key: 'Immediate Delivery', value: 'immediate_delivery'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
];

const landDeliveryStatusTypesOptions = [
  OptionItem(key: 'Delivered', value: 'delivered'),
  OptionItem(key: 'Not Delivered Yet', value: 'not_delivered_yet'),
];

const purchaseLandDeliveryStatusTypesOptions = [
  OptionItem(key: 'Delivered', value: 'delivered'),
  OptionItem(key: 'Not Delivered Yet', value: 'not_delivered_yet'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const purchaseDeliveryStatusTypesOptions = [
  OptionItem(key: 'Immediate Delivery', value: 'immediate_delivery'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const buildingStatusTypesOptions = [
  OptionItem(key: 'Fully Built', value: 'fully_built'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
];

const purchaseBuildingStatusTypesOptions = [
  OptionItem(key: 'Fully Built', value: 'fully_built'),
  OptionItem(key: 'Under Construction', value: 'under_construction'),
  OptionItem(key: 'All Of Above', value: 'all_acceptable'),
];

const financialStatusTypesOptions = [
  OptionItem(key: 'Paid in Full', value: 'paid_in_full'),
  OptionItem(key: 'Partially Paid with Remaining Installments', value: 'partially_paid_with_remaining_installments'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const financialStatusSellTypesOptions = [
  OptionItem(key: 'Paid in Full', value: 'paid_in_full'),
  OptionItem(key: 'Partially Paid with Remaining Installments', value: 'partially_paid_with_remaining_installments'),
];

const legalStatusTypesOptions = [
  OptionItem(key: 'Licensed', value: 'licensed'),
  OptionItem(key: 'Reconciled', value: 'reconciled'),
  OptionItem(key: 'Reconciliation Required', value: 'reconciliation_required'),
];

const fitOutConditionTypesOptions = [
  OptionItem(key: 'Unfitted', value: 'unfitted'),
  OptionItem(key: 'Fully Fitted', value: 'fully_fitted'),
  OptionItem(key: 'All The Above Are Suitable', value: 'all_the_above_are_suitable'),
];

const sellFitOutConditionTypesOptions = [
  OptionItem(key: 'Unfitted', value: 'unfitted'),
  OptionItem(key: 'Fully Fitted', value: 'fully_fitted'),
];

const finishingStatusTypesOptions = [
  OptionItem(key: 'On Brick', value: 'on_brick'),
  OptionItem(key: 'Semi Finished', value: 'semi_finished'),
  OptionItem(key: 'Company Finished', value: 'company_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
];

const pharmacyFinishingStatusTypesOptions = [
  OptionItem(key: 'Semi Finished', value: 'semi_finished'),
  OptionItem(key: 'Full Finished', value: 'full_finished'),
];

const buildRentFinishingStatusTypesOptions = [
  OptionItem(key: 'Semi Finished', value: 'semi_finished'),
  OptionItem(key: 'Full Finished', value: 'full_finished'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const rentalFinishingStatusTypesOptions = [
  OptionItem(key: 'Full Finished', value: 'full_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
];

const allRentalFinishingStatusTypesOptions = [
  OptionItem(key: 'Full Finished', value: 'full_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const specialRentalFinishingStatusTypesOptions = [
  OptionItem(key: 'Company Finished', value: 'company_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
];

const companySpecialRentalFinishingStatusTypesOptions = [
  OptionItem(key: 'Company Finished', value: 'company_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const rentalinFinishingStatusTypesOptions = [
  OptionItem(key: 'Full Finished', value: 'full_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const purchaseFinishingStatusTypesOptions = [
  OptionItem(key: 'On Brick', value: 'on_brick'),
  OptionItem(key: 'Semi Finished', value: 'semi_finished'),
  OptionItem(key: 'Company Finished', value: 'company_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const purchaseChaletsOutsideFinishingStatusTypesOptions = [
  OptionItem(key: 'Semi Finished', value: 'semi_finished'),
  OptionItem(key: 'Company Finished', value: 'company_finished'),
  OptionItem(key: 'Super Lux', value: 'super_lux'),
  OptionItem(key: 'Ultra Super Lux', value: 'ultra_super_lux'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const specificFinishingStatusTypesOptions = [
  OptionItem(key: 'On Brick', value: 'on_brick'),
  OptionItem(key: 'Semi Finished', value: 'semi_finished'),
  OptionItem(key: 'Full Finished', value: 'full_finished'),
];

const purchaseSpecificFinishingStatusTypesOptions = [
  OptionItem(key: 'On Brick', value: 'on_brick'),
  OptionItem(key: 'Semi Finished', value: 'semi_finished'),
  OptionItem(key: 'Full Finished', value: 'full_finished'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const unitViewTypesOptions = [
  OptionItem(key: 'Water View', value: 'water_view'),
  OptionItem(key: 'Gardens and Landscape', value: 'gardens_and_landscape'),
  OptionItem(key: 'Street', value: 'street'),
  OptionItem(key: 'Entertainment Area', value: 'entertainment_area'),
  OptionItem(key: 'Garden', value: 'garden'),
  OptionItem(key: 'Main Street', value: 'main_street'),
  OptionItem(key: 'Square', value: 'square'),
  OptionItem(key: 'Side Street', value: 'side_street'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
];

const purchaseUnitViewTypesOptions = [
  OptionItem(key: 'Water View', value: 'water_view'),
  OptionItem(key: 'Gardens and Landscape', value: 'gardens_and_landscape'),
  OptionItem(key: 'Street', value: 'street'),
  OptionItem(key: 'Entertainment Area', value: 'entertainment_area'),
  OptionItem(key: 'Garden', value: 'garden'),
  OptionItem(key: 'Main Street', value: 'main_street'),
  OptionItem(key: 'Square', value: 'square'),
  OptionItem(key: 'Side Street', value: 'side_street'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const specialPurchaseUnitViewTypesOptions = [
  OptionItem(key: 'Garden', value: 'garden'),
  OptionItem(key: 'Main Street', value: 'main_street'),
  OptionItem(key: 'Square', value: 'square'),
  OptionItem(key: 'Side Street', value: 'side_street'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const sellUnitViewTypesOptions = [
  OptionItem(key: 'Garden', value: 'garden'),
  OptionItem(key: 'Main Street', value: 'main_street'),
  OptionItem(key: 'Square', value: 'square'),
  OptionItem(key: 'Side Street', value: 'side_street'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
];

const specificRentalUnitViewTypesOptions = [
  OptionItem(key: 'Water View', value: 'water_view'),
  OptionItem(key: 'Gardens and Landscape', value: 'gardens_and_landscape'),
  OptionItem(key: 'Street', value: 'street'),
  OptionItem(key: 'Entertainment Area', value: 'entertainment_area'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const rentalUnitViewTypesOptions = [
  OptionItem(key: 'Water View', value: 'water_view'),
  OptionItem(key: 'Gardens and Landscape', value: 'gardens_and_landscape'),
  OptionItem(key: 'Street', value: 'street'),
  OptionItem(key: 'Entertainment Area', value: 'entertainment_area'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
];

const purchaseVacationUnitViewTypesOptions = [
  OptionItem(key: 'Main Street', value: 'main_street'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
  OptionItem(key: 'Swimming Pool', value: 'swimming_pool'),
  OptionItem(key: 'Garden', value: 'garden'),
  OptionItem(key: 'Water View', value: 'water_view'),
  OptionItem(key: 'All Of The Above', value: 'all_of_the_above'),
];

const sellVacationUnitViewTypesOptions = [
  OptionItem(key: 'Water View', value: 'water_view'),
  OptionItem(key: 'Gardens and Landscape', value: 'gardens_and_landscape'),
  OptionItem(key: 'Garden', value: 'garden'),
  OptionItem(key: 'Main Street', value: 'main_street'),
  OptionItem(key: 'Side Street', value: 'side_street'),
];

const unitFacingTypesOptions = [
  OptionItem(key: 'Right of Facade', value: 'right_of_facade'),
  OptionItem(key: 'Left of Facade', value: 'left_of_facade'),
  OptionItem(key: 'Side View', value: 'side_view'),
  OptionItem(key: 'Rear View', value: 'rear_view'),
];

const otherAccessoriesOptions = [
  OptionItem(key: 'Garage', value: 'garage'),
  OptionItem(key: 'Storage', value: 'storage'),
  OptionItem(key: 'Elevator', value: 'elevator'),
  OptionItem(key: 'Swimming Pool', value: 'swimming_pool'),
  OptionItem(key: 'Land Share', value: 'land_share'),
];

const insideCompoundOtherAccessoriesOptions = [
  OptionItem(key: 'Garage', value: 'garage'),
  OptionItem(key: 'Storage', value: 'storage'),
  OptionItem(key: 'Elevator', value: 'elevator'),
  OptionItem(key: 'Swimming Pool', value: 'swimming_pool'),
];

const specificOtherAccessoriesOptions = [
  OptionItem(key: 'Garage', value: 'garage'),
  OptionItem(key: 'Storage', value: 'storage'),
  OptionItem(key: 'Elevator', value: 'elevator'),
  OptionItem(key: 'Swimming Pool', value: 'swimming_pool'),
];

const purchaseOtherAccessoriesOptions = [
  OptionItem(key: 'Garage', value: 'garage'),
  OptionItem(key: 'Storage', value: 'storage'),
  OptionItem(key: 'Elevator', value: 'elevator'),
];

const sellOutOtherAccessoriesOptions = [
  OptionItem(key: 'Garage', value: 'garage'),
  OptionItem(key: 'Storage', value: 'storage'),
  OptionItem(key: 'Elevator', value: 'elevator'),
  OptionItem(key: 'Land Share', value: 'land_share'),
  OptionItem(key: 'Security Maintenance', value: 'security_maintenance'),
];

const pharmacySellOutOtherAccessoriesOptions = [
  OptionItem(key: 'Garage', value: 'garage'),
  OptionItem(key: 'Elevator', value: 'elevator'),
  OptionItem(key: 'Security Maintenance', value: 'security_maintenance'),
];

const buildingDeadlineTypesOptions = [
  OptionItem(key: 'Grace Period Allowed', value: 'grace_period_allowed'),
  OptionItem(key: 'No Grace Period', value: 'no_grace_period'),
];

const rentRecurrenceOptions = [
  OptionItem(key: 'Monthly', value: 'monthly'),
  OptionItem(key: 'Quarterly', value: 'quarterly'),
  OptionItem(key: 'Semi Annually', value: 'semi_annually'),
  OptionItem(key: 'Daily', value: 'daily'),
  OptionItem(key: 'Annually', value: 'annually'),
];

const createRentOutOutsideCompoundFinancialInputsWithoutDaily = [
  OptionItem(key: 'Monthly', value: 'monthly'),
  OptionItem(key: 'Quarterly', value: 'quarterly'),
  OptionItem(key: 'Semi Annually', value: 'semi_annually'),
  OptionItem(key: 'Annually', value: 'annually'),
];

const rentDurationOptions = [
  OptionItem(key: 'Monthly', value: 'monthly'),
  OptionItem(key: 'Daily', value: 'daily'),
];
