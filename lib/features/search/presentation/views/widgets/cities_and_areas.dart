import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../../data/models/areas_model.dart';
import '../../../data/models/cities_model.dart';
import '../../../../create_request/data/models/sub_areas_model.dart';
import '../../view_model/search_cubit.dart';

/// فلتر الموقع في شاشة البحث: المدينة + المنطقة + المنطقة الفرعية،
/// بنفس قيم باقي التطبيق (نفس الـ endpoints بتاعة location).
class CitiesAndAreas extends StatelessWidget {
  const CitiesAndAreas({super.key});

  /// القيمة لازم تكون موجودة في `items` وإلا DropdownButton بيعمل crash.
  static String? _safeValue(List<String> items, String? value) =>
      (value != null && items.contains(value)) ? value : null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        var cubit = context.read<SearchCubit>();
        var isArabic =
            EasyLocalization.of(context)!.currentLocale!.languageCode == "ar";
        var citiesList = cubit.citiesModel?.data ?? [];
        var areasList = cubit.areasModel?.data ?? [];
        var subAreasList = cubit.subAreasModel?.data ?? [];

        var cityNames =
            citiesList.map((e) => isArabic ? (e.nameAr ?? '') : (e.nameEn ?? '')).toList();
        var areaNames =
            areasList.map((e) => isArabic ? (e.nameAr ?? '') : (e.nameEn ?? '')).toList();
        var subAreaNames = subAreasList
            .map((e) => isArabic ? (e.nameAr ?? '') : (e.nameEn ?? ''))
            .toList();

        var currentCityName = cubit.city == null
            ? null
            : isArabic
                ? cubit.city
                : citiesList
                    .where((e) => e.nameAr == cubit.city)
                    .map((e) => e.nameEn ?? '')
                    .firstOrNull;
        var currentAreaName = cubit.area == null
            ? null
            : isArabic
                ? cubit.area
                : areasList
                    .where((e) => e.nameAr == cubit.area)
                    .map((e) => e.nameEn ?? '')
                    .firstOrNull;
        var currentSubAreaName = cubit.subArea == null
            ? null
            : isArabic
                ? cubit.subArea
                : subAreasList
                    .where((e) => e.nameAr == cubit.subArea)
                    .map((e) => e.nameEn ?? '')
                    .firstOrNull;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LangKeys.cities.tr()),
                      Gap(4.h),
                      if (cityNames.isNotEmpty)
                        CustomDropdown<String>(
                          value: _safeValue(cityNames, currentCityName),
                          items: cityNames,
                          hint: LangKeys.cities.tr(),
                          itemDisplayBuilder: (item) => item,
                          onChanged: (val) {
                            if (val != null) {
                              var city = citiesList.firstWhere(
                                (e) => (isArabic ? e.nameAr : e.nameEn) == val,
                                orElse: () =>
                                    Cities(id: 0, nameAr: val, nameEn: val),
                              );
                              cubit.selectTheCity(city);
                            }
                          },
                        )
                      else if (state is GetAllCitiesErrorState ||
                          state is GetAllCitiesSuccessState)
                        SizedBox(
                          height: 56.h,
                          child: Center(
                            child: Text(LangKeys.notAvailable.tr(),
                                style: AppStyles.gray12Medium),
                          ),
                        )
                      else
                        SizedBox(
                            height: 56.h,
                            child: Center(child: CustomLoading(size: 24.sp))),
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
                          value: _safeValue(areaNames, currentAreaName),
                          items: areaNames,
                          hint: LangKeys.areas.tr(),
                          itemDisplayBuilder: (item) => item,
                          onChanged: (val) {
                            if (val != null) {
                              var area = areasList.firstWhere(
                                (e) => (isArabic ? e.nameAr : e.nameEn) == val,
                                orElse: () => Areas(
                                    id: 0, nameAr: val, nameEn: val, cityId: 0),
                              );
                              cubit.selectTheArea(area);
                            }
                          },
                        )
                      else if (cubit.cityId == null)
                        SizedBox(
                          height: 56.h,
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              LangKeys.selectCityFirst.tr(),
                              style: AppStyles.gray12Medium,
                            ),
                          ),
                        )
                      else if (state is! GetAllAreasErrorState &&
                          state is! GetAllAreasSuccessState)
                        SizedBox(
                            height: 56.h,
                            child: Center(child: CustomLoading(size: 24.sp)))
                      else
                        SizedBox(
                          height: 56.h,
                          child: Center(
                            child: Text(LangKeys.notAvailable.tr(),
                                style: AppStyles.gray12Medium),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            Gap(12.h),

            /// المنطقة الفرعية: بتتفتح بعد اختيار المدينة والمنطقة
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LangKeys.subArea.tr()),
                Gap(4.h),
                if (cubit.cityId == null)
                  SizedBox(
                    height: 56.h,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        LangKeys.selectCityFirst.tr(),
                        style: AppStyles.gray12Medium,
                      ),
                    ),
                  )
                else if (cubit.areaId == null)
                  SizedBox(
                    height: 56.h,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        LangKeys.selectAreaFirst.tr(),
                        style: AppStyles.gray12Medium,
                      ),
                    ),
                  )
                else if (subAreaNames.isNotEmpty)
                  CustomDropdown<String>(
                    value: _safeValue(subAreaNames, currentSubAreaName),
                    items: subAreaNames,
                    hint: LangKeys.subArea.tr(),
                    itemDisplayBuilder: (item) => item,
                    onChanged: (val) {
                      if (val != null) {
                        var subArea = subAreasList.firstWhere(
                          (e) => (isArabic ? e.nameAr : e.nameEn) == val,
                          orElse: () => SubArea(id: 0, nameAr: val, nameEn: val),
                        );
                        cubit.selectTheSubArea(subArea);
                      }
                    },
                  )
                else if (state is GetAllSubAreasErrorState ||
                    state is GetAllSubAreasSuccessState)
                  SizedBox(
                    height: 56.h,
                    child: Center(
                      child: Text(LangKeys.notAvailable.tr(),
                          style: AppStyles.gray12Medium),
                    ),
                  )
                else
                  SizedBox(
                      height: 56.h,
                      child: Center(child: CustomLoading(size: 24.sp))),
              ],
            ),
          ],
        );
      },
    );
  }
}
