import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class StatusInformation extends StatelessWidget {
  const StatusInformation({super.key, required this.status, required this.finishingCondition});
  final String status;
  final String finishingCondition;
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
                RequestDetailsItem(title: LangKeys.deliveryStatus, value:status),
                RequestDetailsItem(title: LangKeys.finishingCondition, value:finishingCondition,isLast: true,),

              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
