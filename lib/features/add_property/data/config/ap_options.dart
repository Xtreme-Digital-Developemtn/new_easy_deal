import 'ap_option_item.dart';

/// All option arrays for the add-property stepper plus the dynamic resolvers
/// that swap them based on (compoundType, unitOperation, unitType).
///
/// Faithful port of the option arrays and the `update*` / `filter*` methods in
/// `add-property-in-crm.component.ts`.
class ApOptions {
  ApOptions._();

  // ---------------------------------------------------------------------------
  // Step 0 – category dropdowns
  // ---------------------------------------------------------------------------
  static const compoundTypes = <ApOptionItem>[
    ApOptionItem(value: 'outside_compound', ar: 'خارج كمبوند', en: 'Outside Compound'),
    ApOptionItem(value: 'inside_compound', ar: 'داخل كمبوند', en: 'Inside Compound'),
  ];

  static const propertyOperations = <ApOptionItem>[
    ApOptionItem(value: 'sell', ar: 'بيع', en: 'Sell'),
    ApOptionItem(value: 'rent_out', ar: 'إيجار', en: 'Rent'),
  ];

  // ---------------------------------------------------------------------------
  // Unit types filtered by (operation, compound) – filterUnitTypes()
  // ---------------------------------------------------------------------------
  static const _outsideCompoundUnitTypes = <ApOptionItem>[
    ApOptionItem(value: 'apartments', ar: 'شقة', en: 'Apartments'),
    ApOptionItem(value: 'duplexes', ar: 'دوبلكس', en: 'Duplexes'),
    ApOptionItem(value: 'studios', ar: 'ستوديو', en: 'Studios'),
    ApOptionItem(value: 'penthouses', ar: 'بنت هاوس', en: 'Penthouses'),
    ApOptionItem(value: 'basements', ar: 'بيزمنت', en: 'Basement'),
    ApOptionItem(value: 'roofs', ar: 'روف', en: 'Roofs'),
    ApOptionItem(value: 'villas', ar: 'فيلا', en: 'Villas'),
    ApOptionItem(value: 'residential_buildings', ar: 'عمارة سكنية', en: 'Residential Buildings'),
    ApOptionItem(value: 'administrative_units', ar: 'وحدة إدارية', en: 'Administrative Units'),
    ApOptionItem(value: 'medical_clinics', ar: 'عيادة طبية', en: 'Medical Clinics'),
    ApOptionItem(value: 'commercial_stores', ar: 'محل تجاري', en: 'Commercial Stores'),
    ApOptionItem(value: 'pharmacies', ar: 'صيدلية', en: 'Pharmacies'),
    ApOptionItem(value: 'commercial_administrative_buildings', ar: 'مبنى إدارى تجارى', en: 'Commercial Administrative Buildings'),
    ApOptionItem(value: 'warehouse_lands', ar: 'مخزن او ارض مخزن', en: 'Warehouses'),
    ApOptionItem(value: 'factory_lands', ar: 'مصنع او ارض مصنع', en: 'Factories'),
    ApOptionItem(value: 'residential_lands', ar: 'أرض سكنية', en: 'Residential Lands'),
    ApOptionItem(value: 'commercial_administrative_lands', ar: 'أراضي إدارية تجارية', en: 'Commercial Administrative Lands'),
    ApOptionItem(value: 'chalets', ar: 'شاليه مصيفي', en: 'Chalets'),
    ApOptionItem(value: 'vacation_villa', ar: 'فيلا مصيفية', en: 'Vacation Villa'),
  ];

