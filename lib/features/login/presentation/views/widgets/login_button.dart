import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/shared_widgets/custom_button.dart';
import 'package:easy_deal/core/shared_widgets/custom_loading.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/utils/toast/toast.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      buildWhen: (previous, current) {
        return current is LoginSuccessState ||
            current is LoginLoadingState ||
            current is LoginErrorState || current is LoginValidationState;
      },
      listener: (context, state) {
        if (state is LoginErrorState) {
          Toast.showErrorToast(msg: state.error.toString(), context: context);
        } else if (state is LoginSuccessState) {
          Toast.showSuccessToast(
            msg: state.loginModel.message.toString(),
            context: context,
          );
          if (context.read<LoginCubit>().rememberMe == true) {
            context.read<LoginCubit>().cacheTokenAndIDAndVerified(
              token: state.loginModel.data!.authToken.toString(),
            );
          }
        }
      },
      builder: (context, state) {
        var loginCubit = context.watch<LoginCubit>();
        bool isValid = false;

        if (state is LoginValidationState) {
          isValid = state.isValid;
        }
        return ConditionalBuilder(
          condition: state is! LoginLoadingState,
          fallback: (context) => CustomLoading(),
          builder: (context) {
            return CustomButton(
              text: LangKeys.signIn.tr(),
              onPressed: isValid ? () {
                if (formKey.currentState!.validate()) {
                  loginCubit.login(
                    password: loginCubit.passwordCon.text,
                    phone: loginCubit.phoneNumber,
                  );
                }
              } : null,
              color: isValid ? null : AppColors.primaryDark.withValues(alpha: 0.3),
              textColor: isValid ? null : AppColors.white,
            );
          },
        );
      },
    );
  }
}