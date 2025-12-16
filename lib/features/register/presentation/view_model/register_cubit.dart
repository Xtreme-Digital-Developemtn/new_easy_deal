import 'dart:io';

import 'package:easy_deal/features/register/data/models/register_model.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../main_imports.dart';
import '../../data/repos/register_repo.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.registerRepo) : super(RegisterInitState());

  RegisterRepo? registerRepo;

  static RegisterCubit get(context) => BlocProvider.of(context);

  int activeStep = 0;

  changeStepperIndex(int index) {
    activeStep = index;

    if (index == 3 || index == 4) {
      if(hasPasswordInteracted!=true){
        initPasswordStep();
      }

    }

    emit(ChangeStepperIndexState(activeStep));
  }


  void initPasswordStep() {
    hasPasswordInteracted = false;
    isFormValid.value = false;
  }

  List<String> stepsNames = [
    LangKeys.type.tr(),
      LangKeys.gender.tr() ,
    LangKeys.complete.tr(),
    LangKeys.password.tr(),
  ];


  int selectTypeIndex = 0;
  String? role;

  void selectType(typeIndex) {
    selectTypeIndex = typeIndex;
    role = selectTypeIndex == 1 ? "client": "broker";
    CacheHelper.saveData(
      key: "userRole",
      value: selectTypeIndex == 1 ? "client" : "broker",
    );
    emit(SelectTypeState());
  }

  int selectGenderIndex = 0;

  String? gender;
  void selectGender(genderIndex) {
    selectGenderIndex = genderIndex;
    gender = selectGenderIndex == 1 ? "male": "female";
    emit(SelectGenderState());
  }

  int selectBrokerIndex = 0;

  void selectBroker(genderIndex) {
    selectBrokerIndex = genderIndex;
    emit(SelectBrokerState());
  }

  int selectServiceIndex = 0;

  void selectService(serviceIndex) {
    selectServiceIndex = serviceIndex;
    emit(SelectServiceState());
  }

  String phoneNumber = '';
  var nameCon = TextEditingController();
  var phoneCon = TextEditingController();
  var emailCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var passwordCon = TextEditingController();
  var confirmPasswordCon = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  changePasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibleState());
  }

  changeConfirmPasswordVisible() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangeConfirmPasswordVisibleState());
  }

  final ValueNotifier<bool> isFormValid = ValueNotifier(false);
  //
  // void validateForm() {
  //   final valid = formKey.currentState?.validate() ?? false;
  //   isFormValid.value = valid;
  // }
  bool hasUserInteracted = false;
  void validateForm() {
    if (!hasUserInteracted) return;

    final isValid = formKey.currentState?.validate() ?? false;
    isFormValid.value = isValid;
  }

  void onUserInteraction() {
    hasUserInteracted = true;
    validateForm();
  }

  bool hasPasswordInteracted = false;
  void onPasswordInteraction() {
    hasPasswordInteracted = true;
    validateForm();
  }



  RegisterModel? registerModel;
  Future<void> register({
    required String fullName,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required String gender,
    required String email,
    required File? image,
  }) async {
    emit(SignUpLoading());
    FormData formData = FormData.fromMap({
      "fullName": fullName,
      "phone": "0$phone",
      "role": "client",
      "password": password,
      "password_confirmation": passwordConfirmation,
      "email": email!="" ? email : "",
      "gender": gender,
      "image": image != null
          ? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last)
          : null,

    });
    final result = await registerRepo!.register(data: formData);
    return result.fold((failure) {
      emit(SignUpError(failure.errMessage));
    }, (data) async {
      registerModel = data;
      emit(SignUpSuccess(data));
      await cacheUserInfo(
        token: "${data.data!.authToken}",
        phone: data.data!.phone.toString(),
        id:  data.data!.id!,
        email: "${data.data!.email}",
      );
      clearControllers();
    });
  }

  clearControllers(){
    nameCon.clear();
    emailCon.clear();
    passwordCon.clear();
    confirmPasswordCon.clear();
    phoneNumber='';
    phoneCon.clear();
    emit(RegisterInitState());
  }

  cacheUserInfo({required String token ,
    required String phone ,
    required int id ,
    required String email,
  })
  async {
    await CacheTokenManger.saveUserToken(token);
    CacheHelper.saveData(key: "userPhone", value: phone);
    CacheHelper.saveData(key: "userId", value: id);
    CacheHelper.saveData(key: "userEmail", value: email);
    CacheHelper.saveData(key: "userRole", value: "client");
  }
}
