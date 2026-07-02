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
        final isLoading = state is CreateRequestLoadingState;
        final isLastStep = createRequestCubit.currentStepNumber >= createRequestCubit.totalSteps;

        final bool isStepComplete = createRequestCubit.isCurrentStepComplete();

        return GestureDetector(
          onTap: (isLoading || !isStepComplete) ? null : (){
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
              gradient: (isLoading || !isStepComplete) ? null : const LinearGradient(
                colors: [AppColors.primaryDark, AppColors.primaryLight],
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(8),
              color: (isLoading || !isStepComplete) ? AppColors.blueVeryLight : null,
            ),
            child: Center(
              child: isLoading
                  ? LoadingAnimationWidget.threeArchedCircle(
                      size: 24, color: AppColors.primaryDark,
                    )
                  : Text(
                      isLastStep ? LangKeys.send.tr() : LangKeys.next.tr(),
                      style: AppStyles.black14Medium.copyWith(
                        color: !isStepComplete ? AppColors.gray : AppColors.scaffoldBackground,
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
