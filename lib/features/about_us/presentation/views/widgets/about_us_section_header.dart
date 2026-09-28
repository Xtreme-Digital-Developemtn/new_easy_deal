import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsSectionHeader extends StatelessWidget {
  const AboutUsSectionHeader({
    super.key,
    required this.titleKey,
    required this.icon,
    this.color = AppColors.green,
    this.titleColor = AppColors.black,
  });

  final String titleKey;
  final IconData icon;
  final Color color;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: color, size: 20.sp),
        ),
        Gap(10.w),
        Expanded(
          child: Text(
            titleKey.tr(),
            style: AppStyles.black20SemiBold.copyWith(color: titleColor),
          ),
        ),
      ],
    );
  }
}
