import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';
import 'location_card.dart';

class LocationsListView extends StatelessWidget {
  final List<MapItem> locations;
  const LocationsListView({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    // حالة القائمة الفاضية: رسالة واضحة بدل شاشة بيضا.
    if (locations.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.map_outlined, size: 64.sp, color: Colors.grey[400]),
              Gap(16.h),
              Text(
                LangKeys.noSavedMapsYet.tr(),
                style: AppStyles.black16SemiBold,
                textAlign: TextAlign.center,
              ),
              Gap(8.h),
              Text(
                LangKeys.addMapHint.tr(),
                style: AppStyles.gray14Medium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        return LocationCard(location: locations[index]);
      },
      separatorBuilder: (context, index) {
        return Gap(12.h);
      },
      itemCount: locations.length,
    );
  }
}
