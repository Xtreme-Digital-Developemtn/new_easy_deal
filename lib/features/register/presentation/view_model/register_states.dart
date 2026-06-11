import '../../data/models/register_model.dart';
import '../../data/models/send_otp_model.dart';
import '../../data/models/verify_otp_model.dart';

abstract class RegisterStates{}

class RegisterInitState extends RegisterStates{}

class ChangeStepperIndexState extends RegisterStates{
  final int index;
  ChangeStepperIndexState(this.index);

}

class SelectTypeState extends RegisterStates{}
class SelectGenderState extends RegisterStates{}

class ValidateNameAndNumberState extends RegisterStates{}
class ButtonStateChanged extends RegisterStates{}

class ChangePasswordVisibleState extends RegisterStates{}
class ChangeConfirmPasswordVisibleState extends RegisterStates{}

class PasswordCheckedState extends RegisterStates{}
class ChangePasswordTypingState extends RegisterStates{}

class SelectBrokerState extends RegisterStates{}

class SelectServiceState extends RegisterStates{}

class SignUpLoading  extends RegisterStates{}
class SignUpSuccess  extends RegisterStates{
  final RegisterModel registerModel;
  SignUpSuccess(this.registerModel);
}
class SignUpError  extends RegisterStates{
  final String message;
  SignUpError(this.message);
}


class VerifyOtpLoadingState extends RegisterStates{}
class VerifyOtpSuccessState extends RegisterStates{
  VerifyOtpModel verifyOtpModel;
  VerifyOtpSuccessState(this.verifyOtpModel);
}
class VerifyOtpErrorState extends RegisterStates{
  final String error;
  VerifyOtpErrorState(this.error);
}

class SendOtpLoadingState extends RegisterStates{}
class SendOtpSuccessState extends RegisterStates{
  SendOtpModel sendOtpModel;
  SendOtpSuccessState(this.sendOtpModel);
}
class SendOtpErrorState extends RegisterStates{
  final String error;
  SendOtpErrorState(this.error);
}