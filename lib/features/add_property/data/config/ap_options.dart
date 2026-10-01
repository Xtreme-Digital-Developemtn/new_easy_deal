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

  // ---------------------------------------------------------------------------
  // Values the backend sends but that no stepper dropdown offers, so they have
  // no entry in the arrays above. Without them [label] used to fall back to the
  // raw English enum value (`all_of_the_above_are_suitable`, `full_finished`,
  // `ready_for_delivery`, ...) in the middle of an Arabic screen.
  //
  // Display-only on purpose: adding them to the arrays above would change the
  // add-property dropdowns.
  // ---------------------------------------------------------------------------
  static const _displayOnlyOptions = <ApOptionItem>[
    // "all of the above" variants — the API uses more than one spelling
    ApOptionItem(value: 'all_of_the_above_are_suitable', ar: 'الكل', en: 'All of the Above'),
    ApOptionItem(value: 'all_of_the_above', ar: 'كل ما سبق', en: 'All of the Above'),

    // payment system
    ApOptionItem(value: 'mixed', ar: 'مختلط', en: 'Mixed'),

    // unit operation
    ApOptionItem(value: 'selling', ar: 'بيع', en: 'Sell'),
    ApOptionItem(value: 'rent', ar: 'تأجير', en: 'Rent Out'),
    ApOptionItem(value: 'rental', ar: 'تأجير', en: 'Rent Out'),
    ApOptionItem(value: 'leasing', ar: 'تأجير', en: 'Rent Out'),
    ApOptionItem(value: 'rent_in', ar: 'استئجار', en: 'Rent In'),
    ApOptionItem(value: 'renting', ar: 'استئجار', en: 'Rent In'),
    ApOptionItem(value: 'purchasing', ar: 'شراء', en: 'Purchasing'),
    ApOptionItem(value: 'purchase', ar: 'شراء', en: 'Purchasing'),
    ApOptionItem(value: 'buy', ar: 'شراء', en: 'Purchasing'),
    ApOptionItem(value: 'buying', ar: 'شراء', en: 'Purchasing'),

    // compound type
    ApOptionItem(value: 'purchasing_sell_inside_compound', ar: 'بيع وشراء داخل كمبوند', en: 'Purchase / Sell Inside Compound'),
    ApOptionItem(value: 'purchasing_sell_outside_compound', ar: 'بيع وشراء خارج كمبوند', en: 'Purchase / Sell Outside Compound'),
    ApOptionItem(value: 'purchase_sell_inside_compound', ar: 'بيع وشراء داخل كمبوند', en: 'Purchase / Sell Inside Compound'),
    ApOptionItem(value: 'purchase_sell_outside_compound', ar: 'بيع وشراء خارج كمبوند', en: 'Purchase / Sell Outside Compound'),
    ApOptionItem(value: 'rentals_inside_compound', ar: 'إيجارات داخل كمبوند', en: 'Rentals Inside Compound'),
    ApOptionItem(value: 'rentals_outside_compound', ar: 'إيجارات خارج كمبوند', en: 'Rentals Outside Compound'),
    ApOptionItem(value: 'primary_inside_compound', ar: 'بيع أولي داخل كمبوند', en: 'Primary Inside Compound'),
    ApOptionItem(value: 'resale_inside_compound', ar: 'ريسيل داخل كمبوند', en: 'Resale Inside Compound'),
    ApOptionItem(value: 'chalets_vacation_villas', ar: 'شاليهات وفيلل مصيفية', en: 'Chalets & Vacation Villas'),
    ApOptionItem(value: 'village', ar: 'قرية', en: 'Village'),
    ApOptionItem(value: 'residential', ar: 'سكني', en: 'Residential'),
    ApOptionItem(value: 'commercial', ar: 'تجاري', en: 'Commercial'),
    ApOptionItem(value: 'administrative', ar: 'إداري', en: 'Administrative'),
    ApOptionItem(value: 'medical', ar: 'طبي', en: 'Medical'),

    // delivery status
    ApOptionItem(value: 'ready_for_delivery', ar: 'جاهز للتسليم', en: 'Ready for Delivery'),

    // finishing type
    ApOptionItem(value: 'full_finished', ar: 'تشطيب كامل', en: 'Full Finished'),

    // unit facing
    ApOptionItem(value: 'quad_corner', ar: 'أربع واجهات', en: 'Quad Corner'),

    // rent recurrence
    ApOptionItem(value: 'quarterly', ar: 'ربع سنوي', en: 'Quarterly'),
    ApOptionItem(value: 'semi_annually', ar: 'نصف سنوي', en: 'Semi Annually'),

    // view
    ApOptionItem(value: 'pool', ar: 'حمام سباحة', en: 'Pool'),
    ApOptionItem(value: 'sea', ar: 'إطلالة بحر', en: 'Sea View'),
    ApOptionItem(value: 'landmark', ar: 'معلم مميز', en: 'Landmark'),
    ApOptionItem(value: 'park', ar: 'حديقة عامة', en: 'Park'),

    // unit status
    ApOptionItem(value: 'available', ar: 'متاح', en: 'Available'),
    ApOptionItem(value: 'sold', ar: 'مباع', en: 'Sold'),
    ApOptionItem(value: 'rented', ar: 'مؤجر', en: 'Rented'),
    ApOptionItem(value: 'reserved', ar: 'محجوز', en: 'Reserved'),
    ApOptionItem(value: 'archived', ar: 'مؤرشف', en: 'Archived'),
    ApOptionItem(value: 'pending', ar: 'قيد المراجعة', en: 'Pending'),
    ApOptionItem(value: 'active', ar: 'نشط', en: 'Active'),
    ApOptionItem(value: 'inactive', ar: 'غير نشط', en: 'Inactive'),

    // unit type — the API sends the singular form on some endpoints while the
    // stepper arrays above only carry the plural one.
    ApOptionItem(value: 'apartment', ar: 'شقة', en: 'Apartment'),
    ApOptionItem(value: 'duplex', ar: 'دوبلكس', en: 'Duplex'),
    ApOptionItem(value: 'studio', ar: 'ستوديو', en: 'Studio'),
    ApOptionItem(value: 'penthouse', ar: 'بنت هاوس', en: 'Penthouse'),
    ApOptionItem(value: 'basement', ar: 'بيزمنت', en: 'Basement'),
    ApOptionItem(value: 'roof', ar: 'روف', en: 'Roof'),
    ApOptionItem(value: 'villa', ar: 'فيلا', en: 'Villa'),
    ApOptionItem(value: 'twin_house', ar: 'توين هاوس', en: 'Twin House'),
    ApOptionItem(value: 'town_house', ar: 'تاون هاوس', en: 'Town House'),
    ApOptionItem(value: 'standalone_villa', ar: 'ستاند الون فيلا', en: 'Standalone Villa'),
    ApOptionItem(value: 'chalet', ar: 'شاليه مصيفي', en: 'Chalet'),
    ApOptionItem(value: 'chalet_inside', ar: 'شاليه داخل كمبوند', en: 'Chalet Inside Compound'),
    ApOptionItem(value: 'residential_building', ar: 'عمارة سكنية', en: 'Residential Building'),
    ApOptionItem(value: 'administrative_unit', ar: 'وحدة إدارية', en: 'Administrative Unit'),
    ApOptionItem(value: 'commercial_units', ar: 'وحدة تجارية', en: 'Commercial Unit'),
    ApOptionItem(value: 'commercial_unit', ar: 'وحدة تجارية', en: 'Commercial Unit'),
    ApOptionItem(value: 'commercial_store', ar: 'محل تجاري', en: 'Commercial Store'),
    ApOptionItem(value: 'medical_clinic', ar: 'عيادة طبية', en: 'Medical Clinic'),
    ApOptionItem(value: 'pharmacy', ar: 'صيدلية', en: 'Pharmacy'),
    ApOptionItem(value: 'commercial_administrative_building', ar: 'مبنى إدارى تجارى', en: 'Commercial Administrative Building'),
    ApOptionItem(value: 'hotel_unit', ar: 'وحدة فندقية', en: 'Hotel Unit'),
    ApOptionItem(value: 'hotel_units', ar: 'وحدة فندقية', en: 'Hotel Unit'),
    ApOptionItem(value: 'residential_land', ar: 'أرض سكنية', en: 'Residential Land'),
    ApOptionItem(value: 'administrative_lands', ar: 'أراضي إدارية', en: 'Administrative Lands'),
    ApOptionItem(value: 'commercial_lands', ar: 'أراضي تجارية', en: 'Commercial Lands'),
    ApOptionItem(value: 'industrial_lands', ar: 'أراضي صناعية', en: 'Industrial Lands'),
    ApOptionItem(value: 'medical_lands', ar: 'أراضي طبية', en: 'Medical Lands'),
    ApOptionItem(value: 'mixed_lands', ar: 'أراضي مختلطة', en: 'Mixed Lands'),
    ApOptionItem(value: 'warehouse_land', ar: 'مخزن او ارض مخزن', en: 'Warehouse Land'),
    ApOptionItem(value: 'factory_land', ar: 'مصنع او ارض مصنع', en: 'Factory Land'),
  ];

  // ---------------------------------------------------------------------------
  // Generic value -> label lookup, used to display raw API enum values
  // (unit type, delivery status, finishing type, ...) in the current locale.
  // ---------------------------------------------------------------------------
  static const _allOptions = <ApOptionItem>[
    ...compoundTypes,
    ...propertyOperations,
    ..._outsideCompoundUnitTypes,
    ..._insideCompoundUnitTypes,
    ..._rentalOutsideCompoundUnitTypes,
    ..._rentalInsideCompoundUnitTypes,
    ...floorTypes,
    ...unitFacingTypes,
    ...unitDescriptionTypes,
    ...activityTypes,
    ...fitOutConditionTypes,
    ...groundLayoutStatusTypes,
    ...unitDesignTypes,
    ...legalTypes,
    ...financialStatusTypes,
    ...buildingDeadlineTypes,
    ...buildingLicenseTypes,
    ...paymentTypes,
    ...rentRecurrenceTypes,
    ...requiredInsuranceTypes,
    allTheAboveAreSuitable,
    ..._outsideCompoundViewTypes,
    ..._insideCompoundViewTypes,
    ..._chaletViewTypes,
    ..._allFinishingType,
    ..._chaletsFinishingType,
    ..._rentFinishingType,
    ..._furnishingStatusTypesAll,
    ..._furnishingStatusTypesHotels,
    ..._allDeliveryTypes,
    ..._landDeliveryTypes,
    ..._allUnitLayoutStatus,
    ..._basementUnitLayoutStatus,
    ..._roofUnitLayoutStatus,
    ..._allBuildingLayoutStatus,
    ..._villaBuildingLayoutStatus,
    ..._factoriesBuildingLayoutStatus,
    ..._landsBuildingLayoutStatus,
    ..._insideCompoundSubunitTypes,
    ..._outsideCompoundSubunitTypes,
    ..._chaletsSubunitTypes,
    ..._vacationVillaSubunitTypes,
    ..._residentialAccessories,
    ..._allAccessories,
    ...otherExpenses,
    ..._displayOnlyOptions,
  ];

  /// `iVilla`, `Administrative Units`, `ADMINISTRATIVE_UNITS` and
  /// `administrative-units` all collapse to `administrative_units`, so a value
  /// resolves whichever casing/separator the backend happens to send it in.
  static String _canonical(String raw) {
    final out = StringBuffer();
    var previousWasSeparator = true; // also trims leading separators
    var previousWasLower = false;
    for (var i = 0; i < raw.length; i++) {
      final char = raw[i];
      if (char == '_' || char == '-' || char == ' ' || char == '/') {
        if (!previousWasSeparator) {
          out.write('_');
          previousWasSeparator = true;
          previousWasLower = false;
        }
        continue;
      }
      final lower = char.toLowerCase();
      final isUpper = lower != char;
      // camelCase boundary -> `iVilla` becomes `i_villa`. Only after a
      // lowercase char, so an all-caps `ADMINISTRATIVE_UNITS` isn't split
      // between every letter.
      if (isUpper && previousWasLower) out.write('_');
      out.write(lower);
      previousWasSeparator = false;
      previousWasLower = !isUpper;
    }
    final result = out.toString();
    return result.endsWith('_')
        ? result.substring(0, result.length - 1)
        : result;
  }

  /// Built once instead of scanning [_allOptions] on every cell of every list.
  /// The first entry wins, which is why [_displayOnlyOptions] comes last in
  /// [_allOptions] — a stepper array's wording takes precedence over it.
  static final Map<String, ApOptionItem> _labelIndex = {
    for (final option in _allOptions.reversed) _canonical(option.value): option,
  };

  /// Translates a raw API enum value (unit type, delivery status, ...) into
  /// its Arabic/English label. Falls back to [value] itself when unknown.
  static String label(String? value, bool isArabic) {
    if (value == null || value.isEmpty) return '';
    final hit = _labelIndex[_canonical(value)];
    return hit != null ? hit.label(isArabic) : value;
  }
}
