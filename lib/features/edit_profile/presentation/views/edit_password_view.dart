 import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_password_widgets/edit_password_button.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/edit_password_widgets/edit_password_form.dart';
import 'package:easy_deal/main_imports.dart';

class EditPasswordView extends StatelessWidget {
  const EditPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.changePassword),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r) ,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const EditPasswordForm(),
              Gap(20.h),
              EditPasswordButton(formKey: formKey,),
            ],
          ),
        ),
      ),
    );
  }
}
