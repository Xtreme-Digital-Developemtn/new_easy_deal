import '../../../../../main_imports.dart';
import '../../view_model/add_property_cubit.dart';

/// Bottom navigation for the stepper (Next / Back / Cancel).
class ApNavButtons extends StatelessWidget {
  const ApNavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final isArabic = context.isArabic;

    // Step 5 has its own submit buttons in the content.
    final showNext = cubit.currentStep < cubit.totalSteps;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showNext)
              Row(
                children: [
                  if (cubit.currentStep == 0)
                    Expanded(
                      child: CustomButton(
                        text: isArabic ? 'إلغاء' : 'Cancel',
                        color: AppColors.blueLight,
                        textColor: AppColors.primaryDark,
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                    ),
                  if (cubit.currentStep == 0) Gap(12.w),
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      text: isArabic ? 'التالي' : 'Next',
                      onPressed: cubit.onNextPressed,
                    ),
                  ),
                ],
              ),
            if (cubit.currentStep > 0)
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: TextButton(
                  onPressed: cubit.prevStep,
                  child: Text(
                    isArabic ? 'الرجوع للخطوة السابقة' : 'Back to previous step',
                    style: AppStyles.black14SemiBold.copyWith(color: AppColors.primaryDark),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
