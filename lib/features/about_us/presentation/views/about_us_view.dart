import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/features/about_us/data/repos/about_us_repo_imple.dart';
import 'package:easy_deal/features/about_us/presentation/view_model/about_us_cubit.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_view_body.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.aboutUs.tr(),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(PngImages.share)),
        ],
      ),
      body: BlocProvider(
          create: (context)=>AboutUsCubit(getIt.get<AboutUsRepoImpl>())..getAboutUs(),
          child: AboutUsViewBody()),
    );
  }
}
