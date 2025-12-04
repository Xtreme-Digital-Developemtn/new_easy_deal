import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({super.key,  this.isLast = false, required this.title,
    required this.subTitle, required this.svgImage, required this.onTap,});
  final bool isLast;
  final String title;
  final String subTitle;
  final String svgImage;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.r),
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.grayLightest,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(svgImage),
                ),
                Gap(8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title.tr(),style: AppStyles.black16SemiBold,),
                    Text(subTitle.tr(),style: AppStyles.gray14Medium,),
                  ],
                ),
              ],
            ),
            IconButton(onPressed: onTap, icon: SvgPicture.asset(
                isArabic? SvgImages.arrow:
                SvgImages.arrowLeft,colorFilter: ColorFilter.mode(AppColors.primaryDark, BlendMode.srcIn),),),

          ],
        ),
        if (!isLast)
          Divider(
            color: Color.fromRGBO(213, 224, 252, 1),
            height: 30.h,
          ),
      ],
    );
  }
}
