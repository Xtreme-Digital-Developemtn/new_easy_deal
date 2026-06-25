import 'package:easy_deal/features/notifications/data/models/notifications_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class NotifyItem extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const NotifyItem({
    super.key,
    required this.notification,
    this.onAccept,
    this.onReject,
  });

  String _timeAgo(String? dateStr) {
    if (dateStr == null) return '';
    final date = DateTime.tryParse(dateStr);
    if (date == null) return '';
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${diff.inDays ~/ 7}w';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      color: Color.fromRGBO(12, 59, 182, 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 8.h,
                  width: 8.w,
                  margin: EdgeInsets.only(top: 6.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (notification.isRead ?? false)
                        ? AppColors.grayLight
                        : AppColors.primaryDark,
                  ),
                ),
                Gap(6.w),
                CustomNetWorkImage(
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.cover,
                  imageUrl:
                  "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/153FD/production/_126973078_whatsubject.jpg.webp",
                  raduis: 50,
                ),
                Gap(6.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        notification.title ?? '',
                        style: AppStyles.black16SemiBold,
                      ),
                      Text(
                        notification.body ?? '',
                        style: AppStyles.gray14Medium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (notification.type == 'request_assignment')
                        Gap(8.h),
                      if (notification.type == 'request_assignment')
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: onAccept,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(80, 32),
                                  maximumSize: Size(80, 32),
                                  backgroundColor: AppColors.primaryLight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(LangKeys.accept.tr(),
                                    style: AppStyles.white12Medium),
                              ),
                            ),
                            Gap(6.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: onReject,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(80, 32),
                                  maximumSize: Size(80, 32),
                                  backgroundColor: AppColors.errorLight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(LangKeys.reject.tr(),
                                    style: AppStyles.white12Medium),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _timeAgo(notification.createdAt),
                style: AppStyles.gray12Medium,
              ),
              Icon(Icons.linear_scale_sharp, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}