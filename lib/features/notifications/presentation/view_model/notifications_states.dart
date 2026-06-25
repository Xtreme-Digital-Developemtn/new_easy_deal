import 'package:easy_deal/features/notifications/data/models/notifications_model.dart';

abstract class NotificationsStates{}

class NotificationsInitState extends NotificationsStates{}

class GetNotificationsLoadingState extends NotificationsStates{}
class GetNotificationsErrorState extends NotificationsStates{
  final String error;
  GetNotificationsErrorState(this.error);

}
class GetNotificationsSuccessState extends NotificationsStates{
  final NotificationsModel notificationsModel;

  GetNotificationsSuccessState(this.notificationsModel);

}





