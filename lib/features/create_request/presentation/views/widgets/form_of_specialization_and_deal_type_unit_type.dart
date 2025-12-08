import 'package:easy_deal/core/shared_widgets/custom_drop_down.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class FormOfSpecializationAndDealTypeAndUnitType extends StatelessWidget {
  const FormOfSpecializationAndDealTypeAndUnitType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.scopeOfSpecialization.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomDropdown(
              height: 42.h,
              value: createRequestCubit.selectedSpecialization,
              items: ["scope 1", "scope 2", "scope 3"],
              onChanged: (val) {
                createRequestCubit.selectSpecialization(val);
              },
              hint: LangKeys.scopeOfSpecialization.tr(),
              itemDisplayBuilder: (scope) => scope.toString(),
            ),
            Gap(12.h),
            ///
            Text(LangKeys.dealType.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomDropdown(
              height: 42.h,
              value: createRequestCubit.selectedDealType,
              items: ["Deal Type 1", "Deal Type 2", "Deal Type 3"],
              onChanged: (val) {
                createRequestCubit.selectDealType(val);
              },
              hint: LangKeys.dealType.tr(),
              itemDisplayBuilder: (dealType) => dealType.toString(),
            ),
            Gap(12.h),
            ///
            Text(LangKeys.unitType.tr(),style: AppStyles.black14Regular,),
            Gap(12.h),
            CustomDropdown(
              height: 42.h,
              value: createRequestCubit.selectedUnitType,
              items: ["unitType 1", "unitType 2", "unitType 3"],
              onChanged: (val) {
                createRequestCubit.selectUnitType(val);
              },
              hint: LangKeys.unitType.tr(),
              itemDisplayBuilder: (unitType) => unitType.toString(),
            ),

          ],
        );
      },

    );
  }
}
