import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class SiteDetails extends StatelessWidget {
  const SiteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_on,color: AppColors.primaryDark,),
            Gap(12.w),
            Text(LangKeys.siteDetails.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                RequestDetailsItem(title: LangKeys.city, value: "cairo"),
                RequestDetailsItem(title: LangKeys.area, value: "cairo"),
                RequestDetailsItem(title: LangKeys.subArea, value: "cairo",isLast: true,),
              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
