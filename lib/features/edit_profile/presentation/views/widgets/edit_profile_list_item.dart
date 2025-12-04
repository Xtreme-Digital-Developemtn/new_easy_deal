import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class EditProfileListItem extends StatelessWidget {
  const EditProfileListItem({
    super.key,
    this.isLast = false,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final bool isLast;
  final String title;
  final String subTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title.tr(), style: AppStyles.black16Medium),
                Row(
                  children: [
                    Text(subTitle, style: AppStyles.gray14Medium),
                    Gap(8.w),
                    SvgPicture.asset(context.isArabic ? SvgImages.arrow :  SvgImages.arrowLeft,
                    colorFilter: ColorFilter.mode(AppColors.primaryDark, BlendMode.srcIn),),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (!isLast)
          Divider(
            color: Color.fromRGBO(213, 224, 252, 1),
            height: 16.h,
          ),
      ],
    );
  }
}