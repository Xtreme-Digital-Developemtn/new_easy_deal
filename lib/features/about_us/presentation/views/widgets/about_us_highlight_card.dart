import 'package:easy_deal/features/about_us/data/models/about_us_highlight_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsHighlightCard extends StatelessWidget {
  const AboutUsHighlightCard({super.key, required this.highlight});

  final AboutUsHighlightModel highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.backgroundLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.green.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(highlight.icon, color: AppColors.green, size: 18.sp),
          ),
          Gap(10.h),
          Text(highlight.titleKey.tr(), style: AppStyles.black14SemiBold),
          Gap(6.h),
          Expanded(
            child: Text(
              highlight.descriptionKey.tr(),
              style: AppStyles.gray12Medium.copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
