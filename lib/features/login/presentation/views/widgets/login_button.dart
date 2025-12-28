import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/utils/toast/toast.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      buildWhen: (previous, current) {
        return current is LoginSuccessState ||
            current is LoginLoadingState ||
            current is LoginErrorState ||
            current is LoginValidationState;
      },
      listener: (context, state) {
        if (state is LoginErrorState) {
          Toast.showErrorToast(msg: state.error.toString(), context: context);
        } else if (state is LoginSuccessState) {
          context.pushNamedAndRemoveUntil(Routes.layoutView);
          Toast.showSuccessToast(
            msg: state.loginModel.message.toString(),
            context: context,
          );
          if (context.read<LoginCubit>().rememberMe == true) {
            context.read<LoginCubit>().cacheTokenAndIDAndVerified(
              token: state.loginModel.data!.authToken.toString(),
              id: state.loginModel.data!.authToken.toString(),
            );
          }else if (context.read<LoginCubit>().rememberMe == false){
            context.read<LoginCubit>().cacheTokenAndIDAndVerified(
              id: state.loginModel.data!.authToken.toString(),
            );
          }
        }
      },
      builder: (context, state) {
        var loginCubit = context.watch<LoginCubit>();
        return ConditionalBuilder(
          condition: state is! LoginLoadingState,
          fallback: (context) => CustomLoading(),
          builder: (context) {
            return ValueListenableBuilder<bool>(
              valueListenable: loginCubit.isFormValid,
              builder: (context, isValid, child) => CustomButton(
                text: LangKeys.signIn.tr(),
                onPressed: isValid
                    ? () {
                        loginCubit.login(
                          password: loginCubit.passwordCon.text,
                          phone: loginCubit.phoneCon.text,
                        );
                      }
                    : null,
              ),
            );
          },
        );
      },
    );
  }
}
