import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_ads/data/models/advertisement_shuffle_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AdsTableWidget extends StatefulWidget {
  final List<Data> data;
  const AdsTableWidget({super.key, required this.data});

  @override
  State<AdsTableWidget> createState() => _AdsTableWidgetState();
}

class _AdsTableWidgetState extends State<AdsTableWidget> {
  List<bool> selectedItems = [];
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    selectedItems = List.generate(widget.data.length, (index) => false);
  }

  @override
  void didUpdateWidget(AdsTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.length != widget.data.length) {
      selectedItems = List.generate(widget.data.length, (index) => false);
      selectAll = false;
    }
  }

  void toggleSelection(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
      selectAll = selectedItems.every((item) => item);
    });
  }

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      selectedItems = List.generate(selectedItems.length, (index) => selectAll);
    });
  }

  // ألوان وأيقونات الحالة في مكان واحد عشان تتحكم فيها بسهولة
  Color _statusColor(String? status) {
    switch (status) {
      case 'active':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: DataTable2(
          headingRowColor: WidgetStateColor.resolveWith(
                (states) => AppColors.blueLight,
          ),
          headingRowHeight: 54.h,
          headingTextStyle: AppStyles.primary14Medium.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
            verticalInside: BorderSide(
              color: Colors.grey.shade100,
              width: 1,
            ),
          ),
          columnSpacing: 12.w,
          horizontalMargin: 12.w,
          dataRowHeight: 64.h,
          minWidth: 3200.w,
          columns: [
            DataColumn2(
              minWidth: 120.w,
              label: Row(
                children: [
                  Checkbox(
                    value: selectAll,
                    activeColor: AppColors.primaryDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    onChanged: (value) {
                      toggleSelectAll();
                    },
                  ),
                  SizedBox(width: 4.w),
                  Text(LangKeys.selectAll.tr()),
                ],
              ),
              size: ColumnSize.S,
              fixedWidth: 100.w,
            ),
            DataColumn2(
              label: Text(LangKeys.adTitle.tr()),
              size: ColumnSize.L,
              fixedWidth: 100.w,
            ),
            DataColumn2(
              label: Text(LangKeys.city.tr()),
              size: ColumnSize.L,
              fixedWidth: 120.w,
            ),
            DataColumn2(
              label: Text(LangKeys.area.tr()),
              size: ColumnSize.L,
              fixedWidth: 120.w,
            ),
            DataColumn2(
              label: Text(LangKeys.purpose.tr()),
              size: ColumnSize.L,
              fixedWidth: 120.w,
            ),
            DataColumn2(
              label: Text(LangKeys.location.tr()),
              size: ColumnSize.L,
              fixedWidth: 80.w,
            ),
            DataColumn2(
              label: Text(LangKeys.floor.tr()),
              size: ColumnSize.L,
              fixedWidth: 80.w,
            ),
            DataColumn2(
              label: Text(LangKeys.view.tr()),
              size: ColumnSize.L,
              fixedWidth: 80.w,
            ),
            DataColumn2(
              label: Text(LangKeys.size.tr()),
              size: ColumnSize.L,
              fixedWidth: 100.w,
            ),
            DataColumn2(
              label: Text(LangKeys.rooms.tr()),
              size: ColumnSize.L,
              fixedWidth: 80.w,
            ),
            DataColumn2(
              label: Text(LangKeys.pathRooms.tr()),
              size: ColumnSize.L,
              fixedWidth: 200.w,
            ),
            DataColumn2(
              label: Text(LangKeys.myPrice.tr()),
              size: ColumnSize.L,
              fixedWidth: 100.w,
            ),
            DataColumn2(
              label: Text(LangKeys.status.tr()),
              size: ColumnSize.L,
              fixedWidth: 100.w,
            ),
          ],

          rows: List<DataRow2>.generate(
            widget.data.length,
                (index) {
              var item = widget.data[index];
              final statusColor = _statusColor(item.status);

              return DataRow2(
                selected: selectedItems[index],
                specificRowHeight: 64.h,
                color: WidgetStateColor.resolveWith((states) {
                  if (selectedItems[index]) {
                    return AppColors.blueLight.withValues(alpha: 0.25);
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return AppColors.blueLight.withValues(alpha: 0.08);
                  }
                  return index.isEven ? Colors.white : Colors.grey.shade50;
                }),
                cells: [
                  DataCell(
                    Checkbox(
                      value: selectedItems[index],
                      activeColor: AppColors.primaryDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      onChanged: (value) {
                        toggleSelection(index);
                      },
                    ),
                  ),
                  DataCell(
                    Text(
                      item.type ?? 'Ad ${index + 1}',
                      style: AppStyles.black14Medium,
                    ),
                  ),
                  DataCell(Text(item.city?.nameEn ?? item.city?.nameAr ?? '')),
                  DataCell(Text(item.area?.nameEn ?? item.area?.nameAr ?? '')),
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColors.blueLight.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        item.unitOperation ?? '',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                  DataCell(Text(item.detailedAddress ?? '')),
                  DataCell(Text(item.floor ?? '')),
                  DataCell(Text(item.view ?? '')),
                  DataCell(Text(item.unitArea != null ? '${item.unitArea} m\u00B2' : '')),
                  DataCell(
                    Center(
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blueLight.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${item.numberOfRooms ?? 0}',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Text(item.otherAccessories?.join(', ') ?? '')),
                  DataCell(
                    Text(
                      item.totalPriceInCash != null
                          ? '\$${item.totalPriceInCash}'
                          : item.totalPriceInInstallment != null
                          ? '\$${item.totalPriceInInstallment}'
                          : item.monthlyRent != null
                          ? '\$${item.monthlyRent}'
                          : '\$${item.dailyRent ?? 0}',
                      style: AppStyles.black14Medium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                  DataCell(
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: statusColor,
                            ),
                          ),
                          Gap(6.w),
                          Text(
                            item.status?.tr() ?? LangKeys.inactive.tr(),
                            style: TextStyle(
                              color: statusColor.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}