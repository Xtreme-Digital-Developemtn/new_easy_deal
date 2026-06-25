import 'package:easy_deal/features/layout/data/models/send_fcm_model.dart';

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
