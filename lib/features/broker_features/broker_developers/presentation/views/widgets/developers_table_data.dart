import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DevelopersTableData extends StatelessWidget {
  const DevelopersTableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(16.r),
      child: DataTable2(
          columnSpacing: 12.w,
          horizontalMargin: 12.w,
          minWidth: 800.w,
          columns: [
            DataColumn2(
              label: Text(LangKeys.developerName.tr()),
              size: ColumnSize.L,
              fixedWidth:100.w ,
            ),
            DataColumn2(
              label: Text(LangKeys.emailAddress.tr()),
              size: ColumnSize.L,
              fixedWidth:100.w ,
            ),
            DataColumn2(
              label: Text(LangKeys.phoneNumber.tr()),
              size: ColumnSize.L,
              fixedWidth:100.w ,
            ),
            DataColumn2(
              label: Text(LangKeys.numberOfProjects.tr()),
              size: ColumnSize.L,
              fixedWidth:100.w ,
            ),
            DataColumn2(
              label: Text(LangKeys.projects.tr()),
              size: ColumnSize.L,
              fixedWidth:100.w ,
            ),
            DataColumn2(
              label: Text(LangKeys.status.tr()),
              size: ColumnSize.L,
              fixedWidth:100.w ,
            ),
            DataColumn2(
              label: Text(LangKeys.procedures.tr()),
              size: ColumnSize.L,
              fixedWidth:100.w ,
            ),
          ],
          rows: List<DataRow>.generate(
              1,
                  (index) => DataRow(cells: [
                DataCell(Text('A' * (10 - index % 10))),
                DataCell(Text('A' * (10 - index % 10))),
                DataCell(Text('A' * (10 - index % 10))),
                DataCell(Text('A' * (10 - index % 10))),
                DataCell(Text('A' * (10 - index % 10))),
                DataCell(Text('A' * (10 - index % 10))),
                DataCell(Text(((index + 0.1) * 25.4).toString()))
              ]))),
    );
  }
}