import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../../data/models/request_details_model.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key, this.attributes});
  final  Attributes? attributes;
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
                RequestDetailsItem(title: LangKeys.minimumUnitArea, value: attributes!.unitArea.toString()),
                RequestDetailsItem(title: LangKeys.maximumUnitArea, value: attributes!.unitArea.toString()),
                RequestDetailsItem(title: LangKeys.numberOfRooms, value: attributes!.rooms.toString()),
                RequestDetailsItem(title: LangKeys.bathrooms, value: attributes!.bathrooms.toString()),
                RequestDetailsItem(title: LangKeys.theView, value: attributes!.unitView.toString()),
                RequestDetailsItem(title: LangKeys.maximumAverageUnitPrice, value: attributes!.unitPrice.toString()),
                RequestDetailsItem(title: LangKeys.minimumAverageUnitPrice, value: attributes!.unitPriceSuggestions.toString(),isLast: true,),

              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
