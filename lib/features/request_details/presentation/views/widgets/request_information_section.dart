import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';

class RequestInformationSection extends StatelessWidget {
  const RequestInformationSection({super.key, this.data});

  final Data? data;

  static String? _formatDate(String? raw) {
    final value = DisplayValue.text(raw);
    if (value == null) return null;
    try {
      final dt = DateTime.parse(value);
      // e.g. Jul 29, 2026 - use manual format to avoid extra deps
      const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
      return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
    } catch (_) {
      return value;
    }
  }

  static String? _title(Data? data) {
    // نفس المنطق القديم: العنوان مبني على النوع + نوع الوحدة وإلا عنوان الـAPI
    if (DisplayValue.isValid(data?.type) || DisplayValue.isValid(data?.unit)) {
      return DisplayValue.text(RequestTranslations.title(data?.type, data?.unit));
    }
    return DisplayValue.text(data?.title);
  }

  static List<Widget?> _rows(Data? data) => [
        optionalInfoRow(
          title: LangKeys.requestId.tr(),
          value: DisplayValue.text(data?.id),
        ),
        optionalInfoRow(
          title: LangKeys.title.tr(),
          value: _title(data),
        ),
        optionalInfoRow(
          title: LangKeys.dateOfCreation.tr(),
          value: _formatDate(data?.createdAt),
        ),
        optionalInfoRow(
          title: LangKeys.lastUpdated.tr(),
          value: _formatDate(data?.updatedAt),
        ),
        optionalInfoRow(
          title: LangKeys.numberOfReplies.tr(),
          // عدد الردود صفر قيمة حقيقية ومفيدة للمستخدم
          value: DisplayValue.text(data?.numberOfReplies, zeroIsValid: true),
        ),
      ];

  static bool hasData(Data? data) => hasVisibleRows(_rows(data));

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.requestInformation.tr(),
      child: InfoCard(children: _rows(data)),
    );
  }
}
