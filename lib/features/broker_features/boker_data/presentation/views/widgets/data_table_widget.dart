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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
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
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
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

  String _val(String? value) {
    return (value != null && value.isNotEmpty) ? value : LangKeys.notAvailable.tr();
  }

  Widget _cell(String text, {double fontSize = 10}) {
    return Text(text, style: AppStyles.black12Medium.copyWith(fontSize: fontSize.sp));
  }

  // لون مناسب لكل حالة، ولو الحالة مش معروفة بيرجع اللون الأساسي
  Color _statusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
      case 'available':
      case 'sold':
        return Colors.green;
      case 'pending':
      case 'reserved':
        return Colors.orange;
      case 'inactive':
      case 'rejected':
      case 'cancelled':
        return Colors.red;
      default:
        return AppColors.primaryDark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
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
          columnSpacing: 2.w,
          horizontalMargin: 6.w,
          minWidth: 4200.w,
          dataRowHeight: 58.h,
          headingRowHeight: 50.h,
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
          headingRowDecoration: BoxDecoration(
            color: AppColors.blueLight.withValues(alpha: 0.35),
          ),
          dataRowColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.blueLight.withValues(alpha: 0.12);
            }
            return Colors.transparent;
          }),
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
              final statusColor = _statusColor(item.status);

              return DataRow(
                color: index.isEven
                    ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.05))
                    : null,
                cells: [
                  DataCell(_cell(_val(item.ownerName))),
                  DataCell(_cell(_val(item.ownerPhone))),
                  DataCell(_cell(_val(BrokerTextHelper.projectTypeText(item.compoundType ?? '')))),
                  DataCell(_cell(_val(BrokerTextHelper.projectTypeText(item.unitOperation ?? '')))),
                  DataCell(_cell(_val(item.type))),
                  DataCell(_cell(LangKeys.notAvailable.tr())),
                  DataCell(_cell(_val(item.city))),
                  DataCell(_cell(_val(item.area))),
                  DataCell(_cell(_val(item.detailedAddress))),
                  DataCell(_cell(_val(item.location))),
                  DataCell(_cell(_val(item.buildingNumber))),
                  DataCell(_cell(_val(item.unitNumber))),
                  DataCell(_cell(_val(item.floor))),
                  DataCell(_cell(_val(item.unitArea?.toString()))),
                  DataCell(_cell(_val(item.numberOfRooms?.toString()))),
                  DataCell(_cell(_val(item.numberOfBathrooms?.toString()))),
                  DataCell(_cell(_val(item.view))),
                  DataCell(_cell(_val(item.finishingType))),
                  DataCell(_cell(LangKeys.notAvailable.tr())),
                  DataCell(_cell(_val(item.deliveryStatus))),
                  DataCell(_cell(LangKeys.notAvailable.tr())),
                  DataCell(_cell(LangKeys.notAvailable.tr())),
                  DataCell(_cell(LangKeys.notAvailable.tr())),
                  DataCell(_cell(_val(item.dailyRent))),
                  DataCell(_cell(_val(item.otherAccessories?.join(' , ')))),
                  DataCell(_cell(LangKeys.notAvailable.tr())),
                  DataCell(_cell(_val(item.notes))),
                  DataCell(
                    Center(
                      child: item.diagram != null && item.diagram!.isNotEmpty
                          ? _AnimatedIconButton(
                        icon: Icons.file_copy,
                        color: AppColors.primaryDark,
                        onTap: () {},
                      )
                          : _cell(LangKeys.notAvailable.tr()),
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7.w,
                            height: 7.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: statusColor,
                            ),
                          ),
                          Gap(5.w),
                          Text(
                            _val(item.status),
                            style: AppStyles.black12Medium.copyWith(
                              fontSize: 10.sp,
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    _HoverMenuButton(
                      color: AppColors.primaryDark,
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

/// زرار أيقونة بسيط بأنيميشن hover/press (يستخدم مع onTap عادي، زي أيقونة الدياجرام)
class _AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final BoxShape shape;

  const _AnimatedIconButton({
    required this.icon,
    required this.color,
    this.onTap,
    this.shape = BoxShape.circle,
  });

  @override
  State<_AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<_AnimatedIconButton> {
  bool _hovering = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _pressed ? 0.88 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: widget.color.withValues(alpha: _hovering ? 0.16 : 0.08),
              shape: widget.shape,
              borderRadius: widget.shape == BoxShape.rectangle ? BorderRadius.circular(6.r) : null,
            ),
            child: Icon(widget.icon, size: 16.h, color: widget.color),
          ),
        ),
      ),
    );
  }
}

/// نفس فكرة الـ hover/press لكن ملفوفة حوالين PopupMenuButton الحقيقي
/// (بنستخدم PopupMenuButton نفسه كـ child عشان نضمن إن القائمة تفتح صح
/// من غير ما نكرر الـ widget أو نلعب بـ Stack معقدة).
class _HoverMenuButton extends StatefulWidget {
  final Color color;
  final void Function(String value) onSelected;
  final List<PopupMenuEntry<String>> Function(BuildContext context) itemBuilder;

  const _HoverMenuButton({
    required this.color,
    required this.onSelected,
    required this.itemBuilder,
  });

  @override
  State<_HoverMenuButton> createState() => _HoverMenuButtonState();
}

class _HoverMenuButtonState extends State<_HoverMenuButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.color.withValues(alpha: _hovering ? 0.12 : 0.0),
          shape: BoxShape.circle,
        ),
        child: PopupMenuButton<String>(
          icon: Icon(Icons.more_horiz, color: widget.color),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          onSelected: widget.onSelected,
          itemBuilder: widget.itemBuilder,
        ),
      ),
    );
  }
}