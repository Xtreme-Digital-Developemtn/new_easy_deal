import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../main_imports.dart';
import '../../data/models/login_model.dart';
import '../../data/repos/login_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(LoginInitState());

  // Dependencies
  final LoginRepo? loginRepo;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // Controllers
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController phoneCon = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Models & Data
  LoginModel? loginModel;

  // State variables
  bool isPasswordVisible = true;
  bool _rememberMe = false;
  String phoneNumber = '';

  // Value notifiers
  final ValueNotifier<bool> isFormValid = ValueNotifier(false);

  // Getters
  bool get rememberMe => _rememberMe;

  // ==================== FORM VALIDATION ====================
  void validateForm() {
    final bool valid = formKey.currentState?.validate() ?? false;
    isFormValid.value = valid;
  }

  // ==================== UI STATE MANAGEMENT ====================
  void changePasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibleState());
  }

  void changeRememberMeValue(bool newValue) {
    _rememberMe = newValue;
    emit(ChangeRememberValueState(newValue));
  }

  // ==================== LOGIN OPERATIONS ====================
  Future<void> login({
    required String password,
    required String phone,
  }) async {
    emit(LoginLoadingState());

    final result = await loginRepo!.login(data: {
      "password": password,
      "phone": phone,
    });

    return result.fold(
          (failure) {
        emit(LoginErrorState(failure.errMessage));
      },
          (data) async {
        loginModel = data;
        await cacheTokenAndIDAndVerified(token: data.data!.authToken.toString());
        emit(LoginSuccessState(data));
        clearControllers();
      },
    );
  }

  // ==================== CACHE MANAGEMENT ====================
  Future<void> cacheTokenAndIDAndVerified({
    required String token,
  }) async {
    await CacheTokenManger.saveUserToken(token);
  }

  // ==================== CLEANUP ====================
  void clearControllers() {
    passwordCon.clear();
    phoneCon.clear();
    emailCon.clear();
    emit(LoginInitState());
  }

  @override
  Future<void> close() {
    // Dispose controllers
    passwordCon.dispose();
    emailCon.dispose();
    phoneCon.dispose();

    // Dispose value notifiers
    isFormValid.dispose();

    return super.close();
  }
}