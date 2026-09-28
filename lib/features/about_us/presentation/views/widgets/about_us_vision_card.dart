import 'package:easy_deal/features/about_us/data/models/about_us_highlight_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsVisionCard extends StatelessWidget {
  const AboutUsVisionCard({super.key, required this.highlight});

  final AboutUsHighlightModel highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            highlight.titleKey.tr(),
            style: AppStyles.white14SemiBold.copyWith(color: AppColors.green),
          ),
          Gap(6.h),
          Text(
            highlight.descriptionKey.tr(),
            style: AppStyles.white12Medium.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
