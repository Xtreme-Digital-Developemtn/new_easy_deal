import '../../data/models/send_otp_model.dart';

abstract class OtpStates{}

class OtpInitState extends OtpStates{}


class VerifyOtpLoadingState extends OtpStates{}
class VerifyOtpSuccessState extends OtpStates{
  // VerifyOtpModel verifyOtpModel;
  // VerifyOtpSuccessState(this.verifyOtpModel);
}
class VerifyOtpErrorState extends OtpStates{
  final String error;
  VerifyOtpErrorState(this.error);
}

class SendOtpLoadingState extends OtpStates{}
class SendOtpSuccessState extends OtpStates{
  SendOtpModel sendOtpModel;
  SendOtpSuccessState(this.sendOtpModel);
}
class SendOtpErrorState extends OtpStates{
  final String error;
  SendOtpErrorState(this.error);
}