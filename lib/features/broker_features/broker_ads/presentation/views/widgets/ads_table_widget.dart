import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class AdsTableWidget extends StatefulWidget {
  const AdsTableWidget({super.key});

  @override
  State<AdsTableWidget> createState() => _AdsTableWidgetState();
}

class _AdsTableWidgetState extends State<AdsTableWidget> {
  // قائمة لتتبع العناصر المحددة
  List<bool> selectedItems = [];
  // حالة زر "تحديد الكل"
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    // تهيئة البيانات المزيفة (10 عناصر)
    selectedItems = List.generate(10, (index) => false);
  }

  // دالة لتحديد/إلغاء تحديد عنصر معين
  void toggleSelection(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
      // تحديث حالة "تحديد الكل"
      selectAll = selectedItems.every((item) => item);
    });
  }

  // دالة لتحديد/إلغاء تحديد كل العناصر
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
          selectedItems.length,
              (index) => DataRow2(
            // هذه الخاصية هي التي تغير لون الصف عند التحديد
            selected: selectedItems[index],
            color: WidgetStateColor.resolveWith(
                  (states) => selectedItems[index]
                  ? AppColors.blueLight.withValues(alpha: 0.3)
                  : Colors.transparent,
            ),
            // onSelectChanged: (selected) {
            //   toggleSelection(index);
            // },
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
              DataCell(Text("Ad ${index + 1}")),
              DataCell(Text("City ${index + 1}")),
              DataCell(Text("Area ${index + 1}")),
              DataCell(Text(index % 2 == 0 ? 'rent' : 'sale')),
              DataCell(Text('Location ${index + 1}')),
              DataCell(Text('${index + 1}')),
              DataCell(Text('View ${index + 1}')),
              DataCell(Text('${100 + index * 10} m²')),
              DataCell(Text('${2 + index % 4}')),
              DataCell(Text('Thing 1, Thing 2')),
              DataCell(Text('\$${50000 + index * 10000}')),
              DataCell(
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: index % 3 == 0
                        ? Colors.green.withValues(alpha: 0.2)
                        : index % 3 == 1
                        ? Colors.orange.withValues(alpha: 0.2)
                        : Colors.red.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    index % 3 == 0
                        ? 'Active'
                        : index % 3 == 1
                        ? 'Pending'
                        : 'Inactive',
                    style: TextStyle(
                      color: index % 3 == 0
                          ? Colors.green
                          : index % 3 == 1
                          ? Colors.orange
                          : Colors.red,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}