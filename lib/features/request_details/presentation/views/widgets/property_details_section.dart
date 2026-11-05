import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class PropertyDetailsSection extends StatelessWidget {
  const PropertyDetailsSection({super.key, this.attributes});

  final Attributes? attributes;

  /// المساحة والسعر: الصفر معناه "مفيش قيمة" فبيختفي الصف بالكامل.
  static String? _areaText(dynamic value) =>
      DisplayValue.withSuffix(value, LangKeys.squareMeter.tr());

  static String? _priceText(dynamic value) =>
      DisplayValue.withSuffix(value, LangKeys.egp.tr());

  static List<Widget?> _rows(BuildContext context, Attributes? attr) => [
        optionalInfoRow(
          title: LangKeys.floor.tr(),
          // الدور الأرضي ممكن يجي كـ 0 فالصفر هنا قيمة صحيحة
          value: DisplayValue.mapped(
            attr?.floor,
            (raw) => ApOptions.label(raw?.toString(), context.isArabic),
            zeroIsValid: true,
          ),
        ),
        optionalInfoRow(
          title: LangKeys.minimumUnitArea.tr(),
          value: _areaText(attr?.unitArea),
        ),
        optionalInfoRow(
          title: LangKeys.maximumUnitArea.tr(),
          value: _areaText(attr?.unitArea),
        ),
        optionalInfoRow(
          title: LangKeys.numberOfRooms.tr(),
          value: DisplayValue.text(attr?.rooms),
        ),
        optionalInfoRow(
          title: LangKeys.bathrooms.tr(),
          value: DisplayValue.text(attr?.bathrooms),
        ),
        optionalInfoRow(
          title: LangKeys.theView.tr(),
          value: DisplayValue.mapped(
            attr?.unitView,
            (raw) => ApOptions.label(raw?.toString(), context.isArabic),
          ),
        ),
        optionalInfoRow(
          title: LangKeys.minimumAverageUnitPrice.tr(),
          value: _priceText(attr?.unitPrice),
        ),
        optionalInfoRow(
          title: LangKeys.maximumAverageUnitPrice.tr(),
          // نفس المنطق القديم: الاقتراح لو موجود وإلا سعر الوحدة
          value: _priceText(
            DisplayValue.firstValidRaw([attr?.unitPriceSuggestions, attr?.unitPrice]),
          ),
        ),
      ];

  static bool hasData(BuildContext context, Attributes? attr) =>
      hasVisibleRows(_rows(context, attr));

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.propertyDetails.tr(),
      child: InfoCard(children: _rows(context, attributes)),
    );
  }
}
