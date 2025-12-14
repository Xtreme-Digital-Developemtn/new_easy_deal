import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key});

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
        minWidth: 3000.w,
        columns: [
          DataColumn2(
            label: Text(LangKeys.ownerName.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.phoneNumber.tr()),
            size: ColumnSize.L,
            fixedWidth: 120.w,
          ),
          DataColumn2(
            label: Text(LangKeys.compoundType.tr()),
            size: ColumnSize.L,
            fixedWidth: 120.w,
          ),
          DataColumn2(
            label: Text(LangKeys.transactionType.tr()),
            size: ColumnSize.L,
            fixedWidth: 120.w,
          ),
          DataColumn2(
            label: Text(LangKeys.unitType.tr()),
            size: ColumnSize.L,
            fixedWidth: 80.w,
          ),
          DataColumn2(
            label: Text(LangKeys.city.tr()),
            size: ColumnSize.L,
            fixedWidth: 80.w,
          ),
          DataColumn2(
            label: Text(LangKeys.area.tr()),
            size: ColumnSize.L,
            fixedWidth: 80.w,
          ),
          DataColumn2(
            label: Text(LangKeys.address.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.location.tr()),
            size: ColumnSize.L,
            fixedWidth: 80.w,
          ),
          DataColumn2(
            label: Text(LangKeys.otherLuxuries.tr()),
            size: ColumnSize.L,
            fixedWidth: 200.w,
          ),
          DataColumn2(
            label: Text(LangKeys.notes.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.description.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.unitDiagram.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.status.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.procedures.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
        ],
        rows: List<DataRow>.generate(
          1,
              (index) => DataRow(
            cells: [
              DataCell(Text("mostafa")),
              DataCell(Text("01110690299")),
              DataCell(Text("خارج الكمبوند")),
              DataCell(Text('rent')),
              DataCell(Text('float')),
              DataCell(Text('city')),
              DataCell(Text('area')),
              DataCell(Text('address')),
              DataCell(Text('location')),
              DataCell(Text('thing 1 , thing 2')),
              DataCell(Text('notes')),
              DataCell(Text('description')),
              DataCell(Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.file_copy,color: AppColors.primaryDark,),
                    Text(LangKeys.show.tr(),style: TextStyle(
                      color: AppColors.primaryDark
                    )),
                  ],
                ),
              )),
              DataCell(Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text("status",style: TextStyle(
                    color: AppColors.primaryDark
                )),
              )),
              DataCell(IconButton(icon: Icon(Icons.more_horiz),onPressed: (){

              },)),
            ],
          ),
        ),
      ),
    );
  }
}