  static const _insideCompoundUnitTypes = <ApOptionItem>[
    ApOptionItem(value: 'apartments', ar: 'شقة', en: 'Apartments'),
    ApOptionItem(value: 'duplexes', ar: 'دوبلكس', en: 'Duplexes'),
    ApOptionItem(value: 'studios', ar: 'ستوديو', en: 'Studios'),
    ApOptionItem(value: 'penthouses', ar: 'بنت هاوس', en: 'Penthouses'),
    ApOptionItem(value: 'i_villa', ar: 'اى فيلا', en: 'I Villa'),
    ApOptionItem(value: 'standalone_villas', ar: 'ستاند الون فيلا', en: 'Standalone Villas'),
    ApOptionItem(value: 'town_houses', ar: 'تاون هاوس', en: 'Town Houses'),
    ApOptionItem(value: 'twin_houses', ar: 'توين هاوس', en: 'Twin Houses'),
    ApOptionItem(value: 'administrative_units', ar: 'وحدة إدارية', en: 'Administrative Units'),
    ApOptionItem(value: 'medical_clinics', ar: 'عيادة طبية', en: 'Medical Clinics'),
    ApOptionItem(value: 'commercial_stores', ar: 'محل تجاري', en: 'Commercial Stores'),
    ApOptionItem(value: 'pharmacies', ar: 'صيدلية', en: 'Pharmacies'),
    ApOptionItem(value: 'commercial_administrative_buildings', ar: 'مبنى إدارى تجارى', en: 'Commercial Administrative Buildings'),
    ApOptionItem(value: 'chalets', ar: 'شاليه مصيفي', en: 'Chalets'),
    ApOptionItem(value: 'vacation_villa', ar: 'فيلا مصيفية', en: 'Vacation Villa'),
  ];

  static const _rentalOutsideCompoundUnitTypes = <ApOptionItem>[
    ApOptionItem(value: 'hotels', ar: 'وحدة فندقية', en: 'Hotels'),
    ApOptionItem(value: 'apartments', ar: 'شقة', en: 'Apartments'),
    ApOptionItem(value: 'duplexes', ar: 'دوبلكس', en: 'Duplexes'),
    ApOptionItem(value: 'studios', ar: 'ستوديو', en: 'Studios'),
    ApOptionItem(value: 'penthouses', ar: 'بنت هاوس', en: 'Penthouses'),
    ApOptionItem(value: 'basements', ar: 'بيزمنت', en: 'Basement'),
    ApOptionItem(value: 'roofs', ar: 'روف', en: 'Roofs'),
    ApOptionItem(value: 'villas', ar: 'فيلا', en: 'Villas'),
    ApOptionItem(value: 'residential_buildings', ar: 'عمارة سكنية', en: 'Residential Buildings'),
    ApOptionItem(value: 'administrative_units', ar: 'وحدة إدارية', en: 'Administrative Units'),
    ApOptionItem(value: 'medical_clinics', ar: 'عيادة طبية', en: 'Medical Clinics'),
    ApOptionItem(value: 'commercial_stores', ar: 'محل تجاري', en: 'Commercial Stores'),
    ApOptionItem(value: 'pharmacies', ar: 'صيدلية', en: 'Pharmacies'),
    ApOptionItem(value: 'commercial_administrative_buildings', ar: 'مبنى إدارى تجارى', en: 'Commercial Administrative Buildings'),
    ApOptionItem(value: 'warehouse_lands', ar: 'مخزن او ارض مخزن', en: 'Warehouses'),
    ApOptionItem(value: 'factory_lands', ar: 'مصنع او ارض مصنع', en: 'Factories'),
    ApOptionItem(value: 'chalets', ar: 'شاليه مصيفي', en: 'Chalets'),
    ApOptionItem(value: 'vacation_villa', ar: 'فيلا مصيفية', en: 'Vacation Villa'),
  ];

  static const _rentalInsideCompoundUnitTypes = <ApOptionItem>[
    ApOptionItem(value: 'hotels', ar: 'وحدة فندقية', en: 'Hotels'),
    ApOptionItem(value: 'apartments', ar: 'شقة', en: 'Apartments'),
    ApOptionItem(value: 'duplexes', ar: 'دوبلكس', en: 'Duplexes'),
    ApOptionItem(value: 'studios', ar: 'ستوديو', en: 'Studios'),
    ApOptionItem(value: 'penthouses', ar: 'بنت هاوس', en: 'Penthouses'),
    ApOptionItem(value: 'i_villa', ar: 'اى فيلا', en: 'I Villa'),
    ApOptionItem(value: 'twin_houses', ar: 'توين هاوس', en: 'Twin Houses'),
    ApOptionItem(value: 'town_houses', ar: 'تاون هاوس', en: 'Town Houses'),
    ApOptionItem(value: 'standalone_villas', ar: 'ستاند الون فيلا', en: 'Standalone Villas'),
    ApOptionItem(value: 'administrative_units', ar: 'وحدة إدارية', en: 'Administrative Units'),
    ApOptionItem(value: 'medical_clinics', ar: 'عيادة طبية', en: 'Medical Clinics'),
    ApOptionItem(value: 'commercial_stores', ar: 'محل تجاري', en: 'Commercial Stores'),
    ApOptionItem(value: 'pharmacies', ar: 'صيدلية', en: 'Pharmacies'),
    ApOptionItem(value: 'commercial_administrative_buildings', ar: 'مبنى إدارى تجارى', en: 'Commercial Administrative Buildings'),
    ApOptionItem(value: 'chalets', ar: 'شاليه مصيفي', en: 'Chalets'),
    ApOptionItem(value: 'vacation_villa', ar: 'فيلا مصيفية', en: 'Vacation Villa'),
  ];

