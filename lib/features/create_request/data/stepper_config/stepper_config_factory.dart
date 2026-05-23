import 'input_config_model.dart';
import 'sell_config_service.dart';
import 'purchasing_config_service.dart';
import 'rental_config_service.dart';
import 'sell_outside_config_service.dart';
import 'rental_outside_config_service.dart';
import 'purchase_outside_config_service.dart';

class StepperConfigFactory {
  final SellConfigService _sellConfig = SellConfigService();
  final PurchasingConfigService _purchasingConfig = PurchasingConfigService();
  final RentalConfigService _rentalConfig = RentalConfigService();
  final SellOutsideCompoundConfigService _sellOutsideConfig = SellOutsideCompoundConfigService();
  final RentalOutsideCompoundConfigService _rentalOutsideConfig = RentalOutsideCompoundConfigService();
  final PurchaseOutsideCompoundConfigService _purchaseOutsideConfig = PurchaseOutsideCompoundConfigService();

  List<InputConfig> getInputsForKey(String key, int step) {
    final allConfigs = _getAllConfigs();
    for (final config in allConfigs) {
      if (config.key == key) {
        return config.inputs.where((input) => input.step == step && input.isVisible()).toList();
      }
    }
    return [];
  }

  List<InputConfig> getAllInputsForKey(String key) {
    final allConfigs = _getAllConfigs();
    for (final config in allConfigs) {
      if (config.key == key) {
        return config.inputs;
      }
    }
    return [];
  }

  List<StepperConfiguration> _getAllConfigs() {
    return [
      ..._sellConfig.getInputConfigs(),
      ..._purchasingConfig.getInputConfigs(),
      ..._rentalConfig.getInputConfigs(),
      ..._sellOutsideConfig.getInputConfigs(),
      ..._rentalOutsideConfig.getInputConfigs(),
      ..._purchaseOutsideConfig.getInputConfigs(),
    ];
  }

  bool hasConfiguration(String key) {
    return _getAllConfigs().any((config) => config.key == key);
  }

  List<String> getAllAvailableConfigKeys() {
    return _getAllConfigs().map((config) => config.key).toList();
  }

  bool getInsideCompoundPrivilege(String? scope) {
    const targetScopes = ['primary_inside_compound', 'resale_inside_compound', 'rentals_inside_compound'];
    return targetScopes.contains(scope);
  }

  bool getOutsideCompoundPrivilege(String? scope) {
    const targetScopes = ['purchase_sell_outside_compound', 'rentals_outside_compound'];
    return targetScopes.contains(scope);
  }

  bool shouldSkipStep4(String? type) {
    return type == 'purchasing' || type == 'rent_in';
  }

  bool isSellInsideCompound(String? scope, String? type) {
    const targetScopes = ['resale_inside_compound', 'primary_inside_compound'];
    return targetScopes.contains(scope) && type == 'sell';
  }

  bool isRentOutOutsideCompound(String? scope, String? type) {
    return scope == 'rentals_outside_compound' && type == 'rent_out';
  }

  bool isRentInOutsideCompound(String? scope, String? type) {
    return scope == 'rentals_outside_compound' && type == 'rent_in';
  }

  bool isClient(String? role) {
    return role == 'client';
  }

  String getConfigKey(String? scope, String? type, String? unitType) {
    return '${scope}_${type}_$unitType';
  }

  List<Map<String, String>> getFilteredTypeOptions(String? scope) {
    const allTypes = [
      {'label': 'Purchasing', 'value': 'purchasing'},
      {'label': 'Sell', 'value': 'sell'},
      {'label': 'Rent Out', 'value': 'rent_out'},
      {'label': 'Rent In', 'value': 'rent_in'},
    ];

    if (scope == 'primary_inside_compound') {
      return allTypes.where((t) => t['value'] == 'purchasing').toList();
    }
    if (scope?.contains('rentals') == true) {
      return allTypes.where((t) => ['rent_out', 'rent_in'].contains(t['value'])).toList();
    }
    if (scope?.contains('purchase_sell') == true || scope?.contains('resale') == true) {
      return allTypes.where((t) => ['purchasing', 'sell'].contains(t['value'])).toList();
    }
    return allTypes;
  }

