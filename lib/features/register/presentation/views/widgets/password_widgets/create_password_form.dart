import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class CreatePasswordForm extends StatelessWidget {
  const CreatePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: registerCubit.passwordCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.password.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock),
              ),
              validator: (value) => AppValidators.passwordValidator(registerCubit.passwordCon.text),
              suffixIcon: IconButton(
                icon: registerCubit.isPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: registerCubit.changePasswordVisible,
              ),
              obscureText: !registerCubit.isPasswordVisible,
              onChanged: (_) => registerCubit.validateForm(),
            ),
            Gap(20.h),
            CustomTextFormField(
              controller: registerCubit.confirmPasswordCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.newPassword.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock),
              ),
              validator: (value) =>
                  AppValidators.repeatPasswordValidator(
                    value: value,
                    password: registerCubit.passwordCon.text,
                  ),
              suffixIcon: IconButton(
                icon: registerCubit.isConfirmPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: registerCubit.changeConfirmPasswordVisible,
              ),
              obscureText: !registerCubit.isConfirmPasswordVisible, // Fixed
              onChanged: (_) => registerCubit.validateForm(),
            ),

          ],
        );
      },
    );
  }
}

