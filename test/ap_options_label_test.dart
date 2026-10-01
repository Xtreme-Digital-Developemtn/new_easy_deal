import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:flutter_test/flutter_test.dart';

/// Every enum value the unit/request endpoints are known to send for a
/// displayed field. A value that falls through `ApOptions.label` shows up as
/// raw English snake_case in the middle of an Arabic screen.
const _mustTranslate = <String>[
  // payment system — the case that was reported
  'cash', 'installment', 'mixed', 'all_of_the_above_are_suitable',
  'all_the_above_are_suitable', 'all_of_the_above',
  // unit operation
  'sell', 'selling', 'rent_out', 'rent', 'rental', 'leasing',
  'rent_in', 'renting', 'purchasing', 'purchase', 'buy', 'buying',
  // compound type
  'inside_compound', 'outside_compound', 'purchasing_sell_inside_compound',
  'purchasing_sell_outside_compound', 'rentals_inside_compound',
  'rentals_outside_compound', 'primary_inside_compound',
  'resale_inside_compound', 'chalets_vacation_villas', 'village',
  'residential', 'commercial', 'administrative', 'medical',
  // delivery status
  'immediate_delivery', 'under_construction', 'ready_for_delivery',
  'delivered', 'not_delivered_yet',
  // finishing type
  'full_finished', 'semi_finished', 'super_lux', 'ultra_super_lux',
  'on_brick', 'company_finished', 'custom_design',
  // furnishing
  'unfurnished', 'furnished_with_air_conditioners',
  'furnished_without_air_conditioners',
  // unit facing
  'corner', 'triple_corner', 'quad_corner', 'single_front', 'double_front',
  'right_of_facade', 'left_of_facade',
  // view
  'street', 'main_street', 'side_street', 'garden', 'square', 'rear_view',
  'side_view', 'water_view', 'gardens_and_landscape', 'entertainment_area',
  'swimming_pool', 'pool', 'sea', 'landmark', 'park',
  // rent recurrence
  'daily', 'monthly', 'quarterly', 'semi_annually', 'annually',
  // legal / financial / licence
  'licensed', 'reconciled', 'reconciliation_required', 'paid_in_full',
  'partially_paid_with_remaining_installments', 'No_Permit',
  'Permit_Available',
  // accessories & other expenses
  'garage', 'storage', 'elevator', 'club', 'clubhouse', 'land_share',
  'security_maintenance', 'electricity', 'gas', 'water', 'other',
  // status
  'available', 'sold', 'rented', 'reserved', 'archived',
  // unit type — plural (stepper) and singular (API) spellings
  'apartments', 'apartment', 'duplexes', 'duplex', 'studios', 'studio',
  'penthouses', 'penthouse', 'basements', 'basement', 'roofs', 'roof',
  'villas', 'villa', 'standalone_villas', 'standalone_villa',
  'twin_houses', 'twin_house', 'town_houses', 'town_house', 'i_villa',
  'chalets', 'chalet', 'chalet_inside', 'vacation_villa', 'hotels',
  'hotel_unit', 'hotel_units', 'residential_buildings',
  'residential_building', 'administrative_units', 'administrative_unit',
  'commercial_units', 'commercial_unit', 'commercial_stores',
  'commercial_store', 'medical_clinics', 'medical_clinic', 'pharmacies',
  'pharmacy', 'commercial_administrative_buildings',
  'commercial_administrative_building', 'residential_lands',
  'residential_land', 'commercial_administrative_lands',
  'administrative_lands', 'commercial_lands', 'industrial_lands',
  'medical_lands', 'mixed_lands', 'factory_lands', 'factory_land',
  'warehouse_lands', 'warehouse_land',
  // casing variants the edit-unit dialog sends
  'iVilla', 'twinHouses', 'townHouses', 'standaloneVillas',
  'administrativeUnits', 'commercialUnits', 'medicalClinics',
  'commercialAdministrativeBuilding',
];

bool _looksEnglishEnum(String text) =>
    RegExp(r'^[A-Za-z][A-Za-z0-9_\- ]*$').hasMatch(text);

void main() {
  test('every known API enum value has an Arabic label', () {
    final untranslated = _mustTranslate
        .where((value) => _looksEnglishEnum(ApOptions.label(value, true)))
        .toList();
    expect(untranslated, isEmpty,
        reason: 'these values still render in English on an Arabic screen:\n'
            '${untranslated.join('\n')}');
  });

  test('every known API enum value has an English label', () {
    final raw = _mustTranslate
        .where((value) => ApOptions.label(value, false) == value)
        .toList();
    expect(raw, isEmpty,
        reason: 'these values render as their raw key in English:\n'
            '${raw.join('\n')}');
  });

  test('casing and separators do not matter', () {
    final arabic = ApOptions.label('administrative_units', true);
    for (final variant in [
      'administrativeUnits',
      'ADMINISTRATIVE_UNITS',
      'administrative-units',
      'Administrative Units',
    ]) {
      expect(ApOptions.label(variant, true), arabic, reason: variant);
    }
  });

  test('unknown values still fall back to themselves', () {
    expect(ApOptions.label('something_the_backend_invented', true),
        'something_the_backend_invented');
    expect(ApOptions.label(null, true), '');
    expect(ApOptions.label('', true), '');
  });
}
