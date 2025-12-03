import 'package:easy_deal/main_imports.dart';

import 'appearance.dart';
import 'language.dart';
import 'notifications_alert.dart';

class AppSettingsViewBody extends StatelessWidget {
  const AppSettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(20.0.r),
      child: Column(
        children: [
           NotificationsAlert(),
          Appearance(),
          Language(),
        ],
      ),
    );
  }
}
