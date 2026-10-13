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
          // التوكن نفسه اتحفظ (أو لأ) حسب تذكرني جوه LoginCubit.login.
          // هنا بنحفظ id المستخدم الحقيقي فقط بدل ما كان بيتخزن التوكن مكان الـ id.
          final userId = state.loginModel.data?.id;
          if (userId != null) {
            CacheHelper.saveData(key: "clientId", value: userId);
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
                  /// broker
                  //   loginCubit.phoneCon.text = "1007006336";
                  //   loginCubit.passwordCon.text = "MY1720my";
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
