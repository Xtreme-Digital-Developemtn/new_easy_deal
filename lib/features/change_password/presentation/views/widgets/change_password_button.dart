import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../view_model/change_password_cubit.dart';
import '../../view_model/change_password_states.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit,ChangePasswordStates>(
      // buildWhen: (previous, current){
      //   return current is ChangePasswordSuccessState || current is ChangePasswordErrorState|| current is ChangePasswordLoadingState;
      // },
      listener: (context,state){
        // if(state is ChangePasswordSuccessState){
        //   NewToast.showNewSuccessToast(
        //       msg: state.changePasswordModel.message.toString(),
        //       context: context);
        //   AppNav.customNavigator(context: context,
        //     screen: const LoginView(),
        //     finish: true,
        //   );
        //   SecureStorageService.instance.deleteData(key: "userToken");
        //   LayoutCubit.pageIndex=2;
        // }
        // if(state is ChangePasswordErrorState){
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text(state.error.toString()),
        //       backgroundColor: AppColors.redColor,
        //     ),
        //   );
        // }
      },
      builder:  (context,state){
        return CustomButton(
          text: LangKeys.changePassword.tr(),
          onPressed: (){
            if (formKey.currentState!.validate()){
              // context.read<ChangePasswordCubit>().changePassword(
              //   oldPassword: context.read<ChangePasswordCubit>().oldPasswordCon.text,
              //   newPassword: context.read<ChangePasswordCubit>().newPasswordCon.text,
              //   newPasswordConfirmation: context.read<ChangePasswordCubit>().confirmNewPasswordCon.text,
              // );

            }
          },
        );
      },

    );
  }
}