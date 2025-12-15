import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class CreatePasswordForm extends StatelessWidget {
  const CreatePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Password
        CustomTextFormField(
          controller: cubit.passwordCon,
          hintText: LangKeys.password.tr(),
          obscureText: !cubit.isPasswordVisible,
          validator: (v) =>
              AppValidators.passwordValidator(cubit.passwordCon.text),
          onChanged: (_) => cubit.onPasswordInteraction(),
        ),

        Gap(20.h),

        /// Confirm Password
        CustomTextFormField(
          controller: cubit.confirmPasswordCon,
          hintText: LangKeys.newPassword.tr(),
          obscureText: !cubit.isConfirmPasswordVisible,
          validator: (v) =>
              AppValidators.repeatPasswordValidator(
                value: v,
                password: cubit.passwordCon.text,
              ),
          onChanged: (_) => cubit.onPasswordInteraction(),
        ),
      ],
    );
  }
}


