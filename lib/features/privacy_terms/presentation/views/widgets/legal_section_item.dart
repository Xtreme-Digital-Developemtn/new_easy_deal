import 'package:easy_deal/features/privacy_terms/data/models/legal_section_model.dart';
import 'package:easy_deal/features/privacy_terms/presentation/views/widgets/legal_bullet_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class LegalSectionItem extends StatelessWidget {
  const LegalSectionItem({
    super.key,
    required this.section,
    required this.number,
  });

  final LegalSectionModel section;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(number: number, titleKey: section.titleKey),
        Gap(10.h),
        if (section.bodyKey != null) ...[
          Text(
            section.bodyKey!.tr(),
            style: AppStyles.grayDark14Medium.copyWith(height: 1.7),
          ),
          Gap(10.h),
        ],
        ...section.bulletKeys.map((key) => LegalBulletItem(textKey: key)),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.number, required this.titleKey});

  final int number;
  final String titleKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 26.r,
          width: 26.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.green.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            '$number',
            style: AppStyles.black12SemiBold.copyWith(color: AppColors.greenDark),
          ),
        ),
        Gap(10.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Text(titleKey.tr(), style: AppStyles.black16SemiBold),
          ),
        ),
      ],
    );
  }
}
