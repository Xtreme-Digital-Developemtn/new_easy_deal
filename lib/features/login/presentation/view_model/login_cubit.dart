import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../main_imports.dart';
import '../../../../core/utils/app_consts/session_cache.dart';
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
    CacheHelper.saveData(key: "rememberMe", value: newValue);
    emit(ChangeRememberValueState(newValue));
  }

  // ==================== LOGIN OPERATIONS ====================
  Future<void> login({
    required String password,
    required String phone,
  })
  async {
    emit(LoginLoadingState());
    FormData formData = FormData.fromMap({
      "password": password,
      "phone": "0$phone",
    });
    final result = await loginRepo!.login(data:formData);
    return result.fold(
          (failure) {
        emit(LoginErrorState(failure.errMessage));
      },
          (data) async {
        loginModel = data;

        // ترتيب مهم: ننضّف هوية الأكونت القديم ونخزّن الجديدة *قبل* الـ emit،
        // لأن اللي بيسمع الـ success بينقل على اللاي أوت اللي بيبني تاباته من
        // الدور المخزّن — الـ emit الأول كان معناه إن أول بناء يقرأ دور
        // الأكونت القديم.
        await SessionCache.clear();
        await CacheHelper.saveData(key: StorageKeys.userId, value: data.data!.id);
        await CacheHelper.saveData(key: SessionCache.userRoleKey, value: data.data!.role);
        await CacheHelper.saveData(key: StorageKeys.brokerId, value: data.data!.brokerId);

        // التوكن لازم يتحدّث قبل أي طلب جديد (كل الطلبات بتقرأ الستاتيك ده).
        if (_rememberMe) {
          await CacheTokenManger.saveUserToken(data.data!.authToken!);
        } else {
          // جلسة فقط: التوكن في الذاكرة ومش متخزن، فقفلة التطبيق تطلب دخول تاني
          CacheTokenManger.userToken = data.data!.authToken!;
        }

        emit(LoginSuccessState(data));
        clearControllers();
      },
    );
  }

  // ==================== CLEANUP ====================
  void clearControllers() {
    passwordCon.clear();
    phoneCon.clear();
    emit(LoginInitState());
  }

  @override
  Future<void> close() {
    // Dispose controllers
    passwordCon.dispose();
    phoneCon.dispose();

    // Dispose value notifiers
    isFormValid.dispose();

    return super.close();
  }
}