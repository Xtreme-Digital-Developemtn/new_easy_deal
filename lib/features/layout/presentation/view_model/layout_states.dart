import 'package:easy_deal/features/layout/data/models/send_fcm_model.dart';

import '../../data/models/un_read_notifications_count_model.dart';

abstract class LayoutStates {}

class LayoutInitState extends LayoutStates {}

class ChangeBottomNavState extends LayoutStates {}

class SendFcmTokenLoading extends LayoutStates {}
class SendFcmTokenSuccess extends LayoutStates {
  final SendFcmModel sendFcmModel;
  SendFcmTokenSuccess(this.sendFcmModel);

}
class SendFcmTokenError extends LayoutStates {
  final String error;
  SendFcmTokenError(this.error);

}

class GetUnReadNotificationsCountLoadingState extends LayoutStates {}

class GetUnReadNotificationsCountErrorState extends LayoutStates {
  final String error;

  GetUnReadNotificationsCountErrorState(this.error);
}

class GetUnReadNotificationsCountSuccessState extends LayoutStates {
  final UnReadNotificationsCountModel unReadNotificationsCountModel;

  GetUnReadNotificationsCountSuccessState(this.unReadNotificationsCountModel);
}
