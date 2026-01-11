import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/utils/toast/toast.dart';
import '../../../../../../main_imports.dart';

class EditPasswordButton extends StatelessWidget {
  const EditPasswordButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit,EditProfileStates>(
      // buildWhen: (previous, current){
      //   return current is ChangePasswordSuccessState || current is ChangePasswordErrorState|| current is ChangePasswordLoadingState;
      // },
      listener: (context,state){
        if(state is EditProfileDataSuccessState){
          Toast.showSuccessToast(
              msg: state.updateProfileDataModel.message.toString(),
              context: context);
          context.pop();
        }
        if(state is EditProfileDataErrorState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              backgroundColor: AppColors.errorDark,
            ),
          );
        }
      },
      builder:  (context,state){
        var editProfileCubit = context.read<EditProfileCubit>();
        return ConditionalBuilder(
          condition: state is ! EditProfileDataLoadingState,
          fallback: (context){
            return CustomLoading();
          },
          builder: (context){
            return CustomButton(
              text: LangKeys.changePassword.tr(),
              onPressed: (){
                if (formKey.currentState!.validate()){
                  editProfileCubit.updateProfileData();
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
      },

    );
  }
}