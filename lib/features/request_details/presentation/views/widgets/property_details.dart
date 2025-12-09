import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.home_filled,color: AppColors.primaryDark,),
            Gap(12.w),
            Text(LangKeys.propertyDetails.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                RequestDetailsItem(title: LangKeys.minimumUnitArea, value: "100"),
                RequestDetailsItem(title: LangKeys.maximumUnitArea, value: "100"),
                RequestDetailsItem(title: LangKeys.numberOfRooms, value: "100"),
                RequestDetailsItem(title: LangKeys.bathrooms, value: "100"),
                RequestDetailsItem(title: LangKeys.theView, value: "100"),
                RequestDetailsItem(title: LangKeys.maximumAverageUnitPrice, value: "100"),
                RequestDetailsItem(title: LangKeys.minimumAverageUnitPrice, value: "100",isLast: true,),

              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
