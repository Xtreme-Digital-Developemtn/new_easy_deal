import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:map_launcher/map_launcher.dart';

class UnitLocation extends StatefulWidget {
  const UnitLocation({super.key, this.location, this.title});

  /// قيمة `location` كما جاءت من الـ API: "lat,lng" أو رابط خرائط.
  final String? location;

  /// الاسم اللي يظهر على الماركر (اسم المدينة مثلًا).
  final String? title;

  @override
  State<UnitLocation> createState() => _UnitLocationState();
}

class _UnitLocationState extends State<UnitLocation> {
  /// مش `late`: الضغط ممكن يحصل قبل ما التحميل يخلص،
  /// والقائمة ممكن ترجع فاضية لو مفيش تطبيق خرائط متثبّت.
  List<AvailableMap> availableMaps = const [];

  @override
  void initState() {
    super.initState();
    initMap();
  }

  Future<void> initMap() async {
    try {
      final maps = await MapLauncher.installedMaps;
      if (!mounted) return;
      setState(() => availableMaps = maps);
    } catch (_) {
      // مفيش تطبيق خرائط — الزرار يفضل غير فعّال بدل ما يرمي استثناء
    }
  }

  /// يطلع (lat, lng) من نص زي "30.0444,31.2357" أو من رابط فيه الإحداثيات.
  ({double lat, double lng})? _parseCoords(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    final matches = RegExp(r'-?\d+\.?\d*').allMatches(raw).toList();
    if (matches.length < 2) return null;
    final lat = double.tryParse(matches[0].group(0)!);
    final lng = double.tryParse(matches[1].group(0)!);
    if (lat == null || lng == null) return null;
    if (lat.abs() > 90 || lng.abs() > 180) return null;
    return (lat: lat, lng: lng);
  }

  Future<void> _openMap() async {
    final coords = _parseCoords(widget.location);
    if (coords == null || availableMaps.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LangKeys.notAvailable.tr())),
      );
      return;
    }
    try {
      await availableMaps.first.showMarker(
        coords: Coords(coords.lat, coords.lng),
        title: widget.title ?? '',
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LangKeys.somethingWentWrong.tr())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openMap,
      child: SvgPicture.asset(SvgImages.map),
    );
  }
}
