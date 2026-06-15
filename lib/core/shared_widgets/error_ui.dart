import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorWidgetUi extends StatelessWidget {
  const ErrorWidgetUi({
    super.key,
    required this.onRetry,
    this.message,
    this.submessage,
    this.isFullScreen = false,
  });

  final VoidCallback onRetry;
  final String? message;
  final String? submessage;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return isFullScreen ? _buildFullScreen(context) : _buildInline(context);
  }

  Widget _buildInline(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.15),
            width: 0.5.w,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon ring
            Container(
              width: 52.r,
              height: 52.r,
              decoration: BoxDecoration(
                color: AppColors.errorDark.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wifi_off_rounded,
                color: AppColors.errorDark,
                size: 24.sp,
              ),
            ),
            Gap(14.h),
            Text(
              message ?? LangKeys.somethingWentWrong.tr(),
              textAlign: TextAlign.center,
              style: AppStyles.black14Medium,
            ),
            if (submessage != null) ...[
              Gap(4.h),
              Text(
                submessage!,
                textAlign: TextAlign.center,
                style: AppStyles.gray12Regular,
              ),
            ],
            Gap(16.h),
            _RetryButton(onRetry: onRetry, fullWidth: false),
          ],
        ),
      ),
    );
  }

  // ── Full-screen variant (for whole pages)
  Widget _buildFullScreen(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72.r,
              height: 72.r,
              decoration: BoxDecoration(
                color: AppColors.errorDark.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                color: AppColors.errorDark,
                size: 32.sp,
              ),
            ),
            Gap(20.h),
            Text(
              message ?? LangKeys.somethingWentWrong.tr(),
              textAlign: TextAlign.center,
              style: AppStyles.black16Medium,
            ),
            Gap(8.h),
            Text(
              submessage ?? LangKeys.tryNow.tr(),
              textAlign: TextAlign.center,
              style: AppStyles.gray12Regular,
            ),
            Gap(24.h),
            _RetryButton(onRetry: onRetry, fullWidth: true),
          ],
        ),
      ),
    );
  }
}

// ── Shared retry button
class _RetryButton extends StatelessWidget {
  const _RetryButton({required this.onRetry, required this.fullWidth});
  final VoidCallback onRetry;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 38.h,
      child: OutlinedButton.icon(
        onPressed: onRetry,
        icon: Icon(Icons.refresh_rounded, size: 16.sp),
        label: Text(LangKeys.reload.tr()),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.errorDark,
          side: BorderSide(color: AppColors.errorDark.withOpacity(0.4), width: 0.5),
          backgroundColor: AppColors.errorDark.withOpacity(0.08),
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          textStyle: AppStyles.error13SemiBold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
