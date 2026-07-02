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
                        Text("${createRequestCubit.adjustedCurrentStep}",style: AppStyles.primary16SemiBold,),
                        Text(" / ${createRequestCubit.titleNames.length} ",style: AppStyles.black16SemiBold,),
                     ],
                   ),
                    Text(createRequestCubit.titleNames[createRequestCubit.currentStepNumber-1],style: AppStyles.gray14Medium,),
                  ],
                ),
                StepProgressIndicator(
                  totalSteps: createRequestCubit.titleNames.length,
                  currentStep: createRequestCubit.adjustedCurrentStep,
                  selectedColor: AppColors.green,
                  unselectedColor: AppColors.gray,
                  customStep: (index, color, _) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    );
                  },
                )
              ],
            ),

          ],
        );
      },

    );
  }
}
