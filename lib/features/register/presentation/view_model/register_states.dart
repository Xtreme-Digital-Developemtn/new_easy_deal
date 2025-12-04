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