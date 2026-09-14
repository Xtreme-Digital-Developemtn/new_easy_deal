import 'ap_option_item.dart';

enum ApFieldKind { text, number, textarea, date, dropdown, multiSelect }

/// Static metadata for every dynamic field in the add-property stepper.
class ApFieldMeta {
  final String name;
  final ApFieldKind kind;
  final int step;
  final ApText label;

  const ApFieldMeta({
    required this.name,
    required this.kind,
    required this.step,
    required this.label,
  });
}

/// Field registry + the `getFieldsToShow` lookup, ported 1:1 from
/// `add-property-in-crm.component.ts`.
class ApFields {
  ApFields._();

  static const Map<String, ApFieldMeta> meta = {
    // ----- Step 1 (location) dynamic fields -----
    'mallName': ApFieldMeta(name: 'mallName', kind: ApFieldKind.text, step: 1, label: ApText('اسم المول', 'Mall Name')),
    'villageName': ApFieldMeta(name: 'villageName', kind: ApFieldKind.text, step: 1, label: ApText('اسم القرية', 'Village Name')),
    'compoundName': ApFieldMeta(name: 'compoundName', kind: ApFieldKind.text, step: 1, label: ApText('اسم الكمبوند', 'Compound Name')),

    // ----- Step 2 (unit info) -----
    'buildingNumber': ApFieldMeta(name: 'buildingNumber', kind: ApFieldKind.text, step: 2, label: ApText('رقم العقار', 'Building Number')),
    'unitNumber': ApFieldMeta(name: 'unitNumber', kind: ApFieldKind.text, step: 2, label: ApText('رقم الوحدة', 'Unit Number')),
    'floor': ApFieldMeta(name: 'floor', kind: ApFieldKind.dropdown, step: 2, label: ApText('الطابق', 'Floor')),
    'floorNumber': ApFieldMeta(name: 'floorNumber', kind: ApFieldKind.number, step: 2, label: ApText('رقم الدور', 'Floor Number')),
    'unitArea': ApFieldMeta(name: 'unitArea', kind: ApFieldKind.number, step: 2, label: ApText('مساحة الوحدة (م²)', 'Unit Area (m²)')),
    'terraceArea': ApFieldMeta(name: 'terraceArea', kind: ApFieldKind.number, step: 2, label: ApText('مساحة التراس', 'Terrace Area')),
    'gardenArea': ApFieldMeta(name: 'gardenArea', kind: ApFieldKind.number, step: 2, label: ApText('مساحة الحديقة', 'Garden Area')),
    'numberOfFloors': ApFieldMeta(name: 'numberOfFloors', kind: ApFieldKind.number, step: 2, label: ApText('عدد الأدوار', 'Number Of Floors')),
    'buildingArea': ApFieldMeta(name: 'buildingArea', kind: ApFieldKind.number, step: 2, label: ApText('مساحة المبنى (م²)', 'Building Area (m²)')),
    'groundArea': ApFieldMeta(name: 'groundArea', kind: ApFieldKind.number, step: 2, label: ApText('مساحة الأرض (م²)', 'Ground Area (m²)')),
    'numberOfRooms': ApFieldMeta(name: 'numberOfRooms', kind: ApFieldKind.number, step: 2, label: ApText('عدد الغرف', 'Number Of Rooms')),
    'numberOfBathrooms': ApFieldMeta(name: 'numberOfBathrooms', kind: ApFieldKind.number, step: 2, label: ApText('عدد الحمامات', 'Number Of Bathrooms')),
    'subUnitType': ApFieldMeta(name: 'subUnitType', kind: ApFieldKind.dropdown, step: 2, label: ApText('نوع الوحدة الفرعي', 'Sub Unit Type')),
    'unitFacing': ApFieldMeta(name: 'unitFacing', kind: ApFieldKind.dropdown, step: 2, label: ApText('موقع الواجهة', 'Facing Location')),
    'buildingLayoutStatus': ApFieldMeta(name: 'buildingLayoutStatus', kind: ApFieldKind.dropdown, step: 2, label: ApText('حالة تخطيط المبنى', 'Building Layout Status')),
    'unitLayoutStatus': ApFieldMeta(name: 'unitLayoutStatus', kind: ApFieldKind.dropdown, step: 2, label: ApText('حالة تخطيط الوحدة', 'Unit Layout Status')),
    'unitDescription': ApFieldMeta(name: 'unitDescription', kind: ApFieldKind.dropdown, step: 2, label: ApText('وصف الوحدة', 'Unit Description')),
    'buildingDeadline': ApFieldMeta(name: 'buildingDeadline', kind: ApFieldKind.dropdown, step: 2, label: ApText('مهلة البناء', 'Building Deadline')),
    'buildingLicense': ApFieldMeta(name: 'buildingLicense', kind: ApFieldKind.dropdown, step: 2, label: ApText('رخصة البناء', 'Building License')),
    'view': ApFieldMeta(name: 'view', kind: ApFieldKind.dropdown, step: 2, label: ApText('الإطلالة', 'View')),
    'finishingType': ApFieldMeta(name: 'finishingType', kind: ApFieldKind.dropdown, step: 2, label: ApText('حالة التشطيب', 'Finishing Status')),
    'fitOutCondition': ApFieldMeta(name: 'fitOutCondition', kind: ApFieldKind.dropdown, step: 2, label: ApText('حالة التجهيز', 'Fit Out Condition')),
    'furnishingStatus': ApFieldMeta(name: 'furnishingStatus', kind: ApFieldKind.dropdown, step: 2, label: ApText('حالة الفرش', 'Furnishing Status')),
    'groundLayoutStatus': ApFieldMeta(name: 'groundLayoutStatus', kind: ApFieldKind.dropdown, step: 2, label: ApText('حالة تخطيط الأرض', 'Ground Layout Status')),
    'unitDesign': ApFieldMeta(name: 'unitDesign', kind: ApFieldKind.dropdown, step: 2, label: ApText('تصميم الوحدة', 'Unit Design')),
    'activity': ApFieldMeta(name: 'activity', kind: ApFieldKind.dropdown, step: 2, label: ApText('النشاط', 'Activity')),
    'shopActivity': ApFieldMeta(name: 'shopActivity', kind: ApFieldKind.text, step: 2, label: ApText('النشاط', 'Activity')),
    'deliveryStatus': ApFieldMeta(name: 'deliveryStatus', kind: ApFieldKind.dropdown, step: 2, label: ApText('حالة الاستلام', 'Delivery Status')),
    'deliveryDate': ApFieldMeta(name: 'deliveryDate', kind: ApFieldKind.date, step: 2, label: ApText('تاريخ الاستلام', 'Delivery Date')),
    'legalStatus': ApFieldMeta(name: 'legalStatus', kind: ApFieldKind.dropdown, step: 2, label: ApText('الحالة القانونية', 'Legal Status')),
    'financialStatus': ApFieldMeta(name: 'financialStatus', kind: ApFieldKind.dropdown, step: 2, label: ApText('الحالة المالية', 'Financial Status')),
    'otherAccessories': ApFieldMeta(name: 'otherAccessories', kind: ApFieldKind.multiSelect, step: 2, label: ApText('مميزات أخرى', 'Other Accessories')),
    'notes': ApFieldMeta(name: 'notes', kind: ApFieldKind.textarea, step: 2, label: ApText('ملاحظات', 'Notes')),

    // ----- Step 3 (payment) -----
    'requestedOver': ApFieldMeta(name: 'requestedOver', kind: ApFieldKind.number, step: 3, label: ApText('مطلوب زيادة', 'Requested Over')),
    'requiredInsurance': ApFieldMeta(name: 'requiredInsurance', kind: ApFieldKind.dropdown, step: 3, label: ApText('التأمين المطلوب', 'Required Insurance')),
    'insuranceValue': ApFieldMeta(name: 'insuranceValue', kind: ApFieldKind.number, step: 3, label: ApText('قيمة التأمين', 'Insurance Value')),
    'rentRecurrence': ApFieldMeta(name: 'rentRecurrence', kind: ApFieldKind.dropdown, step: 3, label: ApText('دورية الإيجار', 'Rent Recurrence')),
    'dailyRent': ApFieldMeta(name: 'dailyRent', kind: ApFieldKind.number, step: 3, label: ApText('الإيجار اليومي', 'Daily Rent')),
    'monthlyRent': ApFieldMeta(name: 'monthlyRent', kind: ApFieldKind.number, step: 3, label: ApText('الإيجار الشهري', 'Monthly Rent')),
    'paymentSystem': ApFieldMeta(name: 'paymentSystem', kind: ApFieldKind.dropdown, step: 3, label: ApText('نظام الدفع', 'Payment System')),
    'pricePerMeterInCash': ApFieldMeta(name: 'pricePerMeterInCash', kind: ApFieldKind.number, step: 3, label: ApText('سعر المتر كاش', 'Price Per Meter (Cash)')),
    'totalPriceInCash': ApFieldMeta(name: 'totalPriceInCash', kind: ApFieldKind.number, step: 3, label: ApText('السعر الإجمالي كاش', 'Total Price (Cash)')),
    'pricePerMeterInInstallment': ApFieldMeta(name: 'pricePerMeterInInstallment', kind: ApFieldKind.number, step: 3, label: ApText('سعر المتر تقسيط', 'Price Per Meter (Installment)')),
    'totalPriceInInstallment': ApFieldMeta(name: 'totalPriceInInstallment', kind: ApFieldKind.number, step: 3, label: ApText('السعر الإجمالي تقسيط', 'Total Price (Installment)')),
    'otherExpenses': ApFieldMeta(name: 'otherExpenses', kind: ApFieldKind.multiSelect, step: 3, label: ApText('مصاريف أخرى', 'Other Expenses')),
  };