  static List<ApOptionItem> unitTypesFor(String? compound, String? operation) {
    if (operation == 'rent_out' && compound == 'inside_compound') {
      return _rentalInsideCompoundUnitTypes;
    } else if (operation == 'rent_out' && compound == 'outside_compound') {
      return _rentalOutsideCompoundUnitTypes;
    } else if (compound == 'outside_compound' && operation == 'sell') {
      return _outsideCompoundUnitTypes;
    } else if (compound == 'inside_compound' && operation == 'sell') {
      return _insideCompoundUnitTypes;
    }
    return const [];
  }

  // ---------------------------------------------------------------------------
  // Static option arrays
  // ---------------------------------------------------------------------------
  static const floorTypes = <ApOptionItem>[
    ApOptionItem(value: 'ground', ar: 'أرضي', en: 'Ground'),
    ApOptionItem(value: 'last_floor', ar: 'الطابق الأخير', en: 'Last Floor'),
    ApOptionItem(value: 'repeated', ar: 'متكرر', en: 'Repeated'),
  ];

  static const unitFacingTypes = <ApOptionItem>[
    ApOptionItem(value: 'right_of_facade', ar: 'يمين الناظر للواجهه', en: 'Right Of Facade'),
    ApOptionItem(value: 'left_of_facade', ar: 'يسار الناظر للواجهه', en: 'Left Of Facade'),
    ApOptionItem(value: 'side_view', ar: 'إطلالة جانبية', en: 'Side View'),
    ApOptionItem(value: 'rear_view', ar: 'داخلية', en: 'Rear View'),
  ];

  static const unitDescriptionTypes = <ApOptionItem>[
    ApOptionItem(value: 'single_front', ar: 'واجهة واحدة', en: 'Single Front'),
    ApOptionItem(value: 'corner', ar: 'ناصية', en: 'Corner'),
    ApOptionItem(value: 'double_front', ar: 'واجهتين', en: 'Double Front'),
    ApOptionItem(value: 'triple_corner', ar: 'ثلاث واجهات', en: 'Triple Corner'),
  ];

  static const activityTypes = <ApOptionItem>[
    ApOptionItem(value: 'administrative_only', ar: 'إداري فقط', en: 'Administrative Only'),
    ApOptionItem(value: 'commercial_only', ar: 'تجاري فقط', en: 'Commercial Only'),
    ApOptionItem(value: 'medical_only', ar: 'طبي فقط', en: 'Medical Only'),
    ApOptionItem(value: 'administrative_and_commercial', ar: 'إداري وتجاري', en: 'Administrative And Commercial'),
    ApOptionItem(value: 'administrative_commercial_and_medical', ar: 'إداري وتجاري وطبي', en: 'Administrative Commercial And Medical'),
  ];

  static const fitOutConditionTypes = <ApOptionItem>[
    ApOptionItem(value: 'unfitted', ar: 'غير مجهز', en: 'Unfitted'),
    ApOptionItem(value: 'fully_fitted', ar: 'مجهز بالكامل', en: 'Fully Fitted'),
  ];

  static const groundLayoutStatusTypes = <ApOptionItem>[
    ApOptionItem(value: 'vacant_land', ar: 'أرض فضاء', en: 'Vacant Land'),
    ApOptionItem(value: 'under_construction', ar: 'تحت الإنشاء', en: 'Under Construction'),
    ApOptionItem(value: 'fully_built', ar: 'مبني بالكامل', en: 'Fully Built'),
  ];

  static const unitDesignTypes = <ApOptionItem>[
    ApOptionItem(value: 'custom_design', ar: 'تصميم خاص', en: 'Custom Design'),
    ApOptionItem(value: 'one_apartment_per_floor', ar: 'شقة واحدة بالدور', en: 'One Apartment Per Floor'),
    ApOptionItem(value: 'two_apartments_per_floor', ar: 'شقتان بالدور', en: 'Two Apartments Per Floor'),
    ApOptionItem(value: 'more_than_two_apartments_per_floor', ar: 'أكثر من شقتين بالدور', en: 'More Than Two Apartments Per Floor'),
  ];

