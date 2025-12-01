
import '../../../../main_imports.dart';
import '../../data/repos/change_password_repo.dart';
import 'change_password_states.dart';


class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  ChangePasswordRepo? changePasswordRepo;


  var oldPasswordCon = TextEditingController();
  var newPasswordCon = TextEditingController();
  var confirmNewPasswordCon = TextEditingController();


  // ChangePasswordModel? changePasswordModel;
  // Future<void> changePassword({required String oldPassword ,required String newPassword , required String newPasswordConfirmation })
  // async {
  //   emit(ChangePasswordLoadingState());
  //   var result = await changePasswordRepo!.changePassword(oldPassword: oldPassword, newPassword: newPassword, newPasswordConfirmation: newPasswordConfirmation);
  //   return result.fold((failure) {
  //     emit(ChangePasswordErrorState(failure.errMessage));
  //   }, (data) async {
  //     changePasswordModel = data;
  //     emit(ChangePasswordSuccessState(data));
  //   });
  // }


  bool isOldPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmNewPasswordVisible = true;

  changeOldPasswordVisible()
  {
    isOldPasswordVisible = !isOldPasswordVisible;
    emit(ChangeOldPasswordVisibleState());
  }

  changeNewPasswordVisible()
  {
    isNewPasswordVisible = !isNewPasswordVisible;
    emit(ChangeNewPasswordVisibleState());
  }

  changeConfirmNewPasswordVisible()
  {
    isConfirmNewPasswordVisible = !isConfirmNewPasswordVisible;
    emit(ChangeConfirmNewPasswordVisibleState());
  }

}