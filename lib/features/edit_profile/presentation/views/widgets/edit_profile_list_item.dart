import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class EditProfileListItem extends StatelessWidget {
  const EditProfileListItem({
    super.key,
    this.isLast = false,
    required this.title,
    this.subTitle,
    required this.onTap,
    this.showButton = false,
    this.buttonText,
    this.onButtonTap,
  });

  final bool isLast;
  final bool showButton;

  final String title;
  final String? subTitle;
  final String? buttonText;

  /// لما تضغط على الـ Item نفسه
  final VoidCallback onTap;

  /// لما تضغط على الزرار
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    final bool hasSubTitle = subTitle != null && subTitle!.trim().isNotEmpty;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: const Color.fromRGBO(213, 224, 252, 1),
              width: 1.w,
            ),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// القيمة الأساسية
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

                /// لو فيه Button يظهر مكان الـ Subtitle
                Expanded(
                  flex: 6,
                  child: showButton
                      ? Align(
                    alignment: context.isArabic
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: SizedBox(
                      height: 40.h,
                      child: CustomButton(
                        color : AppColors.white,
                        borderColor: BorderSide(
                          color: AppColors.primaryDark
                        ),
                        height: 20.h,
                        width: 70.w,
                        borderRadius: 12.r,
                        text:   (buttonText ?? '').tr(),
                        textColor: AppColors.primaryDark,
                      ),
                    ),
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// SubTitle
                      Flexible(
                        child: Text(
                          subTitle ?? '',
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

        if (isLast)
          Divider(
            color: const Color.fromRGBO(213, 224, 252, 1),
            height: 16.h,
          ),
      ],
    );
  }
}