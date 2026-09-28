import 'package:easy_deal/features/about_us/data/about_us_content.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_highlight_card.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_section_header.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class OurMissionSection extends StatelessWidget {
  const OurMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AboutUsSectionHeader(
          titleKey: LangKeys.ourMission,
          icon: Icons.business_rounded,
        ),
        Gap(14.h),
        Text(
          LangKeys.ourMissionDescription.tr(),
          style: AppStyles.grayDark14Medium.copyWith(height: 1.7),
        ),
        Gap(16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: AboutUsContent.missionHighlights.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            mainAxisExtent: 150.h,
          ),
          itemBuilder: (context, index) => AboutUsHighlightCard(
            highlight: AboutUsContent.missionHighlights[index],
          ),
        ),
      ],
    );
  }
}
