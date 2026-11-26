import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

class AddressInformationSection extends StatelessWidget {
  const AddressInformationSection({super.key, this.data});

  final Data? data;

  static String? _detailedAddress(Data? data) => DisplayValue.text(
        DisplayValue.firstValid([
          data?.detailedAddress,
          data?.attributes?.detailedAddress,
        ]),
      );

  static String? _addressLink(Data? data) =>
      DisplayValue.text(data?.attributes?.addressLink);

  static List<Widget?> _rows(Data? data) => [
        optionalInfoRow(
          title: LangKeys.detailedAddress.tr(),
          value: _detailedAddress(data),
        ),
        _addressLink(data) == null
            ? null
            : _AddressLinkRow(url: _addressLink(data)!),
      ];

  static bool hasData(BuildContext context, Data? data) =>
      hasVisibleRows(_rows(data));

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.addressInformation.tr(),
      child: InfoCard(children: _rows(data)),
    );
  }
}

class _AddressLinkRow extends StatelessWidget {
  const _AddressLinkRow({required this.url});

  final String url;

  Future<void> _open(BuildContext context) async {
    final parsed = Uri.tryParse(url);
    final target = (parsed != null && parsed.hasScheme)
        ? parsed
        : Uri.tryParse('https://$url');
    if (target == null) return;
    try {
      await launchUrl(target, mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffD8E1FF)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              LangKeys.locationLink.tr(),
              style: const TextStyle(fontSize: 13, color: Color(0xff888888)),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: InkWell(
              onTap: () => _open(context),
              child: Text(
                url,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff202477),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}