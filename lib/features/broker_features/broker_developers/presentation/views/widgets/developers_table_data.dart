import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DevelopersTableData extends StatelessWidget {
  const DevelopersTableData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: DataTable2(
        columnSpacing: 12.w,
        horizontalMargin: 12.w,
        dataRowHeight: 60.h,
        minWidth: 1000.w,
        columns: [
          DataColumn2(
            label: Text(LangKeys.developer.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.emailAddress.tr()),
            size: ColumnSize.L,
            fixedWidth: 200.w,
          ),
          DataColumn2(
            label: Text(LangKeys.phoneNumber.tr()),
            size: ColumnSize.L,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(LangKeys.projects.tr()),
            size: ColumnSize.L,
            fixedWidth: 80.w,
          ),
          DataColumn2(
            label: Text(LangKeys.status.tr()),
            size: ColumnSize.L,
            fixedWidth: 80.w,
          ),
          DataColumn2(
            label: Text(LangKeys.procedures.tr()),
            size: ColumnSize.L,
            fixedWidth: 80.w,
          ),
        ],
        rows: List<DataRow>.generate(
          11,
          (index) => DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    CustomNetWorkImage(
                      imageUrl:
                          "https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg",
                      raduis: 50,
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.cover,
                    ),
                    Gap(4.w),
                    Text("mostafa"),
                  ],
                ),
              ),
              DataCell(Text("mostafa.bahr@gmail.com")),
              DataCell(Text("01110690299")),
              DataCell(Center(child: Text("5"))),
              DataCell(Text('done')),
              DataCell(
                Center(
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    color: AppColors.blueLight,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(SvgImages.eye),
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