  static const legalTypes = <ApOptionItem>[
    ApOptionItem(value: 'licensed', ar: 'مرخص', en: 'Licensed'),
    ApOptionItem(value: 'reconciled', ar: 'مصالح عليه', en: 'Reconciled'),
    ApOptionItem(value: 'reconciliation_required', ar: 'يتطلب مصالحة', en: 'Reconciliation Required'),
  ];

  static const financialStatusTypes = <ApOptionItem>[
    ApOptionItem(value: 'paid_in_full', ar: 'مدفوع بالكامل', en: 'Paid In Full'),
    ApOptionItem(value: 'partially_paid_with_remaining_installments', ar: 'مدفوع جزئياً مع أقساط متبقية', en: 'Partially Paid With Remaining Installments'),
  ];

  static const buildingDeadlineTypes = <ApOptionItem>[
    ApOptionItem(value: 'grace_period_allowed', ar: 'يسمح بفترة سماح', en: 'Grace Period Allowed'),
    ApOptionItem(value: 'no_grace_period', ar: 'بدون فترة سماح', en: 'No Grace Period'),
  ];

  static const buildingLicenseTypes = <ApOptionItem>[
    ApOptionItem(value: 'Permit_Available', ar: 'يوجد ترخيص', en: 'Permit Available'),
    ApOptionItem(value: 'No_Permit', ar: 'بدون ترخيص', en: 'No Permit'),
  ];

  static const paymentTypes = <ApOptionItem>[
    ApOptionItem(value: 'cash', ar: 'نقداً', en: 'Cash'),
    ApOptionItem(value: 'installment', ar: 'تقسيط', en: 'Installment'),
  ];

  static const rentRecurrenceTypes = <ApOptionItem>[
    ApOptionItem(value: 'monthly', ar: 'شهري', en: 'Monthly'),
    ApOptionItem(value: 'daily', ar: 'يومي', en: 'Daily'),
    ApOptionItem(value: 'annually', ar: 'سنوي', en: 'Annually'),
  ];

  static const requiredInsuranceTypes = <ApOptionItem>[
    ApOptionItem(value: 'one_month', ar: 'شهر واحد', en: 'One Month'),
    ApOptionItem(value: 'two_months', ar: 'شهرين', en: 'Two Months'),
    ApOptionItem(value: 'fixed_amount', ar: 'مبلغ ثابت', en: 'Fixed Amount'),
  ];

  static const allTheAboveAreSuitable =
      ApOptionItem(value: 'all_the_above_are_suitable', ar: 'كل ما سبق مناسب', en: 'All The Above Are Suitable');

  // ---------------------------------------------------------------------------
  // View types – updateViewTypes()
  // ---------------------------------------------------------------------------
  static const _outsideCompoundViewTypes = <ApOptionItem>[
    ApOptionItem(value: 'garden', ar: 'حديقة', en: 'Garden'),
    ApOptionItem(value: 'main_street', ar: 'شارع رئيسي', en: 'Main Street'),
    ApOptionItem(value: 'square', ar: 'ميدان', en: 'Square'),
    ApOptionItem(value: 'side_street', ar: 'شارع جانبي', en: 'Side Street'),
    ApOptionItem(value: 'rear_view', ar: 'داخلية', en: 'Rear View'),
  ];

  static const _insideCompoundViewTypes = <ApOptionItem>[
    ApOptionItem(value: 'water_view', ar: 'اطلاله مائيه', en: 'Water View'),
    ApOptionItem(value: 'gardens_and_landscape', ar: 'حدائق ولاندسكيب', en: 'Gardens And Landscape'),
    ApOptionItem(value: 'street', ar: 'شارع', en: 'Street'),
    ApOptionItem(value: 'entertainment_area', ar: 'منطقة ترفيهية', en: 'Entertainment Area'),
  ];

  static const _chaletViewTypes = <ApOptionItem>[
    ApOptionItem(value: 'water_view', ar: 'اطلاله مائيه', en: 'Water View'),
    ApOptionItem(value: 'garden', ar: 'حديقة', en: 'Garden'),
    ApOptionItem(value: 'main_street', ar: 'شارع رئيسي', en: 'Main Street'),
    ApOptionItem(value: 'rear_view', ar: 'داخلية', en: 'Rear View'),
  ];

