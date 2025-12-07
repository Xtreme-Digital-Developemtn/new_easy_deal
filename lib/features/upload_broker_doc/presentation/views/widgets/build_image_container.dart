import 'dart:io';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class BuildImageContainer extends StatelessWidget {
  final bool isFront;
  final File? imageFile;
  final VoidCallback onPickImage;
  final VoidCallback onClearImage;

  const BuildImageContainer({
    super.key,
    required this.isFront,
    required this.imageFile,
    required this.onPickImage,
    required this.onClearImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPickImage,
      child: AspectRatio(
        aspectRatio: 1.586,
        child: Container(
          height: 180.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.primaryDark,
              width: 2.w,
            ),
            color: AppColors.primaryLight.withValues(alpha: 0.3),
          ),
          child: imageFile == null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_a_photo,
                size: 40.sp,
                color: AppColors.primaryDark,
              ),
              Gap(8.h),

              Text(
                isFront
                    ? LangKeys.uploadTheFrontOfTheCardImage.tr()
                    : LangKeys.uploadTheBackOfTheCardImage.tr(),
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          )
              : Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: InkWell(
                  onTap: onClearImage,
                  child: Container(
                    padding:   EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      shape: BoxShape.circle,
                    ),
                    child:   Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
