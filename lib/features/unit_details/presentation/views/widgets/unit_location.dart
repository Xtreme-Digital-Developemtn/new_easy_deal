import 'package:easy_deal/main_imports.dart';
import 'package:map_launcher/map_launcher.dart';

class UnitLocation extends StatefulWidget {
  const UnitLocation({super.key});

  @override
  State<UnitLocation> createState() => _UnitLocationState();
}

class _UnitLocationState extends State<UnitLocation> {
  @override
  void initState() {
    initMap();
    super.initState();
  }
  late  List<AvailableMap> availableMaps;
  Future<void> initMap()
  async {
      availableMaps = await MapLauncher.installedMaps;
  }
  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () async {
          await availableMaps.first.showMarker(
            coords: Coords(37.759392, -122.5107336),
            title: "Ocean Beach",
          );
        },
        child: SvgPicture.asset(SvgImages.map));
  }
}