  static ApFieldMeta metaOf(String name) =>
      meta[name] ?? ApFieldMeta(name: name, kind: ApFieldKind.text, step: 2, label: ApText(name, name));

  // ---------------------------------------------------------------------------
  // getFieldsToShow – ordered field list keyed by (operation, compound, type)
  // ---------------------------------------------------------------------------
  static List<String> getFieldsToShow({
    required String? operation,
    required String? compound,
    required String? type,
  }) {
    const cashSell = ['paymentSystem', 'pricePerMeterInCash', 'totalPriceInCash', 'pricePerMeterInInstallment', 'totalPriceInInstallment'];
    const rentTail = ['rentRecurrence', 'requiredInsurance', 'otherExpenses'];

    if (operation == 'sell') {
      if (compound == 'outside_compound') {
        switch (type) {
          case 'apartments':
            return ['buildingNumber', 'unitNumber', 'floor', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'duplexes':
            return ['buildingNumber', 'unitNumber', 'floor', 'unitArea', 'gardenArea', 'numberOfRooms', 'numberOfBathrooms', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'basements':
            return ['buildingNumber', 'unitNumber', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'unitLayoutStatus', 'finishingType', 'deliveryStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'roofs':
            return ['buildingNumber', 'unitNumber', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'unitLayoutStatus', 'buildingLayoutStatus', 'finishingType', 'deliveryStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'penthouses':
            return ['buildingNumber', 'unitNumber', 'unitArea', 'terraceArea', 'numberOfRooms', 'numberOfBathrooms', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'studios':
            return ['buildingNumber', 'unitNumber', 'floor', 'unitArea', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'villas':
          case 'residential_buildings':
            return ['buildingNumber', 'numberOfFloors', 'buildingArea', 'groundArea', 'buildingLayoutStatus', 'unitDescription', 'unitDesign', 'view', 'finishingType', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'commercial_administrative_buildings':
            return ['buildingNumber', 'numberOfFloors', 'buildingArea', 'groundArea', 'activity', 'buildingLayoutStatus', 'unitDescription', 'view', 'finishingType', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'pharmacies':
            return ['mallName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'fitOutCondition', 'deliveryStatus', 'financialStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'commercial_stores':
            return ['mallName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'deliveryStatus', 'shopActivity', 'financialStatus', 'legalStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'administrative_units':
          case 'medical_clinics':
            return ['mallName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'legalStatus', 'financialStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'warehouse_lands':
          case 'factory_lands':
            return ['buildingNumber', 'numberOfFloors', 'groundArea', 'buildingArea', 'shopActivity', 'buildingLayoutStatus', 'buildingLicense', 'fitOutCondition', 'legalStatus', 'financialStatus', 'otherAccessories', 'notes', ...cashSell];
          case 'commercial_administrative_lands':
            return ['buildingNumber', 'groundArea', 'numberOfFloors', 'buildingArea', 'activity', 'buildingDeadline', 'buildingLayoutStatus', 'buildingLicense', 'view', 'financialStatus', 'notes', ...cashSell];
          case 'residential_lands':
            return ['buildingNumber', 'groundArea', 'buildingArea', 'unitDescription', 'buildingDeadline', 'buildingLicense', 'view', 'buildingLayoutStatus', 'deliveryStatus', 'financialStatus', 'notes', ...cashSell];
          case 'chalets':
            return ['buildingNumber', 'unitNumber', 'subUnitType', 'unitArea', 'floor', 'view', 'unitFacing', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'vacation_villa':
            return ['buildingNumber', 'groundArea', 'subUnitType', 'unitArea', 'numberOfFloors', 'view', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', ...cashSell];
        }
      } else if (compound == 'inside_compound') {
        switch (type) {
          case 'apartments':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'i_villa':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'numberOfFloors', 'unitArea', 'terraceArea', 'gardenArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'penthouses':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'unitArea', 'terraceArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'duplexes':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'gardenArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'studios':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'standalone_villas':
          case 'twin_houses':
          case 'town_houses':
            return ['compoundName', 'buildingNumber', 'numberOfFloors', 'buildingArea', 'groundArea', 'gardenArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'pharmacies':
            return ['compoundName', 'mallName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'deliveryStatus', 'fitOutCondition', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'commercial_stores':
            return ['mallName', 'compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'shopActivity', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'commercial_administrative_buildings':
            return ['compoundName', 'buildingNumber', 'buildingArea', 'numberOfFloors', 'groundArea', 'view', 'buildingLayoutStatus', 'finishingType', 'activity', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'administrative_units':
          case 'medical_clinics':
            return ['compoundName', 'mallName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'furnishingStatus', 'finishingType', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'chalets':
            return ['villageName', 'buildingNumber', 'unitNumber', 'subUnitType', 'unitArea', 'floor', 'view', 'unitFacing', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
          case 'vacation_villa':
            return ['villageName', 'buildingNumber', 'groundArea', 'subUnitType', 'unitArea', 'numberOfFloors', 'view', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'financialStatus', 'otherAccessories', 'notes', 'requestedOver', ...cashSell];
        }
      }
    } else if (operation == 'rent_out') {
      if (compound == 'outside_compound') {
        switch (type) {
          case 'apartments':
            return ['buildingNumber', 'unitNumber', 'floor', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'hotels':
            return ['buildingNumber', 'unitNumber', 'floor', 'subUnitType', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'unitFacing', 'view', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'duplexes':
            return ['buildingNumber', 'unitNumber', 'floor', 'unitArea', 'gardenArea', 'numberOfRooms', 'numberOfBathrooms', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'basements':
            return ['buildingNumber', 'unitNumber', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'unitLayoutStatus', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'roofs':
            return ['buildingNumber', 'unitNumber', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'unitLayoutStatus', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'penthouses':
            return ['buildingNumber', 'unitNumber', 'unitArea', 'terraceArea', 'numberOfRooms', 'numberOfBathrooms', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'studios':
            return ['buildingNumber', 'unitNumber', 'floor', 'unitArea', 'unitFacing', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'villas':
          case 'residential_buildings':
            return ['buildingNumber', 'numberOfFloors', 'buildingArea', 'groundArea', 'unitDesign', 'view', 'finishingType', 'otherAccessories', 'notes', ...rentTail];
          case 'pharmacies':
            return ['mallName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'fitOutCondition', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'commercial_stores':
            return ['mallName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'fitOutCondition', 'deliveryStatus', 'shopActivity', 'otherAccessories', 'notes', ...rentTail];
          case 'administrative_units':
          case 'medical_clinics':
            return ['mallName', 'buildingNumber', 'unitNumber', 'floor', 'numberOfRooms', 'numberOfBathrooms', 'unitArea', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'warehouse_lands':
          case 'factory_lands':
            return ['buildingNumber', 'numberOfFloors', 'groundArea', 'buildingArea', 'shopActivity', 'finishingType', 'fitOutCondition', 'notes', 'otherAccessories', ...rentTail];
          case 'commercial_administrative_buildings':
            return ['buildingNumber', 'groundArea', 'numberOfFloors', 'buildingArea', 'activity', 'finishingType', 'view', 'notes', ...rentTail];
          case 'chalets':
            return ['buildingNumber', 'unitNumber', 'subUnitType', 'unitArea', 'floor', 'view', 'unitFacing', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'vacation_villa':
            return ['buildingNumber', 'groundArea', 'subUnitType', 'unitArea', 'numberOfFloors', 'view', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'otherAccessories', 'notes', 'requiredInsurance', 'rentRecurrence', 'otherExpenses'];
        }
      } else if (compound == 'inside_compound') {
        switch (type) {
          case 'apartments':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'hotels':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'floor', 'subUnitType', 'unitArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'i_villa':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'numberOfFloors', 'unitArea', 'terraceArea', 'gardenArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'penthouses':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'unitArea', 'terraceArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'duplexes':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'gardenArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'studios':
            return ['compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'standalone_villas':
          case 'twin_houses':
          case 'town_houses':
            return ['compoundName', 'unitNumber', 'numberOfFloors', 'unitArea', 'groundArea', 'numberOfRooms', 'numberOfBathrooms', 'view', 'finishingType', 'otherAccessories', 'notes', ...rentTail];
          case 'pharmacies':
            return ['mallName', 'compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'deliveryStatus', 'fitOutCondition', 'otherAccessories', 'notes', ...rentTail];
          case 'commercial_stores':
            return ['mallName', 'compoundName', 'buildingNumber', 'unitNumber', 'floor', 'unitArea', 'view', 'finishingType', 'fitOutCondition', 'shopActivity', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'commercial_administrative_buildings':
            return ['compoundName', 'buildingNumber', 'numberOfFloors', 'buildingArea', 'groundArea', 'view', 'finishingType', 'activity', 'otherAccessories', 'notes', ...rentTail];
          case 'administrative_units':
          case 'medical_clinics':
            return ['mallName', 'compoundName', 'buildingNumber', 'unitNumber', 'floor', 'numberOfRooms', 'numberOfBathrooms', 'unitArea', 'view', 'finishingType', 'furnishingStatus', 'deliveryStatus', 'otherAccessories', 'notes', ...rentTail];
          case 'chalets':
            return ['villageName', 'buildingNumber', 'unitNumber', 'subUnitType', 'unitArea', 'floor', 'view', 'unitFacing', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'otherAccessories', 'notes', 'requiredInsurance', 'rentRecurrence', 'otherExpenses'];
          case 'vacation_villa':
            return ['villageName', 'buildingNumber', 'groundArea', 'subUnitType', 'unitArea', 'numberOfFloors', 'view', 'numberOfRooms', 'numberOfBathrooms', 'finishingType', 'furnishingStatus', 'otherAccessories', 'notes', 'requiredInsurance', 'rentRecurrence', 'otherExpenses'];
        }
      }
    }
    return const [];
  }
}
