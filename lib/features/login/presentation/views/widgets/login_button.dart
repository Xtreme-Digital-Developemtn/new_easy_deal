import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../core/shared_cubits/session/app_session.dart';

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
          final userId = state.loginModel.data?.id;
          if (userId != null) {
            CacheHelper.saveData(key: "clientId", value: userId);
          }
          // بدل ما ننقل على اللاي أوت بالكيوبتس القديمة في الذاكرة، بنعيد
          // بناء التطبيق كله بهوية الأكونت الجديد (زي فتح التطبيق من الأول).
          // التوست بيظهر على الشاشة الجديدة بعد إعادة البناء. الرسالة من
          // الترجمة مش من السيرفر، لأن السيرفر بيرجّع مفتاح زي
          // users.success.login مش جملة.
          AppSession.signedInWithMessage(LangKeys.loginSuccessMsg.tr());
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
                        // كان فيه هنا رقم وباسوورد وسيط مكتوبين بالثابت
                        // بيستبدلوا أي حاجة المستخدم يكتبها، يعني أي محاولة
                        // دخول كانت بتروح لنفس الأكونت.
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
//01007006336
// MY1720my

//01262587412
// Admin1234