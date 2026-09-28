import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class LegalBulletItem extends StatelessWidget {
  const LegalBulletItem({super.key, required this.textKey});

  final String textKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 7.h),
            height: 6.r,
            width: 6.r,
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
          ),
          Gap(10.w),
          Expanded(
            child: Text(
              textKey.tr(),
              style: AppStyles.grayDark14Medium.copyWith(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}
