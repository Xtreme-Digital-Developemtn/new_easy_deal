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
  void selectType(typeIndex){
    selectTypeIndex = typeIndex;
    emit(SelectTypeState());
  }

  int selectGenderIndex = 0;
  void selectGender(genderIndex){
    selectGenderIndex = genderIndex;
    emit(SelectGenderState());
  }


  String phoneNumber = '';
  var nameCon = TextEditingController();


  void updatePhone(String number) {
    phoneNumber = number;
    emit(ValidateNameAndNumberState());
  }

  void updateName(String name) {
    nameCon.text = name;
    emit(ValidateNameAndNumberState());
  }

  bool get isDataValid => phoneNumber.isNotEmpty && nameCon.text.isNotEmpty;
  final formKey = GlobalKey<FormState>();
  bool isButtonEnabled = true;

  void disableButton() {
    isButtonEnabled = false;
    emit(ButtonStateChanged());
  }

}
