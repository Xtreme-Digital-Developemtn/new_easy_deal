import 'package:easy_deal/features/change_password/presentation/views/widgets/change_password_button.dart';
import 'package:easy_deal/features/change_password/presentation/views/widgets/change_password_form.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.changePassword.tr()),
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: SvgPicture.asset(SvgImages.arrow)),
      ),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r) ,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const ChangePasswordForm(),
              Gap(20.h),
              ChangePasswordButton(formKey: formKey,),
            ],
          ),
        ),
      ),
    );
  }
}