  static List<ApOptionItem> viewTypesFor(String? compound, String? unitType) {
    if (unitType == 'chalets' || unitType == 'vacation_villa') {
      return _chaletViewTypes;
    } else if (compound == 'outside_compound') {
      if (unitType == 'villas' || unitType == 'residential_buildings') {
        return _outsideCompoundViewTypes.where((v) => v.value != 'rear_view').toList();
      }
      return _outsideCompoundViewTypes;
    } else if (compound == 'inside_compound') {
      return _insideCompoundViewTypes;
    }
    return _outsideCompoundViewTypes;
  }

  // ---------------------------------------------------------------------------
  // Finishing types – updateFinishingTypes()
  // ---------------------------------------------------------------------------
  static const _allFinishingType = <ApOptionItem>[
    ApOptionItem(value: 'on_brick', ar: 'على الطوب', en: 'On Brick'),
    ApOptionItem(value: 'semi_finished', ar: 'نصف تشطيب', en: 'Semi Finished'),
    ApOptionItem(value: 'company_finished', ar: 'تشطيب شركة', en: 'Company Finished'),
    ApOptionItem(value: 'super_lux', ar: 'سوبر لوكس', en: 'Super Lux'),
    ApOptionItem(value: 'ultra_super_lux', ar: 'الترا سوبر لوكس', en: 'Ultra Super Lux'),
  ];

  static const _chaletsFinishingType = <ApOptionItem>[
    ApOptionItem(value: 'semi_finished', ar: 'نصف تشطيب', en: 'Semi Finished'),
    ApOptionItem(value: 'company_finished', ar: 'تشطيب شركة', en: 'Company Finished'),
    ApOptionItem(value: 'super_lux', ar: 'سوبر لوكس', en: 'Super Lux'),
    ApOptionItem(value: 'ultra_super_lux', ar: 'الترا سوبر لوكس', en: 'Ultra Super Lux'),
  ];

  static const _rentFinishingType = <ApOptionItem>[
    ApOptionItem(value: 'company_finished', ar: 'تشطيب شركة', en: 'Company Finished'),
    ApOptionItem(value: 'super_lux', ar: 'سوبر لوكس', en: 'Super Lux'),
    ApOptionItem(value: 'ultra_super_lux', ar: 'الترا سوبر لوكس', en: 'Ultra Super Lux'),
  ];

  static List<ApOptionItem> finishingTypesFor(String? operation, String? unitType) {
    if (unitType == 'pharmacies' || unitType == 'commercial_stores') {
      if (operation == 'sell') {
        return const [
          ApOptionItem(value: 'on_brick', ar: 'على الطوب', en: 'On Brick'),
          ApOptionItem(value: 'semi_finished', ar: 'نصف تشطيب', en: 'Semi Finished'),
          ApOptionItem(value: 'company_finished', ar: 'تشطيب شركة', en: 'Company Finished'),
        ];
      }
      return const [
        ApOptionItem(value: 'semi_finished', ar: 'نصف تشطيب', en: 'Semi Finished'),
        ApOptionItem(value: 'company_finished', ar: 'تشطيب شركة', en: 'Company Finished'),
      ];
    } else if (unitType == 'chalets' || unitType == 'vacation_villa') {
      if (operation == 'rent_out') {
        return _chaletsFinishingType.where((t) => t.value != 'semi_finished').toList();
      }
      return _chaletsFinishingType;
    } else if (operation == 'rent_out') {
      if (unitType == 'commercial_administrative_buildings') {
        return const [
          ApOptionItem(value: 'on_brick', ar: 'على الطوب', en: 'On Brick'),
          ApOptionItem(value: 'company_finished', ar: 'تشطيب شركة', en: 'Company Finished'),
        ];
      }
      return _rentFinishingType;
    }
    return _allFinishingType;
  }

  // ---------------------------------------------------------------------------
  // Furnishing types – updateFurnishingTypes()
  // ---------------------------------------------------------------------------
  static const _furnishingStatusTypesAll = <ApOptionItem>[
    ApOptionItem(value: 'unfurnished', ar: 'غير مفروش', en: 'Unfurnished'),
    ApOptionItem(value: 'furnished_with_air_conditioners', ar: 'مفروش بتكييفات', en: 'Furnished With Air Conditioners'),
    ApOptionItem(value: 'furnished_without_air_conditioners', ar: 'مفروش بدون تكييفات', en: 'Furnished Without Air Conditioners'),
  ];

