import 'package:easy_deal/core/shared_widgets/general_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/core/utils/contact_launcher.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/config/recommended_fields.dart';
import 'package:easy_deal/features/request_details/data/models/recommended_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';

/// شيت تفاصيل الوحدة الموصى بها: بيتفتح من زرار "رؤية" في جدول التوصيات
/// وبيعرض باقي الحقول اللي مش ظاهرة في الجدول، كلها بالعربي، وأي حقل فاضي
/// أو صفر بيختفي هو وعنوانه.
class RecommendedUnitSheet extends StatelessWidget {
  const RecommendedUnitSheet({super.key, required this.item});

  final RecommendedData item;

  static Future<void> show(BuildContext context, RecommendedData item) {
    return StandardBottomSheet.show<void>(
      context: context,
      isScrollControlled: true,
      child: RecommendedUnitSheet(item: item),
    ).then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final json = item.raw;

    return SafeArea(
      top: false,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _handle(),
            _header(context, json),
            const Divider(height: 1, color: Color(0xffEEEEEE)),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _sections(context, json),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _handle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        width: 44.w,
        height: 4.h,
        decoration: BoxDecoration(
          color: const Color(0xffD8E1FF),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  /// كود الوحدة + تاجات النوع والعملية والحالة
  Widget _header(BuildContext context, Map<String, dynamic>? json) {
    final tags = <String>[
      for (final key in const ['type', 'unitOperation', 'status'])
        ...?_tagOf(context, json, key),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  LangKeys.unitTitle.tr(namedArgs: {'code': item.displayUnitCode}),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff202477),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, size: 22),
                color: const Color(0xff888888),
                tooltip: LangKeys.closeAction.tr(),
              ),
            ],
          ),
          if (tags.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: tags.map((tag) => _Tag(title: tag)).toList(),
            ),
        ],
      ),
    );
  }

  List<String>? _tagOf(
    BuildContext context,
    Map<String, dynamic>? json,
    String key,
  ) {
    final field = _findField(key);
    if (field == null) return null;
    final value = RecommendedFields.display(context, json, field);
    return value == null ? null : [value];
  }

  RecommendedField? _findField(String key) {
    for (final field in RecommendedFields.highlights) {
      if (field.key == key) return field;
    }
    for (final group in RecommendedFields.groups) {
      for (final field in group.fields) {
        if (field.key == key) return field;
      }
    }
    return null;
  }

  List<Widget> _sections(BuildContext context, Map<String, dynamic>? json) {
    final sections = <Widget>[
      ..._group(context, json, LangKeys.keyDetails.tr(), RecommendedFields.highlights),
      for (final group in RecommendedFields.groups)
        ..._group(context, json, group.title, group.fields),
      ..._contacts(context, json),
    ];

    if (sections.isEmpty) {
      return [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Center(
            child: Text(
              LangKeys.noExtraUnitDetails.tr(),
              style: const TextStyle(fontSize: 13, color: Color(0xff888888)),
            ),
          ),
        ),
      ];
    }
    return sections;
  }

  /// القسم اللي كل حقوله فاضية بيختفي هو وعنوانه والمسافة اللي بعده
  List<Widget> _group(
    BuildContext context,
    Map<String, dynamic>? json,
    String title,
    List<RecommendedField> fields,
  ) {
    final rows = <Widget?>[
      for (final field in fields)
        optionalInfoRow(
          title: field.label,
          value: RecommendedFields.display(context, json, field),
        ),
    ];

    if (!hasVisibleRows(rows)) return const [];

    return [
      RequestSection(title: title, child: InfoCard(children: rows)),
      SizedBox(height: 20.h),
    ];
  }

  /// بيانات التواصل: الاسم صف عادي، والرقم بزراري اتصال وواتساب
  List<Widget> _contacts(BuildContext context, Map<String, dynamic>? json) {
    final children = <Widget>[];

    for (final field in RecommendedFields.contacts) {
      final value = RecommendedFields.display(context, json, field);
      if (value == null) continue;
      if (field.kind == RecommendedFieldKind.phone) {
        children.add(_PhoneRow(title: field.label, phone: value));
      } else {
        children.add(InfoRow(title: field.label, value: value));
      }
    }

    final brokerPhone = DisplayValue.firstValid([
      item.broker?.phone,
      item.brokerUserPhone,
    ]);
    final brokerName = DisplayValue.text(item.displayBrokerName);
    if (brokerName != null) {
      children.add(InfoRow(title: LangKeys.colBroker.tr(), value: brokerName));
    }
    if (brokerPhone != null) {
      children.add(_PhoneRow(title: LangKeys.brokerPhone.tr(), phone: brokerPhone));
    }

    if (children.isEmpty) return const [];

    return [
      RequestSection(title: LangKeys.contactInfo.tr(), child: InfoCard(children: children)),
      SizedBox(height: 20.h),
    ];
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFDCEAFF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1234A6),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// صف رقم تليفون: الرقم نفسه + زرار اتصال وزرار واتساب بنفس الرقم
class _PhoneRow extends StatelessWidget {
  const _PhoneRow({required this.title, required this.phone});

  final String title;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffD8E1FF))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 13, color: Color(0xff888888)),
            ),
          ),
          Flexible(
            child: Text(
              phone,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xff202477),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          _CircleAction(
            color: const Color(0xff092FA3),
            icon: const Icon(Icons.phone, size: 15, color: Colors.white),
            tooltip: LangKeys.call.tr(),
            onTap: () => ContactLauncher.call(context, phone),
          ),
          SizedBox(width: 6.w),
          _CircleAction(
            color: const Color(0xFF25D366),
            tooltip: LangKeys.whatsapp.tr(),
            icon: SvgPicture.asset(
              SvgImages.whatsapp,
              width: 15,
              height: 15,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            onTap: () => ContactLauncher.whatsApp(context, phone),
          ),
        ],
      ),
    );
  }
}

class _CircleAction extends StatelessWidget {
  const _CircleAction({
    required this.color,
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });

  final Color color;
  final Widget icon;
  final VoidCallback onTap;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: color,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 30,
            height: 30,
            child: Center(child: icon),
          ),
        ),
      ),
    );
  }
}
