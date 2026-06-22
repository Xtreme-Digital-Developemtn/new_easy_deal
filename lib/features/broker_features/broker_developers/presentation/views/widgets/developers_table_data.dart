import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/developers_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DevelopersTableData extends StatelessWidget {
  final List<DeveloperData> data;
  final void Function(int developerId)? onProceduresTap;
  const DevelopersTableData({super.key, required this.data, this.onProceduresTap});

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
          data.length,
          (index) {
            var item = data[index];
            return DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      if (item.image != null)
                        CustomNetWorkImage(
                          imageUrl: item.image!,
                          raduis: 50,
                          height: 30.h,
                          width: 30.w,
                          fit: BoxFit.cover,
                        )
                      else
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: AppColors.blueLight,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.person, size: 16.sp),
                        ),
                      Gap(4.w),
                      Expanded(
                        child: Text(
                          item.fullName ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                DataCell(Text(item.email ?? '')),
                DataCell(Text(item.phone ?? '')),
                DataCell(Center(child: Text('${item.numberOfProjects ?? 0}'))),
                DataCell(
                  Text(
                    item.isActive == true ? LangKeys.active.tr() : LangKeys.inactive.tr(),
                  ),
                ),
                DataCell(
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      color: AppColors.blueLight,
                      child: InkWell(
                        onTap: () => onProceduresTap?.call(item.developerId ?? 0),
                        child: SvgPicture.asset(SvgImages.eye),
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