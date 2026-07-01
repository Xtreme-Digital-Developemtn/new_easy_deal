import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import '../../../view_model/register_cubit.dart';

class CreatePasswordForm extends StatefulWidget {
  const CreatePasswordForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<CreatePasswordForm> createState() => _CreatePasswordFormState();
}

class _CreatePasswordFormState extends State<CreatePasswordForm> {
  late TextEditingController _passwordController;
  bool isPasswordValid = false;
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();

  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
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
          // validator: (v) =>
          //     AppValidators.passwordValidator(registerCubit.passwordCon.text),
          onChanged: (_) {
            registerCubit.onPasswordInteraction(widget.formKey);
          },
        ),

        Gap(6.h),
        FlutterPwValidator(
          controller: registerCubit.passwordCon,
          minLength: 8,
          uppercaseCharCount: 1,
          lowercaseCharCount: 1,
          numericCharCount: 1,
          specialCharCount: 1,
          width: 250.w,
          height: 140.h,
          onSuccess: () {
            setState(() {
              isPasswordValid = true;
            });
          },
          onFail: () {
            setState(() {
              isPasswordValid = false;
            });
          },
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
          hintText: LangKeys.confirmPassword.tr(),
          obscureText: !registerCubit.isConfirmPasswordVisible,
          validator: (v) =>
              AppValidators.repeatPasswordValidator(
                value: v,
                password: registerCubit.passwordCon.text,
              ),
          onChanged: (_) {
            registerCubit.onPasswordInteraction(widget.formKey);
          },
        ),
      ],
    );
  }
}


