import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class LegalDocumentHeader extends StatelessWidget {
  const LegalDocumentHeader({
    super.key,
    required this.titleKey,
    required this.introKey,
  });

  final String titleKey;
  final String introKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleKey.tr(), style: AppStyles.black20SemiBold),
        Gap(8.h),
        const _LastUpdatedChip(),
        Gap(14.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: AppColors.green.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.green.withValues(alpha: 0.2)),
          ),
          child: Text(
            introKey.tr(),
            style: AppStyles.grayDark14Medium.copyWith(height: 1.7),
          ),
        ),
      ],
    );
  }
}

class _LastUpdatedChip extends StatelessWidget {
  const _LastUpdatedChip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.update_rounded, size: 14.sp, color: AppColors.grayDark),
        Gap(6.w),
        Text(
          '${LangKeys.legalLastUpdated.tr()}: ${LangKeys.legalLastUpdatedDate.tr()}',
          style: AppStyles.gray12Medium,
        ),
      ],
    );
  }
}
