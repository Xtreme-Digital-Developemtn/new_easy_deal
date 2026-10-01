import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class PropertyDetailsSection extends StatelessWidget {
  const PropertyDetailsSection({super.key, this.attributes});

  final Attributes? attributes;

  String _areaText(int? value) =>
      value != null ? '$value ${LangKeys.squareMeter.tr()}' : '-';

  String _priceText(int? value) =>
      value != null ? '$value ${LangKeys.egp.tr()}' : '-';

  @override
  Widget build(BuildContext context) {
    final attr = attributes;
    return RequestSection(
      title: LangKeys.propertyDetails.tr(),
      child: InfoCard(
        children: [
          InfoRow(
            title: LangKeys.floor.tr(),
            value: attr?.floor != null
                ? ApOptions.label(attr!.floor, context.isArabic)
                : '-',
          ),
          InfoRow(
            title: LangKeys.minimumUnitArea.tr(),
            value: _areaText(attr?.unitArea),
          ),
          InfoRow(
            title: LangKeys.maximumUnitArea.tr(),
            value: _areaText(attr?.unitArea),
          ),
          InfoRow(
            title: LangKeys.numberOfRooms.tr(),
            value: attr?.rooms?.toString() ?? '-',
          ),
          InfoRow(
            title: LangKeys.bathrooms.tr(),
            value: attr?.bathrooms?.toString() ?? '-',
          ),
          InfoRow(
            title: LangKeys.theView.tr(),
            value: attr?.unitView != null
                ? ApOptions.label(attr!.unitView, context.isArabic)
                : '-',
          ),
          InfoRow(
            title: LangKeys.minimumAverageUnitPrice.tr(),
            value: _priceText(attr?.unitPrice),
          ),
          InfoRow(
            title: LangKeys.maximumAverageUnitPrice.tr(),
            value: _priceText(attr?.unitPriceSuggestions ?? attr?.unitPrice),
          ),
        ],
      ),
    );
  }
}
