import '../../../../../main_imports.dart';
import '../../view_model/add_property_cubit.dart';

/// Step 4 – media & documents upload (main image, gallery, unit plan).
class ApStep4Documents extends StatelessWidget {
  const ApStep4Documents({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final isArabic = context.isArabic;
    return Column(
      children: [
        _uploadCard(cubit, isArabic, field: 'diagram', title: isArabic ? 'صورة الوحدة الرئيسية' : 'Main Unit Image'),
        Gap(16.h),
        _uploadCard(cubit, isArabic, field: 'layout', title: isArabic ? 'صور المعرض' : 'Gallery Images'),
        Gap(16.h),
        _uploadCard(cubit, isArabic, field: 'locationInMasterPlan', title: isArabic ? 'مخطط الوحدة' : 'Unit Plan'),
      ],
    );
  }

  Widget _uploadCard(AddPropertyCubit cubit, bool isArabic, {required String field, required String title}) {
    final count = cubit.fileCount(field);
    final hasFiles = count > 0;
    final filesWord = isArabic ? 'ملف' : 'files';
    return GestureDetector(
      onTap: () => cubit.pickFiles(field),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: hasFiles ? AppColors.primaryDark : AppColors.gray, width: 2),
          color: hasFiles ? AppColors.white : Colors.grey[50],
        ),
        child: Column(
          children: [
            Icon(
              hasFiles ? Icons.check_circle : Icons.cloud_upload_outlined,
              size: 40.sp,
              color: hasFiles ? AppColors.primaryDark : AppColors.gray,
            ),
            Gap(6.h),
            Text(title, style: AppStyles.black14SemiBold),
            if (hasFiles) ...[
              Gap(6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(color: AppColors.primaryDark, borderRadius: BorderRadius.circular(12.r)),
                child: Text('$count $filesWord', style: TextStyle(fontSize: 11.sp, color: AppColors.white)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
