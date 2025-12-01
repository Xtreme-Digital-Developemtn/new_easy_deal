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