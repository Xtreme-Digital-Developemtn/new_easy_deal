import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

/// رسالة جامعة بتظهر فوق الفورم لما المستخدم يضغط «متابعة» وفيه حقول
/// ناقصة أو قيم غلط — بتعرض قائمة بأسماء الحقول المطلوب تصحيحها.
class ValidationErrorsSummary extends StatelessWidget {
  const ValidationErrorsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        final cubit = context.read<CreateRequestCubit>();
        if (!cubit.validationAttempted || cubit.formErrors.isEmpty) {
          return const SizedBox.shrink();
        }
        final labels = cubit.currentStepErrorLabels;
        if (labels.isEmpty) return const SizedBox.shrink();

        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.06),
            border: Border.all(color: Colors.red.withValues(alpha: 0.4), width: 1.5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 20.sp),
                  Gap(8.w),
                  Expanded(
                    child: Text(
                      LangKeys.validationErrorsFound.tr(),
                      style: AppStyles.black14SemiBold.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Gap(6.h),
              Text(
                LangKeys.correctIssuesBeforeProceeding.tr(),
                style: TextStyle(fontSize: 12.sp, color: AppColors.gray),
              ),
              Gap(8.h),
              ...labels.map(
                (label) => Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• ', style: TextStyle(fontSize: 13.sp, color: Colors.red)),
                      Expanded(
                        child: Text(
                          label,
                          style: TextStyle(fontSize: 13.sp, color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
