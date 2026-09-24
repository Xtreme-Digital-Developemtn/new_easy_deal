import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';

class StatusInformationSection extends StatelessWidget {
  const StatusInformationSection({super.key, this.data});

  final Data? data;

  @override
  Widget build(BuildContext context) {
    final status = data?.status != null
        ? RequestTranslations.status(data!.status)
        : '-';
    final rawFinishing = data?.attributes?.finishingStatus ?? data?.attributes?.furnishingStatus;
    final finishing = rawFinishing != null ? ApOptions.label(rawFinishing, context.isArabic) : '-';
    return RequestSection(
      title: 'STATUS INFORMATION',
      child: InfoCard(
        children: [
          InfoRow(
            title: 'Delivery Status',
            value: status,
          ),
          InfoRow(
            title: 'Finishing Status',
            value: finishing,
          ),
          if (data?.attributes?.furnishingStatus != null &&
              data?.attributes?.finishingStatus != null)
            InfoRow(
              title: 'Furnishing Status',
              value: ApOptions.label(data!.attributes!.furnishingStatus, context.isArabic),
            ),
        ],
      ),
    );
  }
}