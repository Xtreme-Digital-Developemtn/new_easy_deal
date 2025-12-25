import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class SiteDetails extends StatelessWidget {
  const SiteDetails({super.key, required this.address, this.locations});

  final String address;
  final List<Locations>? locations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.primaryDark),
            Gap(12.w),
            Text(LangKeys.siteDetails.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                RequestDetailsItem(
                  title: LangKeys.city,
                  value: context.isArabic
                      ? locations![0].city!.nameAr.toString()
                      : locations![0].city!.nameEn.toString(),
                ),
                RequestDetailsItem(
                  title: LangKeys.area,
                  value: locations![0].areas.toString(),
                ),
                RequestDetailsItem(
                  title: LangKeys.subArea,
                  value: address,
                  isLast: true,
                ),
              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
