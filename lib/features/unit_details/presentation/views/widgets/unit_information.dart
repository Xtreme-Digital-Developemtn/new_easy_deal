import 'package:easy_deal/features/add_property/data/config/ap_fields.dart';
import 'package:easy_deal/features/add_property/data/config/ap_option_item.dart';
import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

/// Renders every field the API sent for the unit, skipping keys whose value is
/// null / empty / zero and keys that are already shown elsewhere on the screen
/// (gallery, broker card, price header, features, description, map...).
class UnitInformation extends StatelessWidget {
  const UnitInformation({super.key, required this.data});

  /// The raw API payload for the unit (see `Data.raw`).
  final Map<String, dynamic>? data;

  /// Keys rendered by other widgets of the unit-details screen, or purely
  /// technical keys that mean nothing to the end user.
  static const Set<String> _hiddenKeys = {
    // technical / internal
    'id', 'modelId', 'brokerId', 'broker', 'broker_user_image', 'advertisers',
    'isArchived', 'created_at', 'createdAt', 'updated_at', 'updatedAt',
    'gallery', 'diagram', 'locationInMasterPlan',
    'broker_user_id', 'brokerUserId',
    // shown by UnitImageTypeLocation / UnitPriceStatusIndoor
    'type', 'status', 'city', 'area', 'subArea', 'otherSubAreas',
    // shown by UnitLocation
    'location',
    // shown by UnitFeatures
    'otherAccessories',
    // shown by UnitDescription
    'notes',
    // owner identity / internal numbering — not shown to the end user
    'ownerName', 'ownerPhone', 'unitNumber', 'buildingNumber',
  };

  /// Values that get the currency suffix.
  static const Set<String> _moneyKeys = {
    'dailyRent', 'monthlyRent', 'pricePerMeterInCash', 'totalPriceInCash',
    'pricePerMeterInInstallment', 'totalPriceInInstallment', 'insuranceValue',
    'otherExpensesValue', 'requestedOver',
  };

  /// Labels for keys that have no entry in [ApFields.meta].
  static const Map<String, ApText> _extraLabels = {
    'modelCode': ApText('كود الوحدة', 'Unit Code'),
    'unitOperation': ApText('نوع العملية', 'Operation'),
    'compoundType': ApText('نوع الكمبوند', 'Compound Type'),
    'projectName': ApText('اسم المشروع', 'Project Name'),
    'developerName': ApText('اسم المطور', 'Developer Name'),
    'detailedAddress': ApText('العنوان بالتفصيل', 'Detailed Address'),
    // 'ownerName': ApText('اسم المالك', 'Owner Name'),
  };

  @override
  Widget build(BuildContext context) {
    final entries = _buildEntries(context);
    if (entries.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.gray1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LangKeys.unitInformation.tr(),
            style: AppStyles.blueDark14Bold,
          ),
          Gap(16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.9,
            ),
            itemCount: entries.length,
            itemBuilder: (context, index) => _buildInfoItem(
              name: entries[index].key,
              value: entries[index].value,
            ),
          ),
        ],
      ),
    );
  }

  /// Flattens the raw payload (plus `additionalDetails`) into label/value pairs,
  /// keeping the order the API sent them in.
  List<MapEntry<String, String>> _buildEntries(BuildContext context) {
    final isArabic = context.isArabic;
    final raw = data;
    if (raw == null) return const [];

    final flat = <String, dynamic>{};
    raw.forEach((key, value) {
      if (key == 'additionalDetails') {
        if (value is Map) {
          value.forEach((k, v) => flat['$k'] = v);
        }
      } else {
        flat[key] = value;
      }
    });

    final entries = <MapEntry<String, String>>[];
    flat.forEach((key, value) {
      if (_hiddenKeys.contains(key)) return;
      final text = _formatValue(key, value, isArabic);
      if (text == null) return;
      entries.add(MapEntry(_labelOf(key, isArabic), text));
    });
    return entries;
  }

  String _labelOf(String key, bool isArabic) {
    final extra = _extraLabels[key];
    if (extra != null) return extra.value(isArabic);
    return ApFields.metaOf(key).label.value(isArabic);
  }

  /// Returns the display text, or `null` when the value is empty / zero and the
  /// field should be hidden altogether.
  String? _formatValue(String key, dynamic value, bool isArabic) {
    if (value == null) return null;

    if (value is bool) {
      return value ? (isArabic ? 'نعم' : 'Yes') : null;
    }

    if (value is Map) {
      final name = isArabic ? value['name_ar'] : value['name_en'];
      return _formatValue(key, name ?? value['name'], isArabic);
    }

    if (value is List) {
      final parts = value
          .map((e) => _formatValue(key, e, isArabic))
          .whereType<String>()
          .toList();
      return parts.isEmpty ? null : parts.join('، ');
    }

    if (value is num) {
      if (value == 0) return null;
      return _withCurrency(key, _formatNumber(value));
    }

    final text = value.toString().trim();
    if (text.isEmpty) return null;

    final asNumber = num.tryParse(text);
    if (asNumber != null) {
      if (asNumber == 0) return null;
      return _withCurrency(key, _formatNumber(asNumber));
    }

    // ISO timestamps -> plain date
    final date = DateTime.tryParse(text);
    if (date != null && text.length >= 10 && text.contains('-')) {
      return DateFormat('yyyy-MM-dd').format(date);
    }

    return ApOptions.label(text, isArabic);
  }

  String _withCurrency(String key, String number) =>
      _moneyKeys.contains(key) ? '$number ${LangKeys.egp.tr()}' : number;

  String _formatNumber(num value) {
    final isWhole = value % 1 == 0;
    return NumberFormat(isWhole ? '#,###' : '#,###.##', 'en').format(value);
  }

  Widget _buildInfoItem({required String name, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppStyles.blueDark14Bold,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            name,
            style: AppStyles.gray10Medium,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
