import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';

class BrokerCategoryItem extends StatelessWidget {
  const BrokerCategoryItem({super.key, required this.svgImage, required this.title, this.onTap});
  final String svgImage;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.primaryDark,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.r),
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.gray1,
                ),
                child: SvgPicture.asset(svgImage),
              ),
              Gap(6.w),
              Text(
                title.tr(),
                style: AppStyles.white14SemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
