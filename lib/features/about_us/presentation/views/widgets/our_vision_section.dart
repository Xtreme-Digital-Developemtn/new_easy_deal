import 'package:easy_deal/features/about_us/data/about_us_content.dart';
import 'package:easy_deal/features/about_us/presentation/views/widgets/about_us_vision_card.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class OurVisionSection extends StatelessWidget {
  const OurVisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(JpgImages.aboutUsVision, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: ColoredBox(
              color: AppColors.blueDark.withValues(alpha: 0.9),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.green.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.public_rounded,
                    color: AppColors.green,
                    size: 24.sp,
                  ),
                ),
                Gap(14.h),
                Text(
                  LangKeys.ourVisionForTheFuture.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.white18SemiBold,
                ),
                Gap(10.h),
                Text(
                  LangKeys.ourVisionDescription.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.white14Medium.copyWith(height: 1.7),
                ),
                Gap(18.h),
                ...AboutUsContent.visionHighlights.map(
                  (highlight) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: AboutUsVisionCard(highlight: highlight),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
