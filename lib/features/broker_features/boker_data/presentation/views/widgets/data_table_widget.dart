import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
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

  DataColumn2 _col(String label, double width) {
    return DataColumn2(
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Text(label, style: AppStyles.black14SemiBold, textAlign: TextAlign.center),
      ),
      fixedWidth: width.w,
    );
  }

  Widget _cell(String text, {double fontSize = 10}) {
    return Text(text, style: AppStyles.black12Medium.copyWith(fontSize: fontSize.sp));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Card(
        elevation: 2,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: DataTable2(
          columnSpacing: 2.w,
          horizontalMargin: 6.w,
          minWidth: 4200.w,
          dataRowHeight: 56.h,
          headingRowHeight: 48.h,
          headingRowDecoration: BoxDecoration(
            color: AppColors.grayLight.withValues(alpha: 0.3),
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
          ),
          columns: [
            _col(LangKeys.ownerName.tr(), 90),
            _col(LangKeys.phoneNumber.tr(), 90),
            _col(LangKeys.compoundType.tr(), 100),
            _col(LangKeys.transactionType.tr(), 110),
            _col(LangKeys.unitType.tr(), 90),
            _col(LangKeys.subUnitType.tr(), 100),
            _col(LangKeys.city.tr(), 80),
            _col(LangKeys.area.tr(), 80),
            _col(LangKeys.address.tr(), 130),
            _col(LangKeys.locationLink.tr(), 100),
            _col(LangKeys.propertyNumber.tr(), 90),
            _col(LangKeys.unitNumber.tr(), 80),
            _col(LangKeys.floor.tr(), 60),
            _col(LangKeys.unitArea.tr(), 90),
            _col(LangKeys.numberOfRooms.tr(), 80),
            _col(LangKeys.bathrooms.tr(), 80),
            _col(LangKeys.theView.tr(), 90),
            _col(LangKeys.finishingCondition.tr(), 100),
            _col(LangKeys.unitLocationFromTheFront.tr(), 120),
            _col(LangKeys.deliveryStatus.tr(), 100),
            _col(LangKeys.paymentSystem.tr(), 100),
            _col(LangKeys.requiredInsurance.tr(), 110),
            _col(LangKeys.requiredInsuranceValue.tr(), 110),
            _col(LangKeys.dailyRent.tr(), 80),
            _col(LangKeys.otherLuxuries.tr(), 130),
            _col(LangKeys.otherExpenses.tr(), 100),
            _col(LangKeys.notes.tr(), 120),
            _col(LangKeys.unitDiagram.tr(), 80),
            _col(LangKeys.status.tr(), 80),
            _col(LangKeys.procedures.tr(), 100),
          ],
          rows: List<DataRow>.generate(
            data.length,
            (index) {
              var item = data[index];
              return DataRow(
                color: index.isEven
                    ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.05))
                    : null,
                cells: [
                  DataCell(_cell(item.ownerName ?? '—')),
                  DataCell(_cell(item.ownerPhone ?? '—')),
                  DataCell(_cell(BrokerTextHelper.projectTypeText(item.compoundType ?? '—'))),
                  DataCell(_cell(BrokerTextHelper.projectTypeText(item.unitOperation ?? '—'))),
                  DataCell(_cell(item.type ?? '—')),
                  DataCell(_cell('—')),
                  DataCell(_cell(item.city ?? '—')),
                  DataCell(_cell(item.area ?? '—')),
                  DataCell(_cell(item.detailedAddress ?? '—')),
                  DataCell(_cell(item.location ?? '—')),
                  DataCell(_cell(item.buildingNumber ?? '—')),
                  DataCell(_cell(item.unitNumber ?? '—')),
                  DataCell(_cell(item.floor ?? '—')),
                  DataCell(_cell(item.unitArea?.toString() ?? '—')),
                  DataCell(_cell(item.numberOfRooms?.toString() ?? '—')),
                  DataCell(_cell(item.numberOfBathrooms?.toString() ?? '—')),
                  DataCell(_cell(item.view ?? '—')),
                  DataCell(_cell(item.finishingType ?? '—')),
                  DataCell(_cell('—')),
                  DataCell(_cell(item.deliveryStatus ?? '—')),
                  DataCell(_cell('—')),
                  DataCell(_cell('—')),
                  DataCell(_cell('—')),
                  DataCell(_cell(item.dailyRent ?? '—')),
                  DataCell(_cell(item.otherAccessories?.join(' , ') ?? '—')),
                  DataCell(_cell('—')),
                  DataCell(_cell(item.notes ?? '—')),
                  DataCell(
                    Center(
                      child: item.diagram != null && item.diagram!.isNotEmpty
                          ? InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDark.withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Icon(Icons.file_copy, size: 16.h, color: AppColors.primaryDark),
                              ),
                            )
                          : _cell('—'),
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        item.status ?? '—',
                        style: AppStyles.black12Medium.copyWith(fontSize: 10.sp, color: AppColors.primaryDark),
                      ),
                    ),
                  ),
                  DataCell(
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_horiz, color: AppColors.primaryDark),
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
                              const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                              SizedBox(width: 8.w),
                              Text(LangKeys.delete.tr(), style: const TextStyle(color: Colors.red)),
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
      ),
    );
  }
}