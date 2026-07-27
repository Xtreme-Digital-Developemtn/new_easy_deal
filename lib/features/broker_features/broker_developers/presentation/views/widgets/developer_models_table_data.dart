import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/models_response.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DeveloperModelsTableData extends StatelessWidget {
  final List<ModelData> data;
  const DeveloperModelsTableData({super.key, required this.data});

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
    return Text(text, style: AppStyles.black12Medium);
  }

  Widget _chipCell(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(text, style: AppStyles.black12Medium.copyWith(fontSize: 10.sp)),
    );
  }

  static final _headerStyle = AppStyles.black14SemiBold.copyWith(color: AppColors.primaryDark);

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
          columnSpacing: 4.w,
          horizontalMargin: 12.w,
          minWidth: 2000.w,
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
            _col(LangKeys.modelCode.tr(), 120),
            _col(LangKeys.dateOfCreation.tr(), 100),
            _col(LangKeys.unitType.tr(), 110),
            _col(LangKeys.subUnitType.tr(), 110),
            _col(LangKeys.numberOfUnits.tr(), 100),
            _col(LangKeys.rooms.tr(), 80),
            _col(LangKeys.bathrooms.tr(), 90),
            _col(LangKeys.floors.tr(), 90),
            _col(LangKeys.unitArea.tr(), 100),
            _col(LangKeys.landingArea.tr(), 100),
          ],
          rows: List<DataRow>.generate(
            data.length,
            (index) {
              var item = data[index];
              return DataRow(
                color: index.isEven
                    ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.08))
                    : const WidgetStatePropertyAll(Colors.white),
                cells: [
                  DataCell(_chipCell(item.code)),
                  DataCell(_cell(item.createdAt.substring(0, 10))),
                  DataCell(_cell(item.unitType)),
                  DataCell(_cell(item.subUnitType ?? LangKeys.notAvailable.tr())),
                  DataCell(_cell(item.numberOfUnits.toString())),
                  DataCell(_cell(item.numberOfRooms.toString())),
                  DataCell(_cell(item.numberOfBathrooms.toString())),
                  DataCell(_cell(item.numberOfFloors.toString())),
                  DataCell(_cell('${item.unitArea} m²')),
                  DataCell(_cell('${item.landingArea} m²')),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}