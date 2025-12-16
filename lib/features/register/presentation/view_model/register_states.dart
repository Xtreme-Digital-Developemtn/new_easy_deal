import '../../data/models/register_model.dart';

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