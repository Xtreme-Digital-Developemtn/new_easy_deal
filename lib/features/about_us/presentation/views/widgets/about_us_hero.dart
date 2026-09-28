import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsHero extends StatelessWidget {
  const AboutUsHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(JpgImages.aboutUsHero, fit: BoxFit.cover),
          const _HeroOverlay(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LangKeys.aboutEasyDeal.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.white18SemiBold.copyWith(
                    fontSize: 26.sp,
                    fontWeight: AppStyles.extraBold,
                  ),
                ),
                Gap(10.h),
                Text(
                  LangKeys.aboutUsHeroSubtitle.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.white14Medium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroOverlay extends StatelessWidget {
  const _HeroOverlay();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.blueDark.withValues(alpha: 0.75),
            AppColors.black.withValues(alpha: 0.65),
          ],
        ),
      ),
    );
  }
}
