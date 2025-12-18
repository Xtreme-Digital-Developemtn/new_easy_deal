import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorWidgetUi extends StatelessWidget {
  const ErrorWidgetUi({
    super.key,
    required this.onRetry,
    this.message,
  });

  final VoidCallback onRetry;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:   EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.errorDark,
              size: 28.sp,
            ),
            Gap(8.h),
            Text(
              message ?? LangKeys.somethingWentWrong.tr(),
              textAlign: TextAlign.center,
              style:  AppStyles.black16Medium,
            ),
            Gap(8.h),
            SizedBox(
              height: 32.h,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  padding:   EdgeInsets.symmetric(horizontal: 14.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  LangKeys.reload.tr(),
                  style: AppStyles.primary16SemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
