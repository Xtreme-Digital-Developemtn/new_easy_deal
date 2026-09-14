import '../../../../../main_imports.dart';
import '../../view_model/add_property_cubit.dart';
import '../../view_model/add_property_states.dart';
import 'ap_publish_caption_sheet.dart';

/// Step 5 – review + submit. Mirrors the website's final step: a confirmation
/// header, a notes/info box, then the draft & publish actions.
class ApStep5Review extends StatelessWidget {
  const ApStep5Review({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final isArabic = context.isArabic;
    final loading = context.watch<AddPropertyCubit>().state is CreateUnitLoadingState;

    return Column(
      children: [
        Gap(8.h),
        Icon(Icons.check_circle, color: Colors.green, size: 56.sp),
        Gap(16.h),
        Text(
          isArabic ? 'جاهز لإرسال العقار' : 'Ready to Submit Property',
          style: AppStyles.black18SemiBold,
          textAlign: TextAlign.center,
        ),
        Gap(8.h),
        Text(
          isArabic
              ? 'يرجى مراجعة جميع المعلومات التي أدخلتها والنقر على إرسال لإضافة العقار.'
              : "Please review all the information you've entered and click submit to add the property.",
          textAlign: TextAlign.center,
          style: AppStyles.black14Regular.copyWith(color: AppColors.gray),
        ),
        Gap(20.h),

        // Notes / info box (shown before the add button, same as the website).
        _notesBox(isArabic),
        Gap(28.h),

        // Draft (add) button.
        CustomButton(
          text: isArabic ? 'إضافة عقار' : 'Add Property',
          iconData: Icons.save_outlined,
          onPressed: loading ? null : () => cubit.submit(publish: false),
        ),
        Gap(12.h),

        // Publish button → opens the caption bottom sheet, then publishes.
        CustomButton(
          text: isArabic ? 'إضافة عقار ونشر' : 'Add Property & Publish',
          iconData: Icons.campaign_outlined,
          color: AppColors.white,
          textColor: AppColors.primaryDark,
          onPressed: loading
              ? null
              : () => ApPublishCaptionSheet.show(
                    context,
                    onPublish: (caption) => cubit.submit(publish: true, caption: caption),
                  ),
        ),

        if (loading) ...[Gap(16.h), const CustomLoading()],
      ],
    );
  }

  Widget _notesBox(bool isArabic) {
    final items = isArabic
        ? const [
            '• معلومات المالك يتم جمعها في الخطوة 1',
            '• الموقف القانوني هي جزء من الخطوة 2 (بيانات الوحدة)',
            '• تم إعادة تنظيم جميع النماذج لتحسين تجربة المستخدم',
          ]
        : const [
            '• Owner information is now collected in Step 1',
            '• Legal Status is now part of Step 2 (Unit Information)',
            '• All forms have been reorganized for better user experience',
          ];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.blueLight.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.blueLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isArabic ? 'ملاحظة:' : 'Note:', style: AppStyles.black14SemiBold),
          Gap(8.h),
          for (final line in items) ...[
            Text(line, style: AppStyles.black14Regular.copyWith(color: AppColors.black)),
            Gap(4.h),
          ],
        ],
      ),
    );
  }
}
