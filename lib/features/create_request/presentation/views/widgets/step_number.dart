import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepNumber extends StatelessWidget {
  const StepNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.newRequest.tr(),style: AppStyles.black16SemiBold,),
            Gap(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                     children: [
                       Text("${createRequestCubit.currentStepNumber}",style: AppStyles.primary16SemiBold,),
                       Text(" / 5 ",style: AppStyles.black16SemiBold,),
                     ],
                   ),
                    Text(createRequestCubit.titleNames[createRequestCubit.currentStepNumber-1],style: AppStyles.gray14Medium,),
                  ],
                ),
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: createRequestCubit.currentStepNumber,
                  selectedColor: AppColors.primaryDark,
                  unselectedColor: AppColors.gray,
                )
              ],
            ),

          ],
        );
      },

    );
  }
}
