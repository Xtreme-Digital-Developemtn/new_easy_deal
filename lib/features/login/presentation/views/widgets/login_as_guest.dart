import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

class LoginAsGuest extends StatelessWidget {
  const LoginAsGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () {
         context.pushNamed(Routes.layoutView);
      },
      child: Text(
        textAlign: TextAlign.center,
        LangKeys.continueAsAGuest.tr(),
        style: AppStyles.primary16SemiBold,
      ),
    );
  }
}
