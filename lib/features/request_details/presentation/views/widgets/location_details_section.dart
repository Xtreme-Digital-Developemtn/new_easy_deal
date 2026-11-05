import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/request_details/data/config/area_display.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class LocationDetailsSection extends StatelessWidget {
  const LocationDetailsSection({super.key, this.data});

  final Data? data;

  static String? _cityName(BuildContext context, Data? data) {
    final city = data?.locations?.isNotEmpty == true ? data!.locations!.first.city : null;
    if (city == null) return null;
    return context.isArabic
        ? DisplayValue.firstValid([city.nameAr, city.nameEn])
        : DisplayValue.firstValid([city.nameEn, city.nameAr]);
  }

  /// `AreaDisplay` بيرجّع '-' لو مفيش مناطق، فبنعدّيه على التحقق الموحد.
  static String? _areaName(BuildContext context, Data? data) =>
      DisplayValue.text(AreaDisplay.fromLocations(context, data?.locations));

  static List<Widget?> _rows(BuildContext context, Data? data) => [
        optionalInfoRow(
          title: LangKeys.city.tr(),
          value: _cityName(context, data),
        ),
        optionalInfoRow(
          title: LangKeys.area.tr(),
          value: _areaName(context, data),
        ),
        optionalInfoRow(
          title: LangKeys.detailedAddress.tr(),
          value: DisplayValue.text(data?.detailedAddress),
        ),
      ];

  static bool hasData(BuildContext context, Data? data) =>
      hasVisibleRows(_rows(context, data));

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.siteDetails.tr(),
      child: InfoCard(children: _rows(context, data)),
    );
  }
}
