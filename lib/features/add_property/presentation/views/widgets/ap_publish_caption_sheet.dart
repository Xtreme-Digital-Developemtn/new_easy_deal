import '../../../../../main_imports.dart';
import '../../../../../core/shared_widgets/general_bottom_sheet.dart';

/// Bottom sheet asking for an optional ad caption, then triggers publish.
class ApPublishCaptionSheet extends StatefulWidget {
  const ApPublishCaptionSheet({super.key, required this.onPublish});

  final ValueChanged<String> onPublish;

  static Future<void> show(BuildContext context, {required ValueChanged<String> onPublish}) {
    return StandardBottomSheet.show(
      context: context,
      isScrollControlled: true,
      child: ApPublishCaptionSheet(onPublish: onPublish),
    );
  }

  @override
  State<ApPublishCaptionSheet> createState() => _ApPublishCaptionSheetState();
}

class _ApPublishCaptionSheetState extends State<ApPublishCaptionSheet> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;
    return Padding(
      // Lift the sheet above the keyboard.
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 24.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 44.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.blueLight,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          Gap(20.h),
          Text(
            isArabic ? 'هل ترغب في إضافة نص وصفي للاعلان ؟' : 'Would you like to add a descriptive text for publishing?',
            style: AppStyles.black16SemiBold,
          ),
          Gap(12.h),
          CustomTextFormField(
            controller: _controller,
            hintText: isArabic ? 'اكتب ملاحظاتك / وصف الإعلان' : 'Write your notes / ad description',
            maxLines: 4,
            borderRadius: 10.r,
            borderWidth: 1.5,
          ),
          Gap(20.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: isArabic ? 'الغاء' : 'Cancel',
                  color: AppColors.blueLight,
                  textColor: AppColors.primaryDark,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: CustomButton(
                  text: isArabic ? 'نشر' : 'Publish',
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onPublish(_controller.text);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
