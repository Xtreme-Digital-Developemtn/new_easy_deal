import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class ModelUnitsTableData extends StatelessWidget {
  final List<BrokerUnitData> data;
  const ModelUnitsTableData({super.key, required this.data});

  static final _headerStyle =
      AppStyles.black14SemiBold.copyWith(color: AppColors.primaryDark);

  DataColumn2 _col(String label, double width) {
    return DataColumn2(
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Text(label, style: _headerStyle, textAlign: TextAlign.center),
      ),
      fixedWidth: width.w,
    );
  }

  Widget _cell(String text) {
    return Text(
      text,
      style: AppStyles.black12Medium,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _chipCell(String text, {Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: (color ?? AppColors.primaryDark).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: AppStyles.black12Medium.copyWith(
          fontSize: 10.sp,
          color: color ?? AppColors.primaryDark,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _iconLinkCell(String? url) {
    if (url == null || url.isEmpty) {
      return Text(LangKeys.notAvailable.tr(), style: AppStyles.black12Medium);
    }
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.primaryDark.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Icon(Icons.map_rounded, size: 18.sp, color: AppColors.primaryDark),
      ),
    );
  }

  Widget _galleryCell(List<dynamic>? gallery) {
    final count = gallery?.length ?? 0;
    if (count == 0) {
      return Text(LangKeys.notAvailable.tr(), style: AppStyles.black12Medium);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.photo_library_rounded, size: 16.sp, color: AppColors.primaryDark),
        Gap(4.w),
        Text('$count', style: AppStyles.black12Medium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 16.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: DataTable2(
          showCheckboxColumn: false,
          columnSpacing: 4.w,
          horizontalMargin: 12.w,
          minWidth: 2600.w,
          dataRowHeight: 56.h,
          headingRowHeight: 48.h,
          headingTextStyle: _headerStyle,
          headingRowDecoration: BoxDecoration(
            color: AppColors.primaryDark.withValues(alpha: 0.08),
          ),
          dataRowColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.blueLight.withValues(alpha: 0.15);
            }
            return null;
          }),
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.grey.shade100, width: 1),
            verticalInside: BorderSide(color: Colors.grey.shade50, width: 0.5),
          ),
          columns: [
            _col(LangKeys.developerName.tr(), 140),
            _col(LangKeys.projectName.tr(), 140),
            _col(LangKeys.unitType.tr(), 110),
            _col(LangKeys.type.tr(), 110),
            _col(LangKeys.price.tr(), 130),
            _col(LangKeys.unitArea.tr(), 100),
            _col(LangKeys.area.tr(), 110),
            _col(LangKeys.subArea.tr(), 110),
            _col(LangKeys.galleryImages.tr(), 90),
            _col(LangKeys.deliveryStatus.tr(), 130),
            _col(LangKeys.googleMapsLink.tr(), 90),
            _col(LangKeys.notes.tr(), 160),
            _col(LangKeys.actions.tr(), 90),
          ],
          rows: List<DataRow>.generate(
            data.length,
            (index) {
              final item = data[index];
              final na = LangKeys.notAvailable.tr();
              final areaName = context.locale.languageCode == 'ar'
                  ? (item.area?.nameAr ?? na)
                  : (item.area?.nameEn ?? na);
              final subAreaName = context.locale.languageCode == 'ar'
                  ? (item.subArea?.nameAr ?? na)
                  : (item.subArea?.nameEn ?? na);

              return DataRow(
                color: index.isEven
                    ? WidgetStatePropertyAll(
                        AppColors.grayLight.withValues(alpha: 0.08))
                    : const WidgetStatePropertyAll(Colors.white),
                cells: [
                  // اسم المطور
                  DataCell(_chipCell(item.developerName ?? na)),
                  // اسم المشروع
                  DataCell(_cell(item.projectName ?? na)),
                  // نوع الوحدة
                  DataCell(_cell(item.type ?? na)),
                  // النوع (unitOperation)
                  DataCell(_cell(item.unitOperation ?? na)),
                  // السعر
                  DataCell(_cell(
                    item.totalPriceInCash != null && item.totalPriceInCash! > 0
                        ? '${item.totalPriceInCash} ${LangKeys.egp.tr()}'
                        : na,
                  )),
                  // المساحة
                  DataCell(_cell(
                    item.unitArea != null ? '${item.unitArea} m²' : na,
                  )),
                  // المنطقة
                  DataCell(_cell(areaName)),
                  // المنطقة الفرعية
                  DataCell(_cell(subAreaName)),
                  // المعرض
                  DataCell(_galleryCell(item.gallery)),
                  // تاريخ التسليم
                  DataCell(_cell(item.deliveryDate ?? na)),
                  // لوكيشن جوجل
                  DataCell(_iconLinkCell(item.location)),
                  // ملاحظات
                  DataCell(_cell(item.additionalDetails?.notes ?? na)),
                  // إجراءات
                  DataCell(_ActionsCell(item: item)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ─── Actions popup cell ────────────────────────────────────────────────────────

class _ActionsCell extends StatefulWidget {
  final BrokerUnitData item;
  const _ActionsCell({required this.item});

  @override
  State<_ActionsCell> createState() => _ActionsCellState();
}

class _ActionsCellState extends State<_ActionsCell> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: PopupMenuButton<String>(
        tooltip: '',
        onSelected: (value) {
          switch (value) {
            case 'view':
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${LangKeys.viewingDetails.tr()} #${widget.item.id}',
                  ),
                ),
              );
              break;
            case 'edit':
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${LangKeys.editingItem.tr()} #${widget.item.id}',
                  ),
                ),
              );
              break;
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 8,
        offset: const Offset(0, 4),
        color: Colors.white,
        icon: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            color: _hovering
                ? AppColors.primaryDark.withValues(alpha: 0.15)
                : AppColors.grayLight.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.more_vert_rounded,
            size: 20.sp,
            color: _hovering ? AppColors.primaryDark : Colors.grey.shade600,
          ),
        ),
        itemBuilder: (context) => [
          PopupMenuItem<String>(
            value: 'view',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(
                    Icons.visibility_rounded,
                    size: 16.sp,
                    color: AppColors.primaryDark,
                  ),
                ),
                Gap(10.w),
                Text(
                  LangKeys.viewDetails.tr(),
                  style: AppStyles.black14Medium.copyWith(fontSize: 13.sp),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'edit',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: 16.sp,
                    color: AppColors.primaryDark,
                  ),
                ),
                Gap(10.w),
                Text(
                  LangKeys.edit.tr(),
                  style: AppStyles.black14Medium.copyWith(fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
