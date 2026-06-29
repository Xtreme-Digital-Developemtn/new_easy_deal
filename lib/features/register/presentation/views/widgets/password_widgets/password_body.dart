import 'package:easy_deal/features/register/presentation/views/widgets/password_widgets/create_password_form.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'create_password_buttons.dart';

class PasswordBody extends StatelessWidget {
  PasswordBody({super.key}) : _passwordFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _passwordFormKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _passwordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LangKeys.password.tr(),style: AppStyles.black16SemiBold,),
          Gap(12.h),
          CreatePasswordForm(formKey: _passwordFormKey),
          Gap(24.h),
          CreatePasswordButtons(formKey: _passwordFormKey),
        ],
      ),
    );
  }
}
