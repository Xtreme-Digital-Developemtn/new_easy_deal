import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/profile/presentation/views/widgets/profile_list_item.dart';
import 'package:easy_deal/features/profile/presentation/views/widgets/show_promo_code_widget.dart';
import 'package:easy_deal/main_imports.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final promoModel =
        context.watch<ProfileCubit>().promoCodesLastAppliedModel;

    bool shouldShowPromo = false;

    if (promoModel != null) {
      final endDate = promoModel.data?.endDate;

      if (endDate != null) {
        final parsedDate = DateTime.parse(endDate);

        final isPromoExpired = DateTime.now().isAfter(parsedDate);

        shouldShowPromo =
            promoModel.data == null || isPromoExpired;
      } else {
        shouldShowPromo = promoModel.data == null;
      }
    } else {
      // لو مفيش data خالص
      shouldShowPromo = true;
    }

    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color.fromRGBO(12, 59, 182, 0.05),
      ),
      child: Column(
        children: [
          if (shouldShowPromo)
            ProfileListItem(
              title: "برجاء ادخال كود الخصم",
              subTitle: "ادخل كود الخصم الخاص بك",
              svgImage: SvgImages.profile,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) => PromoCodeBottomSheet(
                    onSubmit: (code) {
                      context
                          .read<ProfileCubit>()
                          .applyPromoCode(promoCode: code);
                    },
                  ),
                );
              },
            ),

          ProfileListItem(
            title: LangKeys.reportAnIssue,
            subTitle: LangKeys.reportAnIssueMsg,
            svgImage: SvgImages.bugReport,
            onTap: () {
              context.pushNamed(Routes.reportIssueView);
            },
          ),

          ProfileListItem(
            title: LangKeys.appSettings,
            subTitle: LangKeys.appSettingsMsg,
            svgImage: SvgImages.settings,
            onTap: () {
              context.pushNamed(Routes.appSettingsView);
            },
          ),

          ProfileListItem(
            title: LangKeys.aboutUs,
            subTitle: LangKeys.aboutUsMsg,
            svgImage: SvgImages.warning,
            onTap: () {
              context.pushNamed(Routes.aboutUsView);
            },
          ),

          ProfileListItem(
            title: LangKeys.contactUs,
            subTitle: LangKeys.contactUsMsg,
            svgImage: SvgImages.callCalling,
            onTap: () {
              context.pushNamed(Routes.contactUsView);
            },
          ),

          ProfileListItem(
            title: LangKeys.faqs,
            subTitle: LangKeys.faqsMsg,
            svgImage: SvgImages.faqs,
            onTap: () {
              context.pushNamed(Routes.faqsView);
            },
          ),

          ProfileListItem(
            isLast: true,
            title: LangKeys.privacyAndTerms,
            subTitle: LangKeys.privacyAndTermsMsg,
            svgImage: SvgImages.terms,
            onTap: () {
              context.pushNamed(Routes.privacyTermsView);
            },
          ),
        ],
      ),
    );
  }
}
