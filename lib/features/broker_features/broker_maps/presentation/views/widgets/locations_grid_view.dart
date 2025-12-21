import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';
import 'location_card.dart';

class LocationsGridView extends StatelessWidget {
  const LocationsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 0.55,
      ),
      itemCount: mapLocations.length,
      itemBuilder: (context, index) {
        return LocationCard(mapLocations[index]);
      },
    );
  }
}

// Sample data - replace with your actual data source
final List<MapLocation> mapLocations = const [
  MapLocation(
    id: '1',
    name: 'Downtown Office',
    imageUrl: 'https://via.placeholder.com/300x200?text=Office+1',
    latitude: 37.7749,
    longitude: -122.4194,
    address: '123 Main St, San Francisco, CA',
    category: 'Office',
  ),
  MapLocation(
    id: '2',
    name: 'Shopping Mall',
    imageUrl: 'https://via.placeholder.com/300x200?text=Mall+View',
    latitude: 37.7849,
    longitude: -122.4094,
    address: '456 Market St, San Francisco, CA',
    category: 'Commercial',
  ),
  MapLocation(
    id: '3',
    name: 'Residential Complex',
    imageUrl: 'https://via.placeholder.com/300x200?text=Residential',
    latitude: 37.7649,
    longitude: -122.4294,
    address: '789 Park Ave, San Francisco, CA',
    category: 'Residential',
  ),
  MapLocation(
    id: '4',
    name: 'Industrial Zone',
    imageUrl: 'https://via.placeholder.com/300x200?text=Industrial',
    latitude: 37.7549,
    longitude: -122.4394,
    address: '101 Factory Rd, San Francisco, CA',
    category: 'Industrial',
  ),
];

