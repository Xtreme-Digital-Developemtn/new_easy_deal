import 'package:easy_deal/features/settings/presentation/views/widgets/app_settings_view_body.dart';
import 'package:easy_deal/main_imports.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.appSettings),
      body: AppSettingsViewBody(),
    );
  }
}
