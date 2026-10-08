abstract class ForgotPasswordStates {}

class ForgotPasswordInitState extends ForgotPasswordStates {}

class ForgotPasswordLoadingState extends ForgotPasswordStates {}

class ForgotPasswordSendOtpSuccessState extends ForgotPasswordStates {
  final String message;
  ForgotPasswordSendOtpSuccessState(this.message);
}

class ForgotPasswordVerifyOtpSuccessState extends ForgotPasswordStates {
  final String message;
  ForgotPasswordVerifyOtpSuccessState(this.message);
}

class ForgotPasswordSuccessState extends ForgotPasswordStates {
  final String message;
  ForgotPasswordSuccessState(this.message);
}

class ForgotPasswordErrorState extends ForgotPasswordStates {
  final String error;
  ForgotPasswordErrorState(this.error);
}

class ForgotPasswordChangePasswordVisibleState extends ForgotPasswordStates {}

class ForgotPasswordStepChangedState extends ForgotPasswordStates {
  final int step;
  ForgotPasswordStepChangedState(this.step);
}
