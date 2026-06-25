import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/notifications/presentation/view_model/notifications_cubit.dart';
import 'package:easy_deal/features/notifications/presentation/view_model/notifications_states.dart';
import 'package:easy_deal/features/notifications/presentation/views/widgets/notify_item.dart';
import 'package:easy_deal/main_imports.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>().getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.notifications),
      body: BlocBuilder<NotificationsCubit, NotificationsStates>(
        builder: (context, state) {
          if (state is GetNotificationsLoadingState) {
            return const CustomLoading();
          }
          if (state is GetNotificationsErrorState) {
            return Center(
              child: Text(
                state.error,
                style: AppStyles.gray14Medium,
                textAlign: TextAlign.center,
              ),
            );
          }
          final notifications =
              context.read<NotificationsCubit>().notificationsModel?.data ?? [];
          if (notifications.isEmpty) {
            return Center(
              child: Text(
                'No notifications',
                style: AppStyles.gray14Medium,
              ),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemCount: notifications.length,
            separatorBuilder: (_, __) => Gap(12.h),
            itemBuilder: (context, index) {
              final item = notifications[index];
              return NotifyItem(
                notification: item,
                onAccept: () {
                  Toast.showSuccessToast(
                      msg: 'Accepted', context: context);
                },
                onReject: () {
                  Toast.showSuccessToast(
                      msg: 'Rejected', context: context);
                },
              );
            },
          );
        },
      ),
    );
  }
}