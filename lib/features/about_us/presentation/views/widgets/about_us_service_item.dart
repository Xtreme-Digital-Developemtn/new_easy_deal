import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUsServiceItem extends StatelessWidget {
  const AboutUsServiceItem({super.key, required this.titleKey});

  final String titleKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6.h),
          height: 8.r,
          width: 8.r,
          decoration: const BoxDecoration(
            color: AppColors.green,
            shape: BoxShape.circle,
          ),
        ),
        Gap(10.w),
        Expanded(
          child: Text(titleKey.tr(), style: AppStyles.black14Medium),
        ),
      ],
    );
  }
}
