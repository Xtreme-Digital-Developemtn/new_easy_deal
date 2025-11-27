import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../main_imports.dart';
import '../../data/models/login_model.dart';
import '../../data/repos/login_repo.dart';
import 'login_states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(LoginInitState());



  var passwordCon = TextEditingController();
  var emailCon = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  LoginRepo? loginRepo;
  LoginModel? loginModel;
  bool isPasswordVisible = true;

  changePasswordVisible()
  {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibleState());
  }

  Future<void> login({
    required String password,
    required String phone,
  })
  async {
    emit(LoginLoadingState());
    var result = await loginRepo!.login(data: {
      "password" : password,
      "phone":phone,
    });
    return result.fold((failure) {
      emit(LoginErrorState(failure.errMessage));
    }, (data) async {
      loginModel = data;
      emit(LoginSuccessState(data));
      clearControllers();
    });
  }


  clearControllers() async {

    passwordCon.clear();
    emit(LoginInitState());
  }

  cacheTokenAndIDAndVerified({
    required String token,
  }) async {
    await CacheTokenManger.saveUserToken(token);

  }
  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  void changeRememberMeValue(bool newValue) {
    _rememberMe = newValue;
    emit(ChangeRememberValueState(newValue));
  }

  String phoneNumber = '';


  void validateFields() {
    bool valid = phoneNumber.isNotEmpty && passwordCon.text.isNotEmpty;
    emit(LoginValidationState(valid));
  }


  @override
  Future<void> close() {
    passwordCon.dispose();
    return super.close();
  }


}