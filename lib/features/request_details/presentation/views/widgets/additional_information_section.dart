import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class AdditionalInformationSection extends StatelessWidget {
  const AdditionalInformationSection({super.key, this.attributes});

  final Attributes? attributes;

  @override
  Widget build(BuildContext context) {
    final facilities = attributes?.otherAccessories ?? [];
    final notes = attributes?.notes;
    return RequestSection(
      title: 'ADDITIONAL INFORMATION',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xffD8E1FF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Other Facilities',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            if (facilities.isEmpty)
              const Text(
                '-',
                style: TextStyle(fontSize: 13, color: Color(0xff888888)),
              )
            else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: facilities
                    .map((e) => _FacilityTag(title: e.toString()))
                    .toList(),
              ),
            if (notes != null && notes.isNotEmpty) ...[
              const SizedBox(height: 14),
              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                notes,
                style: const TextStyle(fontSize: 13, color: Color(0xff44516A)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}



class _FacilityTag extends StatelessWidget {
  final String title;

  const _FacilityTag({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffE1F3FF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xff44516A),
        ),
      ),
    );
  }
}