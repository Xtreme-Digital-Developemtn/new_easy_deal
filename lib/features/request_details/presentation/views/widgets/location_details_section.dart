import 'package:easy_deal/features/request_details/data/config/area_display.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class LocationDetailsSection extends StatelessWidget {
  const LocationDetailsSection({super.key, this.data});

  final Data? data;

  String _cityName(BuildContext context) {
    final city = data?.locations?.isNotEmpty == true ? data!.locations!.first.city : null;
    if (city == null) return '-';
    return context.isArabic
        ? (city.nameAr?.toString().isNotEmpty == true ? city.nameAr! : city.nameEn ?? '-')
        : (city.nameEn?.toString().isNotEmpty == true ? city.nameEn! : city.nameAr ?? '-');
  }

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: 'LOCATION DETAILS',
      child: InfoCard(
        children: [
          InfoRow(
            title: 'City',
            value: _cityName(context),
          ),
          InfoRow(
            title: 'Area',
            value: AreaDisplay.fromLocations(context, data?.locations),
          ),
          if (data?.detailedAddress != null && data!.detailedAddress!.isNotEmpty)
            InfoRow(
              title: 'Detailed Address',
              value: data!.detailedAddress!,
            ),
        ],
      ),
    );
  }
}
