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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: DataTable2(
        headingRowColor: WidgetStateColor.resolveWith(
              (states) => AppColors.blueLight,
        ),
        headingTextStyle: AppStyles.primary14Medium,
        columnSpacing: 12.w,
        horizontalMargin: 12.w,
        dataRowHeight: 60.h,
        minWidth: 3200.w,
        columns: [
          DataColumn2(
            minWidth: 120.w,
            label: Row(
              children: [
                Checkbox(
                  value: selectAll,
                  activeColor: AppColors.primaryDark,
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
            return DataRow2(
              selected: selectedItems[index],
              color: WidgetStateColor.resolveWith(
                    (states) => selectedItems[index]
                    ? AppColors.blueLight.withValues(alpha: 0.3)
                    : Colors.transparent,
              ),
              cells: [
                DataCell(
                  Checkbox(
                    value: selectedItems[index],
                    activeColor: AppColors.primaryDark,
                    onChanged: (value) {
                      toggleSelection(index);
                    },
                  ),
                ),
                DataCell(Text(item.type ?? 'Ad ${index + 1}')),
                DataCell(Text(item.city?.nameEn ?? item.city?.nameAr ?? '')),
                DataCell(Text(item.area?.nameEn ?? item.area?.nameAr ?? '')),
                DataCell(Text(item.unitOperation ?? '')),
                DataCell(Text(item.detailedAddress ?? '')),
                DataCell(Text(item.floor ?? '')),
                DataCell(Text(item.view ?? '')),
                DataCell(Text(item.unitArea != null ? '${item.unitArea} m\u00B2' : '')),
                DataCell(Text('${item.numberOfRooms ?? 0}')),
                DataCell(Text(item.otherAccessories?.join(', ') ?? '')),
                DataCell(Text(
                  item.totalPriceInCash != null
                      ? '\$${item.totalPriceInCash}'
                      : item.totalPriceInInstallment != null
                      ? '\$${item.totalPriceInInstallment}'
                      : item.monthlyRent != null
                      ? '\$${item.monthlyRent}'
                      : '\$${item.dailyRent ?? 0}',
                )),
                DataCell(
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: item.status == 'active'
                          ? Colors.green.withValues(alpha: 0.2)
                          : item.status == 'pending'
                          ? Colors.orange.withValues(alpha: 0.2)
                          : Colors.red.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      item.status?.tr() ?? LangKeys.inactive.tr(),
                      style: TextStyle(
                        color: item.status == 'active'
                            ? Colors.green
                            : item.status == 'pending'
                            ? Colors.orange
                            : Colors.red,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}