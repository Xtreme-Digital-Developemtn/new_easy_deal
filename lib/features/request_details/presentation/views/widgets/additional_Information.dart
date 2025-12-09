import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.add_box,color: AppColors.primaryDark,),
            Gap(12.w),
            Text(LangKeys.additionalInformation.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: Row(
              children: [
                Text("${LangKeys.otherAccessories.tr()} : "),
                Gap(24.w),
                Text("جراج"),
              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
