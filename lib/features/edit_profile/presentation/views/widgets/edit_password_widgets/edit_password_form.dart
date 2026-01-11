import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/edit_profile_cubit.dart';

class EditPasswordForm extends StatelessWidget {
  const EditPasswordForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit,EditProfileStates>(
      // buildWhen: (previous, current){
      //   return current is ChangeConfirmNewPasswordVisibleState || current is ChangeNewPasswordVisibleState || current is ChangeOldPasswordVisibleState;
      // },
      builder: (context,state){
        var editProfileCubit = context.read<EditProfileCubit>();
        return Column(
          children: [
            CustomTextFormField(
              controller:  editProfileCubit.newPasswordCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.newPassword.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,),
              ),
              validator: (String? value) {
                return AppValidators.passwordValidator(value);
              },
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: editProfileCubit.isNewPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  editProfileCubit.editNewPasswordVisible();
                },
              ),

              obscureText: editProfileCubit.isNewPasswordVisible,
            ),
            Gap(20.h),
            CustomTextFormField(
              controller:  editProfileCubit.confirmNewPasswordCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.newPassword.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,),
              ),
              validator: (String? value) {
                return AppValidators.repeatPasswordValidator(
                  value: value,
                  password: editProfileCubit.newPasswordCon.text,
                );
              },
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: editProfileCubit.isConfirmNewPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  editProfileCubit.changeConfirmNewPasswordVisible();
                },
              ),

              obscureText: editProfileCubit.isConfirmNewPasswordVisible,
            ),
            Gap(20.h),
          ],
        );
      },

    );
  }
}