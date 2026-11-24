import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/features/contact_us/data/repos/contact_us_repo_imple.dart';
import 'package:easy_deal/features/contact_us/presentation/view_model/contact_us_cubit.dart';
import 'package:easy_deal/features/privacy_terms/data/legal_content.dart';
import 'package:easy_deal/features/privacy_terms/presentation/views/widgets/legal_document_body.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class PrivacyTermsView extends StatelessWidget {
  const PrivacyTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: GlobalAppBar(
          title: LangKeys.privacyAndTerms,
          bottom: const _LegalTabBar(),
        ),
        // The legal text itself is static, but the contact card at the end of
        // each document shows the same details the admin edits for Contact Us.
        body: BlocProvider(
          create: (context) =>
              ContactUsCubit(getIt.get<ContactUsRepoImpl>())..contactUs(),
          child: TabBarView(
            children: [
              LegalDocumentBody(
                document: LegalContent.terms,
                showWorkingHours: true,
              ),
              LegalDocumentBody(document: LegalContent.privacy),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegalTabBar extends StatelessWidget implements PreferredSizeWidget {
  const _LegalTabBar();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: AppColors.greenDark,
      unselectedLabelColor: AppColors.grayDark,
      indicatorColor: AppColors.greenDark,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppStyles.black14SemiBold.copyWith(color: AppColors.greenDark),
      unselectedLabelStyle: AppStyles.gray14Medium,
      tabs: [
        Tab(text: LangKeys.termsAndConditions.tr()),
        Tab(text: LangKeys.privacyPolicy.tr()),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
