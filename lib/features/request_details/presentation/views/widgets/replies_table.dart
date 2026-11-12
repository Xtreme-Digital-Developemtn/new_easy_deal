import 'package:easy_deal/features/add_property/data/config/ap_options.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/recommended_model.dart';
import 'package:easy_deal/features/request_details/data/models/replies_model.dart';
import 'package:easy_deal/features/request_details/data/models/sent_responses_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/recommended_unit_sheet.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/reply_table_header.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/reply_table_row.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

/// `full_finished` / `superLux` وغيرها بترجع من الـ API كـ enum إنجليزي.
String _finishingText(BuildContext context, dynamic finishingType) {
  final raw = finishingType?.toString();
  if (raw == null || raw.isEmpty) return '-';
  return ApOptions.label(raw, context.isArabic);
}

class RepliesTable extends StatelessWidget {
  const RepliesTable({
    super.key,
    required this.items,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.onLoadMore,
  });

  final List<SentResponseItem> items;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;

  String _cityName(BuildContext context, SentResponseItem item) {
    final city = item.city;
    if (city == null) return '-';
    if (context.isArabic) {
      return city.nameAr?.isNotEmpty == true ? city.nameAr! : (city.nameEn ?? '-');
    }
    return city.nameEn?.isNotEmpty == true ? city.nameEn! : (city.nameAr ?? '-');
  }

  /// Derived from the shared column widths - no dead space on the right.
  static const double kTableWidth = ReplyTableColumns.tableWidth;

  /// Fills the screen when it is wider than the columns need, otherwise
  /// keeps its natural width and scrolls horizontally.
  static double _tableWidth(BuildContext context) {
    // الصفحة بتحط padding بـ16.w من كل جهة
    final available = MediaQuery.sizeOf(context).width - 32.w;
    return available > kTableWidth ? available : kTableWidth;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildTable({required List<Widget> rows}) {
      return Container(
        width: _tableWidth(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffD8E1FF)),
        ),
        child: Column(children: rows),
      );
    }

    if (items.isEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: buildTable(rows: [
          const ReplyTableHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Icon(Icons.inbox_outlined, size: 40, color: Colors.grey.shade400),
                const SizedBox(height: 8),
                Text(
                  LangKeys.noSentRepliesYet.tr(),
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ]),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: buildTable(rows: [
        const ReplyTableHeader(),
        ...List.generate(items.length, (index) {
          final item = items[index];
          return ReplyTableRow(
            index: index + 1,
            unitCode: item.displayUnitCode,
            area: DisplayValue.text(item.unitArea) ?? '-',
            city: _cityName(context, item),
            broker: item.displayBrokerName,
            finishing: _finishingText(context, item.finishingType),
          );
        }),
        if (hasMore || isLoadingMore)
          Container(
            height: 64,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xffE4E8F2))),
            ),
            child: Center(
              child: isLoadingMore
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : TextButton(
                      onPressed: onLoadMore,
                      child: Text(LangKeys.loadMore.tr()),
                    ),
            ),
          ),
      ]),
    );
  }
}

/// Table for `request/replies` endpoint - يعرض نفس شكل الجدول بنفس الباجينيشن
/// URL: /request/replies?limit=10&offset=0&sort=desc&sortBy=id&requestId=496&brokerId=1
class RepliesModelTable extends StatelessWidget {
  const RepliesModelTable({
    super.key,
    required this.replies,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.onLoadMore,
  });

  final List<ReplyData> replies;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;

  String _cityName(BuildContext context, Units unit) {
    final city = unit.city;
    if (city == null) return '-';
    final nameAr = city.nameAr?.toString();
    final nameEn = city.nameEn?.toString();
    if (context.isArabic) {
      return (nameAr != null && nameAr.isNotEmpty) ? nameAr : (nameEn ?? '-');
    }
    return (nameEn != null && nameEn.isNotEmpty) ? nameEn : (nameAr ?? '-');
  }

