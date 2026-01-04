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
        var cubit = context.watch<SearchCubit>();
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.cities.tr()),
                  Gap(4.h),
                  CustomDropdown<Cities>(
                    value: cubit.city == null
                        ? null
                        : cubit.citiesModel!.data!
                        .firstWhere((e) => e.nameAr == cubit.city),

                    items: cubit.citiesModel?.data ?? [],

                    hint: LangKeys.cities.tr(),

                    itemDisplayBuilder: (item) =>
                    EasyLocalization.of(context)!.currentLocale!.languageCode == "ar"
                        ? item.nameAr ?? ""
                        : item.nameEn ?? "",

                    onChanged: (val) {
                      cubit.selectTheCity(val!);
                    },
                  ),
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
                  if (state is GetAllAreasLoadingState)
                      CustomLoading(size: 30.sp,)
                  else
                  CustomDropdown<Areas>(
                    value: cubit.area == null || cubit.areasModel == null
                        ? null
                        : cubit.areasModel!.data!
                        .firstWhere((e) => e.nameAr == cubit.area),

                    items: cubit.areasModel?.data ?? [],

                    hint: LangKeys.areas.tr(),

                    itemDisplayBuilder: (item) =>
                    EasyLocalization.of(context)!.currentLocale!.languageCode == "ar"
                        ? item.nameAr ?? ""
                        : item.nameEn ?? "",

                    onChanged: (val) {
                      cubit.selectTheArea(val!);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },

    );
  }
}