  static const _furnishingStatusTypesHotels = <ApOptionItem>[
    ApOptionItem(value: 'furnished_with_air_conditioners', ar: 'مفروش بتكييفات', en: 'Furnished With Air Conditioners'),
    ApOptionItem(value: 'furnished_without_air_conditioners', ar: 'مفروش بدون تكييفات', en: 'Furnished Without Air Conditioners'),
  ];

  static List<ApOptionItem> furnishingTypesFor(String? operation, String? unitType) {
    if (unitType == 'hotels') return _furnishingStatusTypesHotels;
    if (operation == 'rent_out' && (unitType == 'chalets' || unitType == 'vacation_villa')) {
      return _furnishingStatusTypesHotels;
    }
    return _furnishingStatusTypesAll;
  }

  // ---------------------------------------------------------------------------
  // Delivery types – updateDeliveryTypes()
  // ---------------------------------------------------------------------------
  static const _allDeliveryTypes = <ApOptionItem>[
    ApOptionItem(value: 'immediate_delivery', ar: 'استلام فوري', en: 'Immediate Delivery'),
    ApOptionItem(value: 'under_construction', ar: 'تحت الإنشاء', en: 'Under Construction'),
  ];

  static const _landDeliveryTypes = <ApOptionItem>[
    ApOptionItem(value: 'delivered', ar: 'تم التسليم', en: 'Delivered'),
    ApOptionItem(value: 'not_delivered_yet', ar: 'لم يتم التسليم بعد', en: 'Not Delivered Yet'),
  ];

  static List<ApOptionItem> deliveryTypesFor(String? unitType) {
    if (unitType == 'residential_villa_lands' || unitType == 'residential_lands') {
      return _landDeliveryTypes;
    }
    return _allDeliveryTypes;
  }

  // ---------------------------------------------------------------------------
  // Unit layout status – updateUnitLayoutStatus()
  // ---------------------------------------------------------------------------
  static const _allUnitLayoutStatus = <ApOptionItem>[
    ApOptionItem(value: 'partial_roof', ar: 'روف جزئي', en: 'Partial Roof'),
    ApOptionItem(value: 'full_roof', ar: 'روف كامل', en: 'Full Roof'),
    ApOptionItem(value: 'open_space', ar: 'مساحة مفتوحة', en: 'Open Space'),
    ApOptionItem(value: 'single_apartment', ar: 'شقة واحدة', en: 'Single Apartment'),
    ApOptionItem(value: 'two_apartments', ar: 'شقتان', en: 'Two Apartments'),
    ApOptionItem(value: 'all_acceptable', ar: 'الكل مقبول', en: 'All Acceptable'),
  ];

  static const _basementUnitLayoutStatus = <ApOptionItem>[
    ApOptionItem(value: 'open_space', ar: 'مساحة مفتوحة', en: 'Open Space'),
    ApOptionItem(value: 'single_apartment', ar: 'شقة واحدة', en: 'Single Apartment'),
    ApOptionItem(value: 'two_apartments', ar: 'شقتان', en: 'Two Apartments'),
  ];

  static const _roofUnitLayoutStatus = <ApOptionItem>[
    ApOptionItem(value: 'partial_roof', ar: 'روف جزئي', en: 'Partial Roof'),
    ApOptionItem(value: 'full_roof', ar: 'روف كامل', en: 'Full Roof'),
  ];

  static List<ApOptionItem> unitLayoutStatusFor(String? unitType) {
    if (unitType == 'basements') return _basementUnitLayoutStatus;
    if (unitType == 'roofs') return _roofUnitLayoutStatus;
    return _allUnitLayoutStatus;
  }

  // ---------------------------------------------------------------------------
  // Building layout status – updateBuildingLayoutStatus()
  // ---------------------------------------------------------------------------
  static const _allBuildingLayoutStatus = <ApOptionItem>[
    ApOptionItem(value: 'under_construction', ar: 'تحت الإنشاء', en: 'Under Construction'),
    ApOptionItem(value: 'fully_built', ar: 'مبني بالكامل', en: 'Fully Built'),
  ];

  static const _villaBuildingLayoutStatus = <ApOptionItem>[
    ApOptionItem(value: 'under_construction', ar: 'تحت الإنشاء', en: 'Under Construction'),
    ApOptionItem(value: 'fully_built', ar: 'مبني بالكامل', en: 'Fully Built'),
  ];

