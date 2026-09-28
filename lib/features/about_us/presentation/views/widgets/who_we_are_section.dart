import 'package:easy_deal/features/about_us/data/about_us_content.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_rounded_image.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_section_header.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_service_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class WhoWeAreSection extends StatelessWidget {
  const WhoWeAreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AboutUsSectionHeader(
          titleKey: LangKeys.whoWeAre,
          icon: Icons.apartment_rounded,
        ),
        Gap(14.h),
        Text(
          LangKeys.whoWeAreDescription.tr(),
          style: AppStyles.grayDark14Medium.copyWith(height: 1.7),
        ),
        Gap(16.h),
        const AboutUsRoundedImage(image: JpgImages.aboutUsTeam),
        Gap(16.h),
        ...AboutUsContent.services.map(
          (service) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: AboutUsServiceItem(titleKey: service),
          ),
        ),
      ],
    );
  }
}
