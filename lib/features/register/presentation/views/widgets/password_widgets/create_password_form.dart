import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../view_model/register_cubit.dart';

class CreatePasswordForm extends StatelessWidget {
  const CreatePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Password
        CustomTextFormField(
          suffixIcon: IconButton(
            icon: registerCubit.isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: registerCubit.changePasswordVisible,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(SvgImages.lock),
          ),
          controller: registerCubit.passwordCon,
          hintText: LangKeys.password.tr(),
          obscureText: !registerCubit.isPasswordVisible,
          validator: (v) =>
              AppValidators.passwordValidator(registerCubit.passwordCon.text),
          onChanged: (_) => registerCubit.onPasswordInteraction(),
        ),

        Gap(20.h),

        /// Confirm Password
        CustomTextFormField(
          suffixIcon: IconButton(
            icon: registerCubit.isConfirmPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: registerCubit.changeConfirmPasswordVisible,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(SvgImages.lock),
          ),
          controller: registerCubit.confirmPasswordCon,
          hintText: LangKeys.newPassword.tr(),
          obscureText: !registerCubit.isConfirmPasswordVisible,
          validator: (v) =>
              AppValidators.repeatPasswordValidator(
                value: v,
                password: registerCubit.passwordCon.text,
              ),
          onChanged: (_) => registerCubit.onPasswordInteraction(),
        ),
      ],
    );
  }
}


