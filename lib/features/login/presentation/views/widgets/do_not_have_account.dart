import 'package:easy_deal/core/themes/app_styles.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LangKeys.doNotHaveAnAccount.tr(),
          style: AppStyles.black16Medium,
        ),
        TextButton(
          onPressed: () {
           // context.pushNamed(Routes.registerScreen);
          },
          child: Text(
            textAlign: TextAlign.center,
            LangKeys.signUp.tr(),
            style: AppStyles.primary16SemiBold,
          ),
        ),
      ],
    );
  }
}