  static const _factoriesBuildingLayoutStatus = <ApOptionItem>[
    ApOptionItem(value: 'open_space', ar: 'مساحة مفتوحة', en: 'Open Space'),
    ApOptionItem(value: 'under_construction', ar: 'تحت الإنشاء', en: 'Under Construction'),
    ApOptionItem(value: 'fully_built', ar: 'مبني بالكامل', en: 'Fully Built'),
  ];

  static const _landsBuildingLayoutStatus = <ApOptionItem>[
    ApOptionItem(value: 'open_space', ar: 'مساحة مفتوحة', en: 'Open Space'),
    ApOptionItem(value: 'fully_built', ar: 'مبني بالكامل', en: 'Fully Built'),
  ];

  static List<ApOptionItem> buildingLayoutStatusFor(String? unitType) {
    if (unitType == 'roofs') return _basementUnitLayoutStatus;
    if (unitType == 'villas' || unitType == 'residential_buildings') return _villaBuildingLayoutStatus;
    if (unitType == 'warehouse_lands' || unitType == 'factory_lands' || unitType == 'residential_lands') {
      return _factoriesBuildingLayoutStatus;
    }
    if (unitType == 'residential_villa_lands') return _landsBuildingLayoutStatus;
    if (unitType == 'administrative_lands' ||
        unitType == 'commercial_administrative_lands' ||
        unitType == 'commercial_lands' ||
        unitType == 'medical_lands' ||
        unitType == 'mixed_lands' ||
        unitType == 'warehouses_land' ||
        unitType == 'industrial_lands') {
      return _factoriesBuildingLayoutStatus;
    }
    return _allBuildingLayoutStatus;
  }

  // ---------------------------------------------------------------------------
  // Sub-unit types – updateSubunitType()
  // ---------------------------------------------------------------------------
  static const _insideCompoundSubunitTypes = <ApOptionItem>[
    ApOptionItem(value: 'apartments', ar: 'شقة', en: 'Apartments'),
    ApOptionItem(value: 'duplexes', ar: 'دوبلكس', en: 'Duplexes'),
    ApOptionItem(value: 'studios', ar: 'ستوديو', en: 'Studios'),
    ApOptionItem(value: 'penthouses', ar: 'بنت هاوس', en: 'Penthouses'),
    ApOptionItem(value: 'i_villa', ar: 'اى فيلا', en: 'I Villa'),
    ApOptionItem(value: 'standalone_villas', ar: 'ستاند الون فيلا', en: 'Standalone Villas'),
    ApOptionItem(value: 'town_houses', ar: 'تاون هاوس', en: 'Town Houses'),
    ApOptionItem(value: 'twin_houses', ar: 'توين هاوس', en: 'Twin Houses'),
  ];

  static const _outsideCompoundSubunitTypes = <ApOptionItem>[
    ApOptionItem(value: 'apartments', ar: 'شقة', en: 'Apartments'),
    ApOptionItem(value: 'duplexes', ar: 'دوبلكس', en: 'Duplexes'),
    ApOptionItem(value: 'studios', ar: 'ستوديو', en: 'Studios'),
    ApOptionItem(value: 'penthouses', ar: 'بنت هاوس', en: 'Penthouses'),
    ApOptionItem(value: 'basements', ar: 'بيزمنت', en: 'Basement'),
    ApOptionItem(value: 'roofs', ar: 'روف', en: 'Roofs'),
    ApOptionItem(value: 'villas', ar: 'فيلا', en: 'Villas'),
  ];

  static const _chaletsSubunitTypes = <ApOptionItem>[
    ApOptionItem(value: 'apartments', ar: 'شقة', en: 'Apartments'),
    ApOptionItem(value: 'duplexes', ar: 'دوبلكس', en: 'Duplexes'),
    ApOptionItem(value: 'studios', ar: 'ستوديو', en: 'Studios'),
    ApOptionItem(value: 'penthouses', ar: 'بنت هاوس', en: 'Penthouses'),
    ApOptionItem(value: 'basements', ar: 'بيزمنت', en: 'Basement'),
    ApOptionItem(value: 'roofs', ar: 'روف', en: 'Roofs'),
  ];

