import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_view_body.dart';
import 'package:easy_deal/main_imports.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.aboutUs),
      body: const AboutUsViewBody(),
    );
  }
}
