import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';

class RequestInformationSection extends StatelessWidget {
  const RequestInformationSection({super.key, this.data});

  final Data? data;

  String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return '-';
    try {
      final dt = DateTime.parse(raw);
      // e.g. Jul 29, 2026 - use manual format to avoid extra deps
      const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
      return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
    } catch (_) {
      return raw;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: 'REQUEST INFORMATION',
      child: InfoCard(
        children: [
          InfoRow(
            title: 'Request ID',
            value: data?.id?.toString() ?? '-',
          ),
          InfoRow(
            title: 'Title',
            value: (data?.type != null || data?.unit != null)
                ? RequestTranslations.title(data?.type, data?.unit)
                : (data?.title?.toString() ?? '-'),
          ),
          InfoRow(
            title: 'Creation Date',
            value: _formatDate(data?.createdAt),
          ),
          InfoRow(
            title: 'Last Updated',
            value: _formatDate(data?.updatedAt),
          ),
          InfoRow(
            title: 'Replies',
            value: data?.numberOfReplies?.toString() ?? '0',
          ),
        ],
      ),
    );
  }
}