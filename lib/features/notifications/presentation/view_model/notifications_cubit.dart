

import '../../../../main_imports.dart';
import '../../data/repos/notifications_repo.dart';
import 'notifications_states.dart';


class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitState());

  NotificationsRepo? notificationsRepo;
  static NotificationsCubit get(context) => BlocProvider.of(context);




}