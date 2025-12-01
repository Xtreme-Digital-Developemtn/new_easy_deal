import 'package:easy_deal/features/profile/presentation/views/widgets/profile_list_item.dart';
import 'package:easy_deal/main_imports.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color.fromRGBO(12, 59, 182, 0.05),
      ),
      child: Column(
        children: [
          ProfileListItem(
              title: LangKeys.reportAnIssue,
              subTitle: LangKeys.reportAnIssueMsg,
              svgImage: SvgImages.bugReport,
              onTap: (){},
          ),
          ProfileListItem(
            title: LangKeys.appSettings,
            subTitle: LangKeys.appSettingsMsg,
            svgImage: SvgImages.settings,
            onTap: (){},
          ),
          ProfileListItem(
            title: LangKeys.aboutUs,
            subTitle: LangKeys.aboutUsMsg,
            svgImage: SvgImages.warning,
            onTap: (){},
          ),
          ProfileListItem(
            title: LangKeys.contactUs,
            subTitle: LangKeys.contactUsMsg,
            svgImage: SvgImages.callCalling,
            onTap: (){},
          ),
          ProfileListItem(
            title: LangKeys.faqs,
            subTitle: LangKeys.faqsMsg,
            svgImage: SvgImages.faqs,
            onTap: (){},
          ),
          ProfileListItem(
            isLast: true,
            title: LangKeys.privacyAndTerms,
            subTitle: LangKeys.privacyAndTermsMsg,
            svgImage: SvgImages.terms,
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
