  import 'package:easy_deal/features/register/presentation/views/widgets/password_widgets/create_password_form.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import 'create_password_buttons.dart';

class PasswordBody extends StatelessWidget {
  const PasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.password.tr(),style: AppStyles.black16SemiBold,),
        Gap(12.h),
        CreatePasswordForm(),
        Gap(MediaQuery.of(context).size.height*0.35),
        CreatePasswordButtons(),
      ],
    );
  }
}
