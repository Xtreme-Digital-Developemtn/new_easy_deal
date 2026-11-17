import 'dart:io';

import '../../../../../main_imports.dart';
import '../../view_model/add_property_cubit.dart';
import '../../view_model/add_property_states.dart';

/// Step 4 – media & documents upload (main image, gallery, unit plan).
///
/// كل كارت بيعرض معاينة للصور المختارة فعلاً (مش مجرد عدد)، وبيسمح بحذف أي
/// صورة. المعرض بس هو اللي بياخد أكتر من صورة؛ الصورة الرئيسية ومخطط الوحدة
/// صورة واحدة لكل واحد لأن ده اللي الـ API بياخده.
class ApStep4Documents extends StatelessWidget {
  const ApStep4Documents({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;
    return BlocBuilder<AddPropertyCubit, AddPropertyStates>(
      buildWhen: (_, state) => state is FilesChangedState || state is PickFileErrorState,
      builder: (context, state) {
        final cubit = context.read<AddPropertyCubit>();
        return Column(
          children: [
            _uploadCard(
              context,
              cubit,
              isArabic,
              field: 'diagram',
              title: isArabic ? 'صورة الوحدة الرئيسية' : 'Main Unit Image',
            ),
            Gap(16.h),
            _uploadCard(
              context,
              cubit,
              isArabic,
              field: 'layout',
              title: isArabic ? 'صور المعرض' : 'Gallery Images',
            ),
            Gap(16.h),
            _uploadCard(
              context,
              cubit,
              isArabic,
              field: 'locationInMasterPlan',
              title: isArabic ? 'مخطط الوحدة' : 'Unit Plan',
            ),
          ],
        );
      },
    );
  }

  Widget _uploadCard(
    BuildContext context,
    AddPropertyCubit cubit,
    bool isArabic, {
    required String field,
    required String title,
  }) {
    final files = cubit.filesOf(field);
    final count = files.length;
    final hasFiles = count > 0;
    final isMulti = cubit.isMultiFileField(field);
    final filesWord = isArabic ? 'ملف' : 'files';
    final atMax = isMulti && count >= AddPropertyCubit.maxGalleryImages;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: hasFiles ? AppColors.primaryDark : AppColors.gray, width: 2),
        color: hasFiles ? AppColors.white : Colors.grey[50],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: atMax ? null : () => cubit.pickFiles(field),
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                Icon(
                  hasFiles ? Icons.check_circle : Icons.cloud_upload_outlined,
                  size: 34.sp,
                  color: hasFiles ? AppColors.primaryDark : AppColors.gray,
                ),
                Gap(6.h),
                Text(title, style: AppStyles.black14SemiBold),
                Gap(4.h),
                Text(
                  isMulti
                      ? (isArabic
                          ? 'اضغط لاختيار صور (حتى ${AddPropertyCubit.maxGalleryImages} صورة)'
                          : 'Tap to pick images (up to ${AddPropertyCubit.maxGalleryImages})')
                      : (isArabic ? 'اضغط لاختيار صورة واحدة' : 'Tap to pick one image'),
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
                      '$count $filesWord',
                      style: TextStyle(fontSize: 11.sp, color: AppColors.white),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (hasFiles) ...[
            Gap(12.h),
            _previews(cubit, field, files, isArabic),
          ],
        ],
      ),
    );
  }

  Widget _previews(AddPropertyCubit cubit, String field, List<File> files, bool isArabic) {
    return SizedBox(
      height: 84.h,
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
                width: 84.h,
                height: 84.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 84.h,
                  height: 84.h,
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: Icon(Icons.broken_image_outlined, color: AppColors.gray, size: 24.sp),
                ),
              ),
            ),
            Positioned(
              top: 2.h,
              right: 2.w,
              child: GestureDetector(
                onTap: () => cubit.removeFile(field, i),
                child: Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                  child: Icon(Icons.close, size: 14.sp, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
