
import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class PropertyDetailsSection extends StatelessWidget {
  const PropertyDetailsSection({super.key, this.attributes});

  final Attributes? attributes;

  String _areaText(int? value) => value != null ? '$value m²' : '-';
  String _priceText(int? value) => value != null ? '$value EGP' : '-';

  @override
  Widget build(BuildContext context) {
    final attr = attributes;
    return RequestSection(
      title: 'PROPERTY DETAILS',
      child: InfoCard(
        children: [
          InfoRow(
            title: 'Floor',
            value: attr?.floor != null ? ApOptions.label(attr!.floor, context.isArabic) : '-',
          ),
          InfoRow(
            title: 'Min Unit Area',
            value: _areaText(attr?.unitArea),
          ),
          InfoRow(
            title: 'Max Unit Area',
            value: _areaText(attr?.unitArea),
          ),
          InfoRow(
            title: 'Rooms',
            value: attr?.rooms?.toString() ?? '-',
          ),
          InfoRow(
            title: 'Bathrooms',
            value: attr?.bathrooms?.toString() ?? '-',
          ),
          InfoRow(
            title: 'Unit View',
            value: attr?.unitView != null ? ApOptions.label(attr!.unitView, context.isArabic) : '-',
          ),
          InfoRow(
            title: 'Min Avg Unit Price',
            value: _priceText(attr?.unitPrice),
          ),
          InfoRow(
            title: 'Max Avg Unit Price',
            value: _priceText(attr?.unitPriceSuggestions ?? attr?.unitPrice),
          ),
        ],
      ),
    );
  }
}