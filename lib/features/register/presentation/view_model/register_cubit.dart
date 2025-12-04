import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../main_imports.dart';
import '../../data/repos/register_repo.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.contactUsRepo) : super(RegisterInitState());

  RegisterRepo? contactUsRepo;

  static RegisterCubit get(context) => BlocProvider.of(context);

  int activeStep = 0;

  changeStepperIndex(int index) {
    activeStep = index;
    emit(ChangeStepperIndexState(activeStep));
  }

  List<String> stepsNames = [
    LangKeys.type.tr(),
    LangKeys.gender.tr(),
    LangKeys.complete.tr(),
    LangKeys.password.tr(),
  ];

  int selectTypeIndex = 0;
  void selectType(typeIndex) {
    selectTypeIndex = typeIndex;
    emit(SelectTypeState());
  }

  int selectGenderIndex = 0;
  void selectGender(genderIndex) {
    selectGenderIndex = genderIndex;
    emit(SelectGenderState());
  }

  String phoneNumber = '';
  var nameCon = TextEditingController();


  bool _isPhoneValid = false;
  bool _isNameValid = false;

  void updatePhone(String number) {
    phoneNumber = number;


    final phoneValidation = AppValidators.phoneValidator(number);
    _isPhoneValid = phoneValidation == null;

    emit(ValidateNameAndNumberState());


    _updateButtonState();
  }

  void updateName(String name) {
    nameCon.text = name;


    final nameValidation = AppValidators.displayNameValidator(name);
    _isNameValid = nameValidation == null;

    emit(ValidateNameAndNumberState());

    _updateButtonState();
  }

  // دالة خاصة لتحديث حالة الزر تلقائياً
  void _updateButtonState() {
    // الزر يكون مفعلاً فقط عندما يكون الهاتف والاسم صالحين معاً
    final shouldBeEnabled = _isPhoneValid && _isNameValid;

    // تحديث فقط إذا تغيرت القيمة
    if (isButtonEnabled != shouldBeEnabled) {
      isButtonEnabled = shouldBeEnabled;
      emit(ButtonStateChanged());
    }
  }

  // دالة لفحص صلاحية جميع الحقول معاً
  bool get areAllFieldsValid => _isPhoneValid && _isNameValid;

  // دالة للتحقق من الصلاحية النهائية (يمكن استخدامها في الـ Form)
  bool validateAllFields() {
    final phoneValid = AppValidators.phoneValidator(phoneNumber) == null;
    final nameValid = AppValidators.displayNameValidator(nameCon.text) == null;

    return phoneValid && nameValid;
  }

  final formKey = GlobalKey<FormState>();

  // قيمة الزر تبدأ بـ false (معطل) حتى يتم تعبئة الحقول الصحيحة
  bool isButtonEnabled = false;

  // إزالة دالة disableButton لأنها أصبحت تلقائية
  // يمكنك إضافة دالة لتفعيل الزر يدوياً إذا احتجت
  void resetButton() {
    isButtonEnabled = false;
    emit(ButtonStateChanged());
  }

  var passwordCon = TextEditingController();
  var confirmPasswordCon = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  changePasswordVisible()
  {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibleState());
  }

  changeConfirmPasswordVisible()
  {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangeConfirmPasswordVisibleState());
  }
}