import 'package:easy_localization/easy_localization.dart';
import '../../../../../lang/lang_keys.dart';

class BrokerTextHelper {
  static String accountTypeText(String type) {
    switch (type) {
      case 'Free':
      case 'free':
        return LangKeys.freeAccount.tr();

      case 'Silver Account':
      case 'silverAccount':
        return LangKeys.silverAccount.tr();

      case 'Bronze Account':
      case 'bronzeAccount':
        return LangKeys.bronzeAccount.tr();

      case 'Golden Account':
      case 'goldenAccount':
        return LangKeys.goldenAccount.tr();

      default:
        return type;
    }
  }

  static String typeText(String type) {
    switch (type.toLowerCase().replaceAll(RegExp(r'\s+'), '_')) {
      case 'real_estate_brokage_company':
      case 'real_estate_brokerage_company':
        return LangKeys.realEstateBrokageCompany.tr();

      case 'independent':
        return LangKeys.independent.tr();

      default:
        return type;
    }
  }

  static String specializationText(String specialization) {
    final key = specialization
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll('/', '_');

    switch (key) {
      case 'purchasing_sell_residential_outside_compound':
        return LangKeys.purchasingSellResidentialOutsideCompound.tr();

      case 'purchasing_sell_national_housing_projects_outside_compound':
        return LangKeys
            .purchasingSellNationalHousingProjectsOutsideCompound
            .tr();

      case 'purchasing_sell_administrative_commercial_units_outside_compound':
        return LangKeys
            .purchasingSellAdministrativeCommercialUnitsOutsideCompound
            .tr();

      case 'purchasing_sell_industrial_and_warehousing_outside_compound':
        return LangKeys
            .purchasingSellIndustrialAndWarehousingOutsideCompound
            .tr();

      case 'purchasing_sell_lands_and_ready_projects_outside_compound':
        return LangKeys
            .purchasingSellLandsAndReadyProjectsOutsideCompound
            .tr();

      case 'purchasing_sell_villas_and_buildings_outside_compound':
        return LangKeys
            .purchasingSellVillasAndBuildingsOutsideCompound
            .tr();

      case 'purchasing_sell_vacation_units_outside_compound':
        return LangKeys
            .purchasingSellVacationUnitsOutsideCompound
            .tr();

      case 'purchasing_sell_residential_inside_compound':
        return LangKeys
            .purchasingSellResidentialInsideCompound
            .tr();

      case 'purchasing_sell_villas_inside_compound':
        return LangKeys.purchasingSellVillasInsideCompound.tr();

      case 'purchasing_sell_administrative_commercial_units_inside_compound':
        return LangKeys
            .purchasingSellAdministrativeCommercialUnitsInsideCompound
            .tr();

      case 'purchasing_sell_vacation_units_inside_compound':
        return LangKeys
            .purchasingSellVacationUnitsInsideCompound
            .tr();

      case 'rent_residential_inside_compound':
        return LangKeys.rentResidentialInsideCompound.tr();

      case 'rent_hotel_vacation_units_inside_compound':
        return LangKeys.rentHotelVacationUnitsInsideCompound.tr();

      case 'rent_administrative_commercial_units_inside_compound':
        return LangKeys
            .rentAdministrativeCommercialUnitsInsideCompound
            .tr();

      case 'rent_residential_outside_compound':
        return LangKeys.rentResidentialOutsideCompound.tr();

      case 'rent_national_housing_projects_outside_compound':
        return LangKeys
            .rentNationalHousingProjectsOutsideCompound
            .tr();

      case 'rent_administrative_commercial_units_outside_compound':
        return LangKeys
            .rentAdministrativeCommercialUnitsOutsideCompound
            .tr();

      case 'rent_industrial_and_warehousing_outside_compound':
        return LangKeys
            .rentIndustrialAndWarehousingOutsideCompound
            .tr();

      case 'rent_hotel_vacation_units_outside_compound':
        return LangKeys.rentHotelVacationUnitsOutsideCompound.tr();

      default:
        return specialization;
    }
  }

  static String specializationScopeText(String scope) {
    final key = scope.toLowerCase().replaceAll(RegExp(r'\s+'), '_');

    switch (key) {
      case 'purchase_sell_outside_compound':
      case 'purchasing_sell_outside_compound':
        return LangKeys.purchasingSellOutsideCompound.tr();

      case 'purchase_sell_inside_compound':
      case 'purchasing_sell_inside_compound':
        return LangKeys.purchasingSellInsideCompound.tr();

      case 'primary_inside_compound':
        return LangKeys.primaryInsideCompoundKey.tr();

      case 'resale_inside_compound':
        return LangKeys.resaleInsideCompoundKey.tr();

      case 'rentals_outside_compound':
        return LangKeys.rentalsOutsideCompoundKey.tr();

      case 'rentals_inside_compound':
        return LangKeys.rentalsInsideCompoundKey.tr();

      default:
        return scope;
    }
  }

  static String projectTypeText(String type) {
    final key = type.toUpperCase().replaceAll(RegExp(r'\s+'), '_');
    switch (key) {
      case 'INSIDE_COMPOUND':
      case 'PURCHASING_SELL_INSIDE_COMPOUND':
        return LangKeys.purchasingSellInsideCompound.tr();

      case 'OUTSIDE_COMPOUND':
      case 'PURCHASING_SELL_OUTSIDE_COMPOUND':
        return LangKeys.purchasingSellOutsideCompound.tr();

      case 'PRIMARY_INSIDE_COMPOUND':
        return LangKeys.primaryInsideCompoundKey.tr();

      case 'RESALE_INSIDE_COMPOUND':
        return LangKeys.resaleInsideCompoundKey.tr();

      case 'RENTALS_OUTSIDE_COMPOUND':
        return LangKeys.rentalsOutsideCompoundKey.tr();

      case 'RENTALS_INSIDE_COMPOUND':
        return LangKeys.rentalsInsideCompoundKey.tr();

      default:
        return type;
    }
  }
}