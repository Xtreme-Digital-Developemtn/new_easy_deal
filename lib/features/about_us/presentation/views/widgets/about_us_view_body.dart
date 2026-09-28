import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_cta_section.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_hero.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/our_mission_section.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/our_vision_section.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/who_we_are_section.dart';
import 'package:easy_deal/main_imports.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AboutUsHero(),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 30.h),
            child: Column(
              children: [
                const WhoWeAreSection(),
                Gap(28.h),
                const OurMissionSection(),
                Gap(28.h),
                const OurVisionSection(),
                Gap(28.h),
                const AboutUsCtaSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
