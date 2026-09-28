import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsCtaSection extends StatelessWidget {
  const AboutUsCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.green, AppColors.greenDark],
        ),
      ),
      child: Column(
        children: [
          Text(
            LangKeys.readyForNewRealEstateExperience.tr(),
            textAlign: TextAlign.center,
            style: AppStyles.white18SemiBold,
          ),
          Gap(10.h),
          Text(
            LangKeys.aboutUsCtaDescription.tr(),
            textAlign: TextAlign.center,
            style: AppStyles.white14Medium.copyWith(height: 1.6),
          ),
          Gap(20.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  width: double.infinity,
                  height: 46.h,
                  borderRadius: 12,
                  gradientColors: false,
                  color: AppColors.white,
                  textColor: AppColors.greenDark,
                  fontSize: 14.sp,
                  fontWeight: AppStyles.semiBold,
                  text: LangKeys.contactUs.tr(),
                  onPressed: () => context.pushNamed(Routes.contactUsView),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: CustomButton(
                  width: double.infinity,
                  height: 46.h,
                  borderRadius: 12,
                  gradientColors: false,
                  color: Colors.transparent,
                  borderColor: const BorderSide(color: AppColors.white),
                  textColor: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: AppStyles.semiBold,
                  text: LangKeys.exploreProperties.tr(),
                  onPressed: () =>
                      context.pushNamedAndRemoveUntil(Routes.layoutView),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
