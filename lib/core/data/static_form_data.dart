import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';


class StaticFormData {
  static   Map<String, dynamic> getData(BuildContext context)  {
    return {
    'transaction_types': [
      {
        'label': LangKeys.purchaseSellOutsideCompound.tr(),
        'value': 'purchase_sell_outside_compound',
        'subtypes': [
          {
            'label': LangKeys.purchasing.tr(),
            'value': 'purchasing',
            'units': [
              {'label':  LangKeys.apartments.tr(), 'value': 'apartments'},
              {'label':  LangKeys.duplexes.tr(), 'value': 'duplexes'},
              {'label':  LangKeys.penthouses.tr(), 'value': 'penthouses'},
              {'label':  LangKeys.roofs.tr(), 'value': 'roofs'},
              {'label':  LangKeys.studios.tr(), 'value': 'studios'},
              {'label':  LangKeys.basements.tr(), 'value': 'basements'},
              {'label':  LangKeys.residentialBuildings.tr(), 'value': 'residential_buildings'},
              {'label':  LangKeys.villas.tr(), 'value': 'villas'},
              {'label':  LangKeys.iVilla.tr(), 'value': 'i_villa'},
              {'label':  LangKeys.administrativeUnits.tr(), 'value': 'administrative_units'},
              {'label':  LangKeys.medicalClinics.tr(), 'value': 'medical_clinics'},
              {'label':  LangKeys.pharmacies.tr(), 'value': 'pharmacies'},
              {'label':  LangKeys.commercialStores.tr(), 'value': 'commercial_stores'},
              {'label':  LangKeys.residentialLands.tr(), 'value': 'residential_lands'},
              {'label':  LangKeys.commercialAdministrativeBuildings.tr(), 'value': 'commercial_administrative_buildings'},
              {'label':  LangKeys.commercialAdministrativeLands.tr(), 'value': 'commercial_administrative_lands'},
              {'label':  LangKeys.factoryLands.tr(), 'value': 'factory_lands'},
              {'label':  LangKeys.warehouseLands.tr(), 'value': 'warehouse_lands'},
              {'label':  LangKeys.vacationVilla.tr(), 'value': 'vacation_villa'},
              {'label':  LangKeys.chalets.tr(), 'value': 'chalets'},


            ]
          },
          {
            'label': LangKeys.sell.tr(),
            'value': 'sell',
            'units': [
              {'label': 'Apartment', 'value': 'apartment'},
              {'label': 'Villa', 'value': 'villa'},
              {'label': 'Shop', 'value': 'shop'},
              {'label': 'Office', 'value': 'office'},
            ]
          }
        ]
      },
      {
        'label': LangKeys.primaryInsideCompound.tr(),
        'value': 'primary_inside_compound',
        'subtypes': [
          {
            'label': 'Buy',
            'value': 'buy',
            'units': [
              {'label': 'Apartment', 'value': 'apartment'},
              {'label': 'Townhouse', 'value': 'townhouse'},
            ]
          },
          {
            'label': 'Rent',
            'value': 'rent',
            'units': [
              {'label': 'Villa', 'value': 'villa'},
              {'label': 'Studio', 'value': 'studio'},
            ]
          }
        ]
      },
      {
        'label':LangKeys.resaleInsideCompound.tr(),
        'value': 'resale_inside_compound',
        'subtypes': [
          {
            'label': 'Residential',
            'value': 'residential',
            'units': [
              {'label': 'Furnished Apartment', 'value': 'furnished_apartment'},
              {'label': 'Unfurnished Apartment', 'value': 'unfurnished_apartment'},
            ]
          },
          {
            'label': 'Commercial',
            'value': 'commercial',
            'units': [
              {'label': 'Shop', 'value': 'shop'},
              {'label': 'Office', 'value': 'office'},
              {'label': 'Warehouse', 'value': 'warehouse'},
            ]
          }
        ]
      },
      {
        'label': LangKeys.rentalsOutsideCompound.tr(),
        'value': 'rentals_outside_compound',
        'subtypes': [
          {
            'label': 'Buy',
            'value': 'buy',
            'units': [
              {'label': 'Apartment', 'value': 'apartment'},
              {'label': 'Townhouse', 'value': 'townhouse'},
            ]
          },
          {
            'label': 'Rent',
            'value': 'rent',
            'units': [
              {'label': 'Villa', 'value': 'villa'},
              {'label': 'Studio', 'value': 'studio'},
            ]
          }
        ]
      },
      {
        'label':LangKeys.rentalsInsideCompound.tr(),
        'value': 'rentals_inside_compound',
        'subtypes': [
          {
            'label': 'Residential',
            'value': 'residential',
            'units': [
              {'label': 'Furnished Apartment', 'value': 'furnished_apartment'},
              {'label': 'Unfurnished Apartment', 'value': 'unfurnished_apartment'},
            ]
          },
          {
            'label': 'Commercial',
            'value': 'commercial',
            'units': [
              {'label': 'Shop', 'value': 'shop'},
              {'label': 'Office', 'value': 'office'},
              {'label': 'Warehouse', 'value': 'warehouse'},
            ]
          }
        ]
      }
    ]
  };
    }
}