  import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class ReportIssueButton extends StatelessWidget {
  const ReportIssueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      gradientColors: false,
      onPressed: (){},
      text: LangKeys.send.tr(),
    );
  }
}