  static const _vacationVillaSubunitTypes = <ApOptionItem>[
    ApOptionItem(value: 'standalone_villas', ar: 'ستاند الون فيلا', en: 'Standalone Villas'),
    ApOptionItem(value: 'town_houses', ar: 'تاون هاوس', en: 'Town Houses'),
    ApOptionItem(value: 'twin_houses', ar: 'توين هاوس', en: 'Twin Houses'),
  ];

  static List<ApOptionItem> subUnitTypesFor(String? compound, String? unitType) {
    if (unitType == 'chalets') return _chaletsSubunitTypes;
    if (unitType == 'vacation_villa') return _vacationVillaSubunitTypes;
    if (compound == 'inside_compound') return _insideCompoundSubunitTypes;
    if (compound == 'outside_compound') return _outsideCompoundSubunitTypes;
    return const [];
  }

  // ---------------------------------------------------------------------------
  // Other accessories – updateOtherAccessories()
  // ---------------------------------------------------------------------------
  static const _residentialAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'storage', ar: 'مخزن', en: 'Storage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'land_share', ar: 'حصة أرض', en: 'Land Share'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];

  static const _residentialRentAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'storage', ar: 'مخزن', en: 'Storage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];

  static const _villaAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];

  static const _factoriesAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];

  static const _medicalAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'storage', ar: 'مخزن', en: 'Storage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];

  static const _commercialAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'storage', ar: 'مخزن', en: 'Storage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];

  static const _commercialAdministrativeAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'storage', ar: 'مخزن', en: 'Storage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];

  static const _allAccessories = <ApOptionItem>[
    ApOptionItem(value: 'garage', ar: 'جراج', en: 'Garage'),
    ApOptionItem(value: 'clubhouse', ar: 'كلوب هاوس', en: 'Clubhouse'),
    ApOptionItem(value: 'club', ar: 'نادي', en: 'Club'),
    ApOptionItem(value: 'storage', ar: 'مخزن', en: 'Storage'),
    ApOptionItem(value: 'elevator', ar: 'مصعد', en: 'Elevator'),
    ApOptionItem(value: 'swimming_pool', ar: 'حمام سباحة', en: 'Swimming Pool'),
  ];

  static const _residentialSet = {
    'apartments', 'duplexes', 'studios', 'penthouses', 'basements', 'roofs',
    'administrative_units', 'pharmacies', 'commercial_stores', 'medical_clinics',
  };

  static List<ApOptionItem> otherAccessoriesFor(String? operation, String? compound, String? unitType) {
    if (operation == 'sell') {
      if (compound == 'outside_compound') {
        if (_residentialSet.contains(unitType)) return _residentialAccessories;
        if (unitType == 'commercial_administrative_buildings') return _commercialAdministrativeAccessories;
        if (unitType == 'villas' || unitType == 'residential_buildings') return _villaAccessories;
        if (unitType == 'warehouse_lands' || unitType == 'factory_lands') return _factoriesAccessories;
      } else if (compound == 'inside_compound') {
        if (unitType == 'administrative_units' || unitType == 'medical_clinics' || unitType == 'pharmacies') {
          return _medicalAccessories;
        }
        if (unitType == 'commercial_administrative_buildings' || unitType == 'commercial_stores') {
          return _commercialAccessories;
        }
        return _residentialAccessories;
      }
    } else if (operation == 'rent_out') {
      if (compound == 'outside_compound') {
        if (_residentialSet.contains(unitType)) return _residentialRentAccessories;
        if (unitType == 'villas' || unitType == 'residential_buildings') return _villaAccessories;
      } else if (compound == 'inside_compound') {
        if (unitType == 'administrative_units' || unitType == 'medical_clinics' || unitType == 'pharmacies') {
          return _medicalAccessories;
        }
        if (unitType == 'commercial_administrative_buildings' || unitType == 'commercial_stores') {
          return _commercialAccessories;
        }
        if (unitType == 'warehouse_lands' || unitType == 'factory_lands') return _factoriesAccessories;
      }
    }
    return _allAccessories;
  }

  static const otherExpenses = <ApOptionItem>[
    ApOptionItem(value: 'other', ar: 'أخرى', en: 'Other'),
    ApOptionItem(value: 'electricity', ar: 'كهرباء', en: 'Electricity'),
    ApOptionItem(value: 'gas', ar: 'غاز', en: 'Gas'),
    ApOptionItem(value: 'water', ar: 'مياه', en: 'Water'),
    ApOptionItem(value: 'security_maintenance', ar: 'أمن وصيانة', en: 'Security Maintenance'),
  ];
}
