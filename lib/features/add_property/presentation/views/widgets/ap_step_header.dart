import '../../../../../main_imports.dart';
import '../../view_model/add_property_cubit.dart';

/// Title + "Step X of Y" + progress bar shown at the top of every step.
class ApStepHeader extends StatelessWidget {
  const ApStepHeader({super.key});

  static const _titles = <int, (String, String, String, String)>{
    // step: (boldAr, normalAr, boldEn, normalEn)
    0: ('إضافة عقار', 'فئة العقار', 'Add Property', 'Property Category'),
    1: ('إضافة وحدة', 'معلومات الموقع', 'Add Unit', 'Location Information'),
    2: ('إضافة وحدة', 'معلومات الوحدة', 'Add Unit', 'Unit Information'),
    3: ('إضافة وحدة', 'تفاصيل الدفع', 'Add Unit', 'Payment Details'),
    4: ('إضافة عقار', 'الوسائط والمستندات', 'Add Property', 'Media & Documents'),
    5: ('إضافة عقار', 'مراجعة وإرسال', 'Add Property', 'Review & Submit'),
  };

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final isArabic = context.isArabic;
    final t = _titles[cubit.currentStep] ?? _titles[0]!;
    final bold = isArabic ? t.$1 : t.$3;
    final normal = isArabic ? t.$2 : t.$4;
    final stepWord = isArabic ? 'الخطوة' : 'Step';
    final ofWord = isArabic ? 'من' : 'of';

    return Column(
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(text: '$bold - ', style: AppStyles.black18SemiBold.copyWith(color: AppColors.primaryDark)),
              TextSpan(
                text: normal,
                style: AppStyles.black18SemiBold.copyWith(color: AppColors.primaryDark, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Gap(8.h),
        Text(
          '$stepWord ${cubit.currentStep} $ofWord ${cubit.totalSteps}',
          style: AppStyles.black14SemiBold.copyWith(color: AppColors.gray),
        ),
        Gap(10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: LinearProgressIndicator(
            value: cubit.currentStep / cubit.totalSteps,
            minHeight: 8.h,
            backgroundColor: AppColors.blueLight,
            valueColor: const AlwaysStoppedAnimation(AppColors.primaryDark),
          ),
        ),
        Gap(24.h),
      ],
    );
  }
}
