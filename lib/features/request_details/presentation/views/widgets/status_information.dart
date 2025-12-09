import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class StatusInformation extends StatelessWidget {
  const StatusInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.add_box,color: AppColors.primaryDark,),
            Gap(12.w),
            Text(LangKeys.statusInformation.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                RequestDetailsItem(title: LangKeys.deliveryStatus, value: "100"),
                RequestDetailsItem(title: LangKeys.finishingCondition, value: "100",isLast: true,),

              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