  @override
  Widget build(BuildContext context) {
    final flatRows = <Map<String, dynamic>>[];
    for (final reply in replies) {
      final units = reply.units ?? [];
      if (units.isEmpty) {
        flatRows.add({'unit': null, 'broker': reply.brokerName ?? '-', 'reply': reply});
      } else {
        for (final u in units) {
          flatRows.add({'unit': u, 'broker': reply.brokerName ?? '-', 'reply': reply});
        }
      }
    }

    Widget buildTable({required List<Widget> rows}) {
      return Container(
        width: RepliesTable._tableWidth(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffD8E1FF)),
        ),
        child: Column(children: rows),
      );
    }

    if (flatRows.isEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: buildTable(rows: [
          const ReplyTableHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Icon(Icons.inbox_outlined, size: 40, color: Colors.grey.shade400),
                const SizedBox(height: 8),
                Text(LangKeys.noRepliesYet.tr(), style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ]),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: buildTable(rows: [
        const ReplyTableHeader(),
        ...List.generate(flatRows.length, (index) {
          final row = flatRows[index];
          final Units? unit = row['unit'] as Units?;
          final String broker = row['broker'] as String;
          return ReplyTableRow(
            index: index + 1,
            unitCode: DisplayValue.firstValid([unit?.modelCode, unit?.id]) ?? '-',
            area: DisplayValue.text(unit?.unitArea) ?? '-',
            city: unit != null ? _cityName(context, unit) : '-',
            broker: broker,
            finishing: _finishingText(context, unit?.finishingType),
          );
        }),
        if (hasMore || isLoadingMore)
          Container(
            height: 64,
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xffE4E8F2)))),
            child: Center(
              child: isLoadingMore
                  ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))
                  : TextButton(onPressed: onLoadMore, child: Text(LangKeys.loadMore.tr())),
            ),
          ),
      ]),
    );
  }
}

/// Table for `requests/recommend/units/{requestId}/{brokerId}` - تاب توصيات
class RecommendedTable extends StatelessWidget {
  const RecommendedTable({
    super.key,
    required this.items,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.onLoadMore,
  });

  final List<RecommendedData> items;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;

  String _cityName(BuildContext context, RecommendedData item) {
    final city = item.city;
    if (city == null) return '-';
    final nameAr = city.nameAr?.toString();
    final nameEn = city.nameEn?.toString();
    if (context.isArabic) {
      return (nameAr != null && nameAr.isNotEmpty) ? nameAr : (nameEn ?? '-');
    }
    return (nameEn != null && nameEn.isNotEmpty) ? nameEn : (nameAr ?? '-');
  }

  @override
  Widget build(BuildContext context) {
    Widget buildTable({required List<Widget> rows}) {
      return Container(
        width: RepliesTable._tableWidth(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffD8E1FF)),
        ),
        child: Column(children: rows),
      );
    }

    if (items.isEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: buildTable(rows: [
          const ReplyTableHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Icon(Icons.star_border, size: 40, color: Colors.grey.shade400),
                const SizedBox(height: 8),
                Text(LangKeys.noRecommendationsYet.tr(), style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ]),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: buildTable(rows: [
        const ReplyTableHeader(),
        ...List.generate(items.length, (index) {
          final item = items[index];
          return ReplyTableRow(
            index: index + 1,
            unitCode: item.displayUnitCode,
            area: DisplayValue.text(item.unitArea) ?? '-',
            city: _cityName(context, item),
            broker: item.displayBrokerName,
            finishing: _finishingText(context, item.finishingType),
            finishingRaw: item.finishingType,
            // "رؤية" بتفتح شيت بباقي تفاصيل الوحدة
            onView: () => RecommendedUnitSheet.show(context, item),
          );
        }),
        if (hasMore || isLoadingMore)
          Container(
            height: 64,
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xffE4E8F2)))),
            child: Center(
              child: isLoadingMore
                  ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))
                  : TextButton(onPressed: onLoadMore, child: Text(LangKeys.loadMore.tr())),
            ),
          ),
      ]),
    );
  }
}
