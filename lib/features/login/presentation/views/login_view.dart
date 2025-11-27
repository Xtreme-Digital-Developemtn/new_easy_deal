import 'package:easy_deal/features/login/presentation/views/widgets/do_not_have_account.dart';
import 'package:easy_deal/features/login/presentation/views/widgets/login_as_guest.dart';
import 'package:easy_deal/features/login/presentation/views/widgets/login_button.dart';
import 'package:easy_deal/features/login/presentation/views/widgets/login_phone_and_password_form.dart';
import 'package:easy_deal/features/login/presentation/views/widgets/logo.dart';
import 'package:easy_deal/features/login/presentation/views/widgets/remember_me_and_forget_password.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../main_imports.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final loginKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LangKeys.signIn.tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.all(20.r),
          child: Form(
            key: loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(60.h),
                Logo(),
                Gap(60.h),
                LoginPhoneAndPasswordForm(),
                Gap(12.h),
                RememberMeAndForgetPassword(),
                Gap(12.h),
                LoginButton(formKey: loginKey,),
                Gap(24.h),
                LoginAsGuest(),
                DoNotHaveAccount(),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
