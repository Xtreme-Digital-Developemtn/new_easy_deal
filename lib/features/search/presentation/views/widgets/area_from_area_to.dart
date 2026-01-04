import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class AreaFromAreaTo extends StatelessWidget {
  const AreaFromAreaTo({super.key});

  @override
  Widget build(BuildContext context) {
    return             BlocBuilder<SearchCubit , SearchStates>(
      builder: (context,state){
        var cubit = context.watch<SearchCubit>();
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.areaFrom.tr()),
                  Gap(4.h),
                  CustomTextFormField(
                    controller: cubit.areaFromCon,
                    hintText: LangKeys.areaFrom.tr(),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            Gap(8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.areaTo.tr()),
                  Gap(4.h),
                  CustomTextFormField(
                    controller: cubit.areaToCon,
                    hintText: LangKeys.areaTo.tr(),
                    keyboardType: TextInputType.number,
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
