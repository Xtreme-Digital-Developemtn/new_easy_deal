import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        final isLoading = state is CreateRequestLoadingState || createRequestCubit.isSubmitting;
        final isLastStep = createRequestCubit.currentStepNumber >= createRequestCubit.totalSteps;

        // كل الخطوات بتتحقّق جوه handleStepOne / handleNextSteps وبتعرض رسالة لكل
        // حقل ناقص، فالزرار لازم يفضل شغّال عشان الرسائل توصل للمستخدم.
        return GestureDetector(
          onTap: isLoading || createRequestCubit.isSubmitting ? null : (){
            if (createRequestCubit.currentStepNumber == 1) {
              createRequestCubit.handleStepOne(context);
            } else {
              createRequestCubit.handleNextSteps(context);
            }
          },
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              gradient: isLoading ? null : const LinearGradient(
                colors: [AppColors.primaryDark, AppColors.primaryLight],
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(8),
              color: isLoading ? AppColors.blueVeryLight : null,
            ),
            child: Center(
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.threeArchedCircle(
                          size: 24, color: AppColors.primaryDark,
                        ),
                        if (isLastStep) ...[
                          Gap(8.w),
                          Text(
                            LangKeys.sending.tr(),
                            style: AppStyles.black14Medium.copyWith(
                              color: AppColors.primaryDark,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ],
                    )
                  : Text(
                      isLastStep ? LangKeys.send.tr() : LangKeys.next.tr(),
                      style: AppStyles.black14Medium.copyWith(
                        color: AppColors.scaffoldBackground,
                        fontSize: 20,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
