import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';
import 'location_card.dart';

class LocationsListView extends StatelessWidget {
  final List<MapLocationData> locations;
  const LocationsListView({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
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