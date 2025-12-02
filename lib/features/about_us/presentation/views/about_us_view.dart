import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_view_body.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.aboutUs.tr()),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(PngImages.share)),
        ],
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(SvgImages.arrow),
        ),
      ),
      body: AboutUsViewBody(),
    );
  }
}
