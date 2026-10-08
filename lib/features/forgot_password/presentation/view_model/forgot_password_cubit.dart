import '../../../../main_imports.dart';
import '../../data/repos/forgot_password_repo.dart';
import 'forgot_password_states.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  ForgotPasswordCubit(this.repo) : super(ForgotPasswordInitState());

  final ForgotPasswordRepo? repo;

  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController otpCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController confirmPasswordCon = TextEditingController();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isFormValid = ValueNotifier(false);

  String phoneNumber = '';
  bool isPasswordVisible = true;
  bool _isLoading = false;

  /// 0 = phone, 1 = otp, 2 = new password
  int step = 0;

  void validateForm() {
    if (step == 0) {
      isFormValid.value = phoneFormKey.currentState?.validate() ?? false;
    } else if (step == 1) {
      isFormValid.value = otpCon.text.trim().length == 6;
    } else {
      isFormValid.value = passwordFormKey.currentState?.validate() ?? false;
    }
  }

  void onOtpChanged() => validateForm();

  void changePasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    emit(ForgotPasswordChangePasswordVisibleState());
  }

  void editPhone() {
    step = 0;
    emit(ForgotPasswordStepChangedState(step));
    Future.microtask(() => validateForm());
  }

  Future<void> sendOtp() async {
    if (_isLoading) return;
    if (!(phoneFormKey.currentState?.validate() ?? false)) return;
    _isLoading = true;
    emit(ForgotPasswordLoadingState());
    final result = await repo!.sendOtp(phone: phoneCon.text.trim());
    _isLoading = false;
    result.fold(
      (failure) => emit(ForgotPasswordErrorState(failure.errMessage)),
      (message) {
        step = 1;
        otpCon.clear();
        emit(ForgotPasswordSendOtpSuccessState(message));
        emit(ForgotPasswordStepChangedState(step));
        Future.microtask(() => validateForm());
      },
    );
  }

  Future<void> verifyOtp() async {
    if (_isLoading) return;
    if (otpCon.text.trim().length != 6) return;
    _isLoading = true;
    emit(ForgotPasswordLoadingState());
    final result = await repo!.verifyOtp(
      phone: phoneCon.text.trim(),
      otp: otpCon.text.trim(),
    );
    _isLoading = false;
    result.fold(
      (failure) => emit(ForgotPasswordErrorState(failure.errMessage)),
      (message) {
        step = 2;
        emit(ForgotPasswordVerifyOtpSuccessState(message));
        emit(ForgotPasswordStepChangedState(step));
        Future.microtask(() => validateForm());
      },
    );
  }

  Future<void> resetPassword() async {
    if (_isLoading) return;
    if (!(passwordFormKey.currentState?.validate() ?? false)) return;
    _isLoading = true;
    emit(ForgotPasswordLoadingState());
    final result = await repo!.resetPassword(
      phone: phoneCon.text.trim(),
      password: passwordCon.text,
      passwordConfirmation: confirmPasswordCon.text,
    );
    _isLoading = false;
    result.fold(
      (failure) => emit(ForgotPasswordErrorState(failure.errMessage)),
      (message) => emit(ForgotPasswordSuccessState(message)),
    );
  }

  @override
  Future<void> close() {
    phoneCon.dispose();
    otpCon.dispose();
    passwordCon.dispose();
    confirmPasswordCon.dispose();
    isFormValid.dispose();
    return super.close();
  }
}
