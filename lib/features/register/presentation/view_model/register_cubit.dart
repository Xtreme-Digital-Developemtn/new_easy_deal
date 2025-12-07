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
    print("activeStep = $activeStep");
    print("selectTypeIndex = $selectTypeIndex");
    emit(ChangeStepperIndexState(activeStep));
  }

    List<String> stepsNames = [
    LangKeys.type.tr(),
      LangKeys.gender.tr() ,
    LangKeys.complete.tr(),
    LangKeys.password.tr(),
  ];
  List<String> brokerStepsNames = [
    LangKeys.type.tr(),
    LangKeys.service.tr(),
    LangKeys.complete.tr(),
    LangKeys.password.tr(),
  ];

  int selectTypeIndex = 0;

  void selectType(typeIndex) {
    selectTypeIndex = typeIndex;
    print("selectTypeIndex = $selectTypeIndex");
    print("activeStep = $activeStep");
    CacheHelper.saveData(
      key: "role",
      value: selectTypeIndex == 1 ? "client" : "broker",
    );
    emit(SelectTypeState());
  }

  int selectGenderIndex = 0;

  void selectGender(genderIndex) {
    selectGenderIndex = genderIndex;

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

  void validateForm() {
    final valid = formKey.currentState?.validate() ?? false;
    isFormValid.value = valid;
  }
}
