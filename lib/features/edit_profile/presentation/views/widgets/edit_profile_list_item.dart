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
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Title
                Expanded(
                  flex: 4,
                  child: Text(
                    title.tr(),
                    style: AppStyles.black16Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Gap(12.w),

                /// SubTitle + Arrow
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// SubTitle
                      Flexible(
                        child: Text(
                          subTitle,
                          style: AppStyles.gray14Medium,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        ),
                      ),

                      Gap(8.w),

                      /// Arrow
                      SvgPicture.asset(
                        context.isArabic
                            ? SvgImages.arrow
                            : SvgImages.arrowLeft,
                        width: 18.w,
                        height: 18.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        if (!isLast)
          Divider(
            color: const Color.fromRGBO(213, 224, 252, 1),
            height: 16.h,
          ),
      ],
    );
  }
}