  List<Map<String, String>> getFilteredUnitTypeOptions(String? scope, String? type) {
    if (scope == null || scope.isEmpty) return [];

    List<Map<String, String>> allUnits = [];

    if (scope == 'primary_inside_compound' || scope == 'resale_inside_compound') {
      if (type == 'sell' || type == 'purchasing') {
        allUnits = [
          {'label': 'Apartments', 'value': 'apartments'},
          {'label': 'Duplexes', 'value': 'duplexes'},
          {'label': 'Penthouses', 'value': 'penthouses'},
          {'label': 'Studios', 'value': 'studios'},
          {'label': 'I Villa', 'value': 'i_villa'},
          {'label': 'Twin Houses', 'value': 'twin_houses'},
          {'label': 'Town Houses', 'value': 'town_houses'},
          {'label': 'Standalone Villas', 'value': 'standalone_villas'},
          {'label': 'Administrative Units', 'value': 'administrative_units'},
          {'label': 'Medical Clinics', 'value': 'medical_clinics'},
          {'label': 'Pharmacies', 'value': 'pharmacies'},
          {'label': 'Commercial Stores', 'value': 'commercial_stores'},
          {'label': 'Commercial Administrative Buildings', 'value': 'commercial_administrative_buildings'},
          {'label': 'Chalets', 'value': 'chalets'},
          {'label': 'Vacation Villa', 'value': 'vacation_villa'},
        ];
      }
    } else if (scope == 'purchase_sell_outside_compound') {
      allUnits = [
        {'label': 'Apartments', 'value': 'apartments'},
        {'label': 'Duplexes', 'value': 'duplexes'},
        {'label': 'Penthouses', 'value': 'penthouses'},
        {'label': 'Roofs', 'value': 'roofs'},
        {'label': 'Studios', 'value': 'studios'},
        {'label': 'Basements', 'value': 'basements'},
        {'label': 'Residential Buildings', 'value': 'residential_buildings'},
        {'label': 'Villas', 'value': 'villas'},
        {'label': 'Administrative Units', 'value': 'administrative_units'},
        {'label': 'Medical Clinics', 'value': 'medical_clinics'},
        {'label': 'Pharmacies', 'value': 'pharmacies'},
        {'label': 'Commercial Stores', 'value': 'commercial_stores'},
        {'label': 'Residential Lands', 'value': 'residential_lands'},
        {'label': 'Commercial Administrative Lands', 'value': 'commercial_administrative_lands'},
        {'label': 'Commercial Administrative Buildings', 'value': 'commercial_administrative_buildings'},
        {'label': 'Factory Lands', 'value': 'factory_lands'},
        {'label': 'Warehouse Lands', 'value': 'warehouse_lands'},
        {'label': 'Vacation Villa', 'value': 'vacation_villa'},
        {'label': 'Chalets', 'value': 'chalets'},
      ];
    } else if (scope == 'rentals_inside_compound') {
      allUnits = [
        {'label': 'Hotels', 'value': 'hotels'},
        {'label': 'Apartments', 'value': 'apartments'},
        {'label': 'Duplexes', 'value': 'duplexes'},
        {'label': 'Penthouses', 'value': 'penthouses'},
        {'label': 'Studios', 'value': 'studios'},
        {'label': 'I Villa', 'value': 'i_villa'},
        {'label': 'Twin Houses', 'value': 'twin_houses'},
        {'label': 'Town Houses', 'value': 'town_houses'},
        {'label': 'Standalone Villas', 'value': 'standalone_villas'},
        {'label': 'Administrative Units', 'value': 'administrative_units'},
        {'label': 'Medical Clinics', 'value': 'medical_clinics'},
        {'label': 'Pharmacies', 'value': 'pharmacies'},
        {'label': 'Commercial Stores', 'value': 'commercial_stores'},
        {'label': 'Commercial Administrative Buildings', 'value': 'commercial_administrative_buildings'},
        {'label': 'Vacation Villa', 'value': 'vacation_villa'},
        {'label': 'Chalets', 'value': 'chalets'},
      ];
    } else if (scope == 'rentals_outside_compound') {
      allUnits = [
        {'label': 'Hotels', 'value': 'hotels'},
        {'label': 'Vacation Villa', 'value': 'vacation_villa'},
        {'label': 'Chalets', 'value': 'chalets'},
        {'label': 'Apartments', 'value': 'apartments'},
        {'label': 'Duplexes', 'value': 'duplexes'},
        {'label': 'Penthouses', 'value': 'penthouses'},
        {'label': 'Roofs', 'value': 'roofs'},
        {'label': 'Studios', 'value': 'studios'},
        {'label': 'Basements', 'value': 'basements'},
        {'label': 'Residential Buildings', 'value': 'residential_buildings'},
        {'label': 'Villas', 'value': 'villas'},
        {'label': 'Administrative Units', 'value': 'administrative_units'},
        {'label': 'Medical Clinics', 'value': 'medical_clinics'},
        {'label': 'Pharmacies', 'value': 'pharmacies'},
        {'label': 'Commercial Stores', 'value': 'commercial_stores'},
        {'label': 'Commercial Administrative Buildings', 'value': 'commercial_administrative_buildings'},
        {'label': 'Factory Lands', 'value': 'factory_lands'},
        {'label': 'Warehouse Lands', 'value': 'warehouse_lands'},
      ];
    }

    return allUnits;
  }
}
