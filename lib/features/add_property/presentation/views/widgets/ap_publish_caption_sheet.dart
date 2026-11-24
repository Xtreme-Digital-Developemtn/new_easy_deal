import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../../../../core/shared_widgets/general_bottom_sheet.dart';
import '../../view_model/add_property_cubit.dart';
import '../../view_model/add_property_states.dart';

/// نافذة النشر كإعلان: بتاخد صور الإعلان **والوصف** مع بعض في نفس الخطوة،
/// وبعدين بتنفّذ النشر. الصور بتتخزن في `layout` (معرض الصور) اللي الـ submit
/// بيبعته كـ `layout[]`، فالإعلان بيطلع بصورة + caption مع بيانات الوحدة.
///
/// الصورة إجبارية هنا: زرار «نشر» مقفول لحد ما تترفع صورة واحدة على الأقل.
class ApPublishCaptionSheet extends StatefulWidget {
  const ApPublishCaptionSheet({
    super.key,
    required this.cubit,
    required this.onPublish,
  });

  /// الـ cubit بيتبعت صريح لأن النافذة route فوق الـ Navigator، فمابتشوفش
  /// الـ BlocProvider اللي جوه الشاشة.
  final AddPropertyCubit cubit;
  final ValueChanged<String> onPublish;

  /// الحقل اللي صور الإعلان بتتخزن فيه (معرض الصور).
  static const String imagesField = 'layout';

  /// ضغطتين سريعتين على «إضافة عقار ونشر» كانوا بيفتحوا النافذة مرتين فوق بعض.
  static bool _isOpen = false;

  static Future<void> show(
    BuildContext context, {
    required AddPropertyCubit cubit,
    required ValueChanged<String> onPublish,
  }) async {
    if (_isOpen) return;
    _isOpen = true;
    try {
      await StandardBottomSheet.show(
        context: context,
        isScrollControlled: true,
        child: ApPublishCaptionSheet(cubit: cubit, onPublish: onPublish),
      );
    } finally {
      _isOpen = false;
    }
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
    return BlocBuilder<AddPropertyCubit, AddPropertyStates>(
      bloc: widget.cubit,
      buildWhen: (_, state) =>
          state is FilesChangedState ||
          state is PickFileErrorState ||
          state is FilesLimitReachedState,
      builder: (context, state) {
        final files = widget.cubit.filesOf(ApPublishCaptionSheet.imagesField);
        final canPublish = files.isNotEmpty;
        return Padding(
          // Lift the sheet above the keyboard.
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 24.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
          ),
          child: SingleChildScrollView(
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

                // صور الإعلان — إجبارية.
                Row(
                  children: [
                    Text(
                      isArabic ? 'صور الإعلان' : 'Ad Images',
                      style: AppStyles.black16SemiBold,
                    ),
                    Text(
                      ' *',
                      style: AppStyles.black16SemiBold.copyWith(color: Colors.red),
                    ),
                  ],
                ),
                Gap(8.h),
                _imagesPicker(isArabic, files),
                Gap(20.h),

                // وصف الإعلان.
                Text(
                  isArabic
                      ? 'هل ترغب في إضافة نص وصفي للاعلان ؟'
                      : 'Would you like to add a descriptive text for publishing?',
                  style: AppStyles.black16SemiBold,
                ),
                Gap(12.h),
                CustomTextFormField(
                  controller: _controller,
                  hintText: isArabic
                      ? 'اكتب ملاحظاتك / وصف الإعلان'
                      : 'Write your notes / ad description',
                  maxLines: 4,
                  borderRadius: 10.r,
                  borderWidth: 1.5,
                ),
                if (!canPublish) ...[
                  Gap(8.h),
                  Text(
                    LangKeys.publishNeedsImage.tr(),
                    style: TextStyle(fontSize: 12.sp, color: Colors.red),
                  ),
                ],
                Gap(20.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: isArabic ? 'الغاء' : 'Cancel',
                        color: AppColors.blueLight,
                        textColor: AppColors.white,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    Gap(12.w),
                    Expanded(
                      child: CustomButton(
                        text: isArabic ? 'نشر' : 'Publish',
                        onPressed: canPublish
                            ? () {
                                Navigator.of(context).pop();
                                widget.onPublish(_controller.text);
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// كارت اختيار الصور + معاينة اللي اتختار مع إمكانية الحذف — نفس سلوك
  /// «صور المعرض» في خطوة المستندات، بس مضغوط جوه النافذة.
  Widget _imagesPicker(bool isArabic, List<File> files) {
    final hasFiles = files.isNotEmpty;
    final atMax = files.length >= AddPropertyCubit.maxGalleryImages;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: atMax
              ? null
              : () => widget.cubit.pickFiles(ApPublishCaptionSheet.imagesField),
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: hasFiles ? AppColors.primaryDark : Colors.red,
                width: 1.5,
              ),
              color: hasFiles ? AppColors.white : Colors.grey[50],
            ),
            child: Column(
              children: [
                Icon(
                  hasFiles ? Icons.check_circle : Icons.cloud_upload_outlined,
                  size: 30.sp,
                  color: hasFiles ? AppColors.primaryDark : AppColors.gray,
                ),
                Gap(6.h),
                Text(
                  isArabic
                      ? 'اضغط لاختيار صور الإعلان (حتى ${AddPropertyCubit.maxGalleryImages} صورة)'
                      : 'Tap to pick ad images (up to ${AddPropertyCubit.maxGalleryImages})',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11.sp, color: AppColors.gray),
                ),
                if (hasFiles) ...[
                  Gap(6.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      '${files.length} ${isArabic ? 'صورة' : 'images'}',
                      style: TextStyle(fontSize: 11.sp, color: AppColors.white),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (hasFiles) ...[
          Gap(10.h),
          SizedBox(
            height: 72.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: files.length,
              separatorBuilder: (_, __) => Gap(8.w),
              itemBuilder: (context, i) => Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                      files[i],
                      width: 72.h,
                      height: 72.h,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 72.h,
                        height: 72.h,
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: AppColors.gray,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2.h,
                    right: 2.w,
                    child: GestureDetector(
                      onTap: () => widget.cubit
                          .removeFile(ApPublishCaptionSheet.imagesField, i),
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, size: 14.sp, color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
