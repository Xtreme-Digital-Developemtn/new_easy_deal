import 'package:easy_deal/features/settings/presentation/views/widgets/app_settings_view_body.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.appSettings.tr()),
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: SvgPicture.asset(SvgImages.arrow)),
      ),
      body: AppSettingsViewBody(),
    );
  }
}
