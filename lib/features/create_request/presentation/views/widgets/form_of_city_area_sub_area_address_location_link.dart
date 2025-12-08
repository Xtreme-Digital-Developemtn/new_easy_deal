import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widgets/custom_drop_down.dart';

class FormOfCityAreaSubAreaAddressLocationLink extends StatelessWidget {
  const FormOfCityAreaSubAreaAddressLocationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context , state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.city.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomDropdown(
              value: createRequestCubit.selectedCity,
              items: ["city 1", "city 2", "city 3"],
              onChanged: (val) {
                createRequestCubit.selectCity(val);
              },
              hint: LangKeys.city.tr(),
              itemDisplayBuilder: (city) => city.toString(),
            ),
            Gap(12.h),
            ///
            Text(LangKeys.area.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomDropdown(
              value: createRequestCubit.selectedArea,
              items: ["area 1", "area 2", "area 3"],
              onChanged: (val) {
                createRequestCubit.selectArea(val);
              },
              hint: LangKeys.area.tr(),
              itemDisplayBuilder: (area) => area.toString(),
            ),
            Gap(12.h),
            ///
            Text(LangKeys.subArea.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomDropdown(
              value: createRequestCubit.selectedSubArea,
              items: ["subArea 1", "subArea 2", "subArea 3"],
              onChanged: (val) {
                createRequestCubit.selectSubArea(val);
              },
              hint: LangKeys.subArea.tr(),
              itemDisplayBuilder: (subArea) => subArea.toString(),
            ),
            Gap(12.h),
            ///
            Text(LangKeys.address.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomTextFormField(
              controller: createRequestCubit.addressCon,
              hintText: LangKeys.address.tr(),
            ),
            Gap(12.h),
            ///
            Text(LangKeys.locationLink.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomTextFormField(
              controller: createRequestCubit.locationLinkCon,
              hintText: LangKeys.locationLink.tr(),
            ),
            Gap(12.h),
          ],
        );
      },

    );
  }
}
