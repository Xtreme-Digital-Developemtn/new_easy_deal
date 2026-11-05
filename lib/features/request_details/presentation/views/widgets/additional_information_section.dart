import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class AdditionalInformationSection extends StatelessWidget {
  const AdditionalInformationSection({super.key, this.attributes});

  final Attributes? attributes;

  /// الملحقات بعد فلترة العناصر الفاضية وتحويلها لنصوص معروضة
  static List<String> _facilities(BuildContext context, Attributes? attributes) =>
      DisplayValue.list(attributes?.otherAccessories)
          .map((e) => ApOptions.label(e, context.isArabic))
          .where((label) => DisplayValue.isValid(label))
          .toList();

  static String? _notes(Attributes? attributes) =>
      DisplayValue.text(attributes?.notes);

  /// القسم كله بيختفي لو مفيش ملحقات ولا ملاحظات
  static bool hasData(BuildContext context, Attributes? attributes) =>
      _facilities(context, attributes).isNotEmpty || _notes(attributes) != null;

  @override
  Widget build(BuildContext context) {
    final facilities = _facilities(context, attributes);
    final notes = _notes(attributes);
    if (facilities.isEmpty && notes == null) return const SizedBox.shrink();

    return RequestSection(
      title: LangKeys.additionalInformation.tr(),
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
            if (facilities.isNotEmpty) ...[
              Text(
                LangKeys.otherAccessories.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: facilities
                    .map((e) => _FacilityTag(title: e))
                    .toList(),
              ),
            ],
            if (notes != null) ...[
              if (facilities.isNotEmpty) const SizedBox(height: 14),
              Text(
                LangKeys.notes.tr(),
                style: const TextStyle(
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
