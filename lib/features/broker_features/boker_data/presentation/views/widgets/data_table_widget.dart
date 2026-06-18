import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DataTableWidget extends StatelessWidget {
  final List<BrokerUnitData> data;
  const DataTableWidget({super.key, required this.data});

  void _showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LangKeys.notifications.tr()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LangKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(String value, BuildContext context) {
    switch (value) {
      case 'view':
        _showMessage(context, LangKeys.viewingDetails.tr());
        break;
      case 'edit':
        _showMessage(context, LangKeys.editingItem.tr());
        break;
      case 'status':
        _showMessage(context, LangKeys.changingStatus.tr());
        break;
      case 'delete':
        _showDeleteConfirmation(context);
        break;
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LangKeys.deleteConfirmation.tr()),
          content: Text(LangKeys.deleteConfirmationMessage.tr()),
          actions: <Widget>[
            TextButton(
              child: Text(LangKeys.cancel.tr()),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                LangKeys.delete.tr(),
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(LangKeys.itemDeleted.tr()),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
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
          data.length,
          (index) {
            var item = data[index];
            return DataRow(
              cells: [
                DataCell(Text(item.ownerName ?? '')),
                DataCell(Text(item.ownerPhone ?? '')),
                DataCell(Text(item.compoundType ?? '')),
                DataCell(Text(item.unitOperation ?? '')),
                DataCell(Text(item.type ?? '')),
                DataCell(Text(item.city ?? '')),
                DataCell(Text(item.area ?? '')),
                DataCell(Text(item.detailedAddress ?? '')),
                DataCell(Text(item.location ?? '')),
                DataCell(Text(item.otherAccessories?.join(' , ') ?? '')),
                DataCell(Text(item.notes ?? '')),
                DataCell(Text(item.description ?? '')),
                DataCell(
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.blueLight,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.file_copy, color: AppColors.primaryDark),
                        Text(
                          LangKeys.show.tr(),
                          style: TextStyle(color: AppColors.primaryDark),
                        ),
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.blueLight,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      item.status ?? '',
                      style: TextStyle(color: AppColors.primaryDark),
                    ),
                  ),
                ),
                DataCell(
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_horiz),
                    onSelected: (value) => _handleMenuAction(value, context),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'view',
                        child: Row(
                          children: [
                            const Icon(Icons.visibility_outlined, size: 20),
                            SizedBox(width: 8.w),
                            Text(LangKeys.viewDetails.tr()),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'edit',
                        child: Row(
                          children: [
                            const Icon(Icons.edit_outlined, size: 20),
                            SizedBox(width: 8.w),
                            Text(LangKeys.edit.tr()),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'status',
                        child: Row(
                          children: [
                            const Icon(Icons.change_circle_outlined, size: 20),
                            SizedBox(width: 8.w),
                            Text(LangKeys.changeStatus.tr()),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              LangKeys.delete.tr(),
                              style: const TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
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