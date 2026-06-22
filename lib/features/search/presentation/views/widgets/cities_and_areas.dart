import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../../data/models/areas_model.dart';
import '../../../data/models/cities_model.dart';
import '../../view_model/search_cubit.dart';

class CitiesAndAreas extends StatelessWidget {
  const CitiesAndAreas({super.key});

  @override
  Widget build(BuildContext context) {


    /// &unitOperation=sell
    /// &priceFrom=1006&
    /// priceTo=2000
    /// &deliveryStatus=immediate_delivery
    /// &compoundType=inside_compound
    /// &unitType=medical_clinics


    return BlocBuilder<SearchCubit , SearchStates>(
      builder: (context,state){
        var cubit = context.read<SearchCubit>();
        var isArabic = EasyLocalization.of(context)!.currentLocale!.languageCode == "ar";
        var citiesList = cubit.citiesModel?.data ?? [];
        var areasList = cubit.areasModel?.data ?? [];

        var cityNames = citiesList.map((e) => isArabic ? (e.nameAr ?? '') : (e.nameEn ?? '')).toList();
        var areaNames = areasList.map((e) => isArabic ? (e.nameAr ?? '') : (e.nameEn ?? '')).toList();

        var currentCityName = cubit.city == null ? null
            : isArabic ? cubit.city : citiesList.where((e) => e.nameAr == cubit.city).map((e) => e.nameEn ?? '').firstOrNull;
        var currentAreaName = cubit.area == null ? null
            : isArabic ? cubit.area : areasList.where((e) => e.nameAr == cubit.area).map((e) => e.nameEn ?? '').firstOrNull;

        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.cities.tr()),
                  Gap(4.h),
                  if (cityNames.isNotEmpty)
                    CustomDropdown<String>(
                      value: currentCityName,
                      items: cityNames,
                      hint: LangKeys.cities.tr(),
                      itemDisplayBuilder: (item) => item,
                      onChanged: (val) {
                        if (val != null) {
                          var city = citiesList.firstWhere(
                            (e) => (isArabic ? e.nameAr : e.nameEn) == val,
                            orElse: () => Cities(id: 0, nameAr: val, nameEn: val),
                          );
                          cubit.selectTheCity(city);
                        }
                      },
                    )
                  else if (state is GetAllCitiesErrorState)
                    SizedBox(
                      height: 56.h,
                      child: Center(
                        child: Text(LangKeys.notAvailable.tr(), style: AppStyles.gray12Medium),
                      ),
                    )
                  else
                    SizedBox(height: 56.h, child: Center(child: CustomLoading(size: 24.sp))),
                ],
              ),
            ),

            Gap(8.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.areas.tr()),
                  Gap(4.h),
                  if (areaNames.isNotEmpty)
                    CustomDropdown<String>(
                      value: currentAreaName,
                      items: areaNames,
                      hint: LangKeys.areas.tr(),
                      itemDisplayBuilder: (item) => item,
                      onChanged: (val) {
                        if (val != null) {
                          var area = areasList.firstWhere(
                            (e) => (isArabic ? e.nameAr : e.nameEn) == val,
                            orElse: () => Areas(id: 0, nameAr: val, nameEn: val, cityId: 0),
                          );
                          cubit.selectTheArea(area);
                        }
                      },
                    )
                  else if (cubit.city != null && state is! GetAllAreasErrorState)
                    SizedBox(height: 56.h, child: Center(child: CustomLoading(size: 24.sp)))
                  else
                    SizedBox(height: 56.h, child: Center(child: Text(LangKeys.notAvailable.tr(), style: AppStyles.gray12Medium))),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

