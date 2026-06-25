

import 'package:easy_deal/features/notifications/data/models/notifications_model.dart';

import '../../../../main_imports.dart';
import '../../data/repos/notifications_repo.dart';
import 'notifications_states.dart';


class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitState());

  NotificationsRepo? notificationsRepo;
  static NotificationsCubit get(context) => BlocProvider.of(context);


  NotificationsModel? notificationsModel;

  Future<void> getNotifications() async {
    emit(GetNotificationsLoadingState());
    var result = await notificationsRepo!.getNotifications();
    return result.fold(
          (failure) {
        emit(GetNotificationsErrorState(failure.errMessage));
      },
          (data) async {
            notificationsModel = data;
        emit(GetNotificationsSuccessState(data));
      },
    );
  }


}