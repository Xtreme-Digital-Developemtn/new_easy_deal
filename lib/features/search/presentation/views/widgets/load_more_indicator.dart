import '../../../../../core/shared_widgets/error_ui.dart';
import '../../../../../main_imports.dart';

class LoadMoreIndicator extends StatelessWidget {
  final bool hasMore;
  final bool isLoadingMore;
  final String? errorMessage;
  final VoidCallback? onTap;
  const LoadMoreIndicator({
    super.key,
    required this.hasMore,
    required this.isLoadingMore,
    this.errorMessage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasMore && errorMessage == null) {
      return const SizedBox.shrink();
    }
    if (errorMessage != null && !isLoadingMore) {
      return ErrorWidgetUi(
        message: errorMessage,
        onRetry: () => onTap?.call(),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          if (isLoadingMore)
            CustomLoading()
          else
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      size: 16.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                    Gap(8.w),
                    Text(
                      'تحميل المزيد',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}