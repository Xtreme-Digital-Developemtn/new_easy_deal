import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';

class StatusInformationSection extends StatelessWidget {
  const StatusInformationSection({super.key, this.data});

  final Data? data;

  static List<Widget?> _rows(BuildContext context, Data? data) {
    // نفس المنطق القديم: حالة التشطيب لو موجودة وإلا حالة الفرش
    final rawFinishing = DisplayValue.firstValidRaw([
      data?.attributes?.finishingStatus,
      data?.attributes?.furnishingStatus,
    ]);
    return [
      optionalInfoRow(
        title: LangKeys.deliveryStatus.tr(),
        value: DisplayValue.mapped(data?.status, RequestTranslations.status),
      ),
      optionalInfoRow(
        title: LangKeys.finishingCondition.tr(),
        value: DisplayValue.mapped(
          rawFinishing,
          (raw) => ApOptions.label(raw?.toString(), context.isArabic),
        ),
      ),
      // الفرش بيظهر كصف منفصل بس لما الاتنين موجودين (نفس الشرط القديم)
      if (DisplayValue.isValid(data?.attributes?.furnishingStatus) &&
          DisplayValue.isValid(data?.attributes?.finishingStatus))
        optionalInfoRow(
          title: LangKeys.furnishingStatus.tr(),
          value: DisplayValue.mapped(
            data?.attributes?.furnishingStatus,
            (raw) => ApOptions.label(raw?.toString(), context.isArabic),
          ),
        ),
    ];
  }

  static bool hasData(BuildContext context, Data? data) =>
      hasVisibleRows(_rows(context, data));

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.statusInformation.tr(),
      child: InfoCard(children: _rows(context, data)),
    );
  }
}
