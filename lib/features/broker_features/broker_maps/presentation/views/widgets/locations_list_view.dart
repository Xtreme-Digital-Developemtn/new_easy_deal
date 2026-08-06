import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';
import 'location_card.dart';

class LocationsListView extends StatelessWidget {
  final List<MapItem> locations;
  const LocationsListView({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.map_outlined, size: 64.sp, color: Colors.grey[400]),
            Gap(12.h),
            Text(
              "لا توجد خرائط متاحة",
              style: AppStyles.gray14Medium,
            ),
          ],
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