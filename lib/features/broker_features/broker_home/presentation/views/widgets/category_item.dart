import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';

class BrokerCategoryItem extends StatelessWidget {
  const BrokerCategoryItem({
    super.key,
    required this.svgImage,
    required this.title,
    this.onTap,   required this.isSelected,
  });

  final String svgImage;
  final String title;

  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected ? AppColors.blueDark : AppColors.gray1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4.r),
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.gray1,
                  ),
                  child: SvgPicture.asset(svgImage,colorFilter: ColorFilter.mode(AppColors.primaryDark, BlendMode.srcIn),),
                ),
                Gap(6.w),
                Text(title.tr(), style:isSelected ? AppStyles.white14Medium : AppStyles.black14Medium),
              ],
            ),
            SvgPicture.asset(
              SvgImages.arrowLeft,
              colorFilter: ColorFilter.mode(isSelected ?  AppColors.white : AppColors.black, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
