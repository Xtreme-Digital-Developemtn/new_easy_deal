import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/developers_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopersTableData extends StatelessWidget {
  final List<DeveloperData> data;
  final void Function(int developerId)? onProceduresTap;
  final void Function(int developerId)? onSendContractRequest;

  const DevelopersTableData({
    super.key,
    required this.data,
    this.onProceduresTap,
    this.onSendContractRequest,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryDark,
                    AppColors.primaryDark.withValues(alpha: 0.85),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.people_alt_rounded,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                  Gap(10.w),
                  Text(
                    LangKeys.developers.tr(),
                    style: AppStyles.black14Medium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '${data.length} ${LangKeys.developers.tr()}',
                      style: AppStyles.black14Medium.copyWith(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: DataTable2(
                headingRowColor: WidgetStateProperty.all(
                  AppColors.blueLight.withValues(alpha: 0.2),
                ),
                headingRowHeight: 52.h,
                headingTextStyle: AppStyles.black14Medium.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                  letterSpacing: 0.3,
                  color: AppColors.primaryDark,
                ),
                dataRowColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.hovered)) {
                    return AppColors.blueLight.withValues(alpha: 0.15);
                  }
                  return null;
                }),
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: Colors.grey.shade100,
                    width: 1,
                  ),
                  verticalInside: BorderSide(
                    color: Colors.grey.shade50,
                    width: 0.5,
                  ),
                ),
                columnSpacing: 10.w,
                horizontalMargin: 16.w,
                dataRowHeight: 60.h,
                minWidth: 3000.w,
                columns: [
                  /// developer name key
                  DataColumn2(
                    label: _headerCell(LangKeys.developer.tr()),
                    size: ColumnSize.L,
                    fixedWidth: 180.w,
                  ),
                  /// developer email key
                  DataColumn2(
                    label: _headerCell(LangKeys.emailAddress.tr()),
                    size: ColumnSize.L,
                    fixedWidth: 200.w,
                  ),
                  /// developer phone key
                  DataColumn2(
                    label: _headerCell(LangKeys.phoneNumber.tr()),
                    size: ColumnSize.L,
                    fixedWidth: 130.w,
                  ),
                  /// developer projects key
                  DataColumn2(
                    label: _headerCell(LangKeys.projects.tr()),
                    size: ColumnSize.S,
                    fixedWidth: 80.w,
                  ),
                  /// developer status key
                  DataColumn2(
                    label: _headerCell(LangKeys.status.tr()),
                    size: ColumnSize.S,
                    fixedWidth: 150.w,
                  ),
                  /// developer procedures key
                  DataColumn2(
                    label: _headerCell(LangKeys.procedures.tr()),
                    size: ColumnSize.S,
                    fixedWidth: 100.w,
                  ),
                ],
                rows: List<DataRow>.generate(data.length, (index) {
                  var item = data[index];
                  // final isActive = item.isActive == true;
                  final status = item.brokers!.isEmpty ? "ارسال طلب عقد": "${item.brokers![0].status}";
                  final isEven = index.isEven;

                  return DataRow(
                    color: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.hovered)) {
                        return AppColors.blueLight.withValues(alpha: 0.12);
                      }
                      return isEven
                          ? Colors.white
                          : AppColors.grayLight.withValues(alpha: 0.06);
                    }),
                    cells: [
                      /// developer name value
                      DataCell(
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: status == "ارسال طلب عقد"
                                      ? AppColors.primaryDark.withValues(alpha: 0.3)
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              child: item.image != null
                                  ? ClipOval(
                                      child: CustomNetWorkImage(
                                        imageUrl: item.image!,
                                        raduis: 50,
                                        height: 32.h,
                                        width: 32.w,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 16.r,
                                      backgroundColor:status == "ارسال طلب عقد"
                                          ? AppColors.primaryDark.withValues(alpha:
                                              0.15,
                                            )
                                          : Colors.grey.shade200,
                                      child: Icon(
                                        Icons.person,
                                        size: 16.sp,
                                        color:status == "ارسال طلب عقد"
                                            ? AppColors.primaryDark
                                            : Colors.grey,
                                      ),
                                    ),
                            ),
                            Gap(10.w),
                            Expanded(
                              child: Text(
                                item.fullName ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppStyles.black14Medium.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /// developer email value
                      DataCell(
                        _chipCell(
                          item.email ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withValues(alpha: 0.08),
                          AppColors.primaryDark.withValues(alpha: 0.7),
                        ),
                      ),
                      /// developer phone value
                      DataCell(
                        _actionChipCell(
                          icon: Icons.phone_outlined,
                          label: item.phone ?? '',
                          onTap: item.phone != null && item.phone!.isNotEmpty
                              ? () async {
                                  final uri = Uri.parse('tel:${item.phone}');
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  }
                                }
                              : null,
                        ),
                      ),
                      /// developer projects value
                      DataCell(
                        Center(
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primaryDark.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              '${item.numberOfProjects ?? 0}',
                              style: AppStyles.black14Medium.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /// developer status value

                      DataCell(Center(
                        child: SizedBox(
                          width: 150.w,
                          child: _statusChip(status, developerId: item.developerId),
                        ),
                      )),
                      /// developer procedures value
                      DataCell(
                        _PopupMenuCell(
                          onProceduresTap: onProceduresTap,
                          item: item,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerCell(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Text(
        text,
        style: AppStyles.black14Medium.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 13.sp,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }

  Widget _chipCell(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppStyles.black14Medium.copyWith(
          color: textColor,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Widget _actionChipCell({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: onTap != null
              ? AppColors.primaryDark.withValues(alpha: 0.08)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20.r),
          border: onTap != null
              ? Border.all(color: AppColors.primaryDark.withValues(alpha: 0.2))
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14.sp,
              color: onTap != null ? AppColors.primaryDark : Colors.grey,
            ),
            Gap(6.w),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyles.black14Medium.copyWith(
                  color: onTap != null ? AppColors.primaryDark : Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _displayStatus(dynamic status) {
    if (status == "ارسال طلب عقد") return "ارسال طلب عقد";
    if (status == "pending") return "قيد الانتظار";
    if (status == "accepted") return "مقبول";
    return status?.toString() ?? '';
  }

  Color _statusBgColor(dynamic status) {
    if (status == "accepted") return Colors.green.withValues(alpha: 0.1);
    if (status == "pending") return Colors.orange.withValues(alpha: 0.1);
    if (status == "ارسال طلب عقد") return AppColors.primaryDark.withValues(alpha: 0.1);
    return Colors.grey.withValues(alpha: 0.1);
  }

  Color _statusDotColor(dynamic status) {
    if (status == "accepted") return Colors.green;
    if (status == "pending") return Colors.orange;
    if (status == "ارسال طلب عقد") return AppColors.primaryDark;
    return Colors.grey;
  }

  Color _statusTextColor(dynamic status) {
    if (status == "accepted") return Colors.green.shade700;
    if (status == "pending") return Colors.orange.shade700;
    if (status == "ارسال طلب عقد") return AppColors.primaryDark;
    return Colors.grey.shade700;
  }

  Widget _statusChip(dynamic status, {int? developerId}) {
    if (status == "ارسال طلب عقد") {
      return InkWell(
        onTap: onSendContractRequest != null && developerId != null
            ? () => onSendContractRequest!(developerId)
            : null,
        borderRadius: BorderRadius.circular(20.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryDark.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            _displayStatus(status),
            style: AppStyles.black14Medium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: _statusBgColor(status),
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
              color: _statusDotColor(status),
            ),
          ),
          Gap(6.w),
          Text(
            _displayStatus(status),
            style: AppStyles.black14Medium.copyWith(
              color: _statusTextColor(status),
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _PopupMenuCell extends StatefulWidget {
  final void Function(int developerId)? onProceduresTap;
  final DeveloperData item;

  const _PopupMenuCell({required this.onProceduresTap, required this.item});

  @override
  State<_PopupMenuCell> createState() => _PopupMenuCellState();
}

class _PopupMenuCellState extends State<_PopupMenuCell> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: PopupMenuButton<String>(
        tooltip: '',
        onSelected: (value) {
          switch (value) {
            case 'projects':
              widget.onProceduresTap?.call(widget.item.developerId ?? 0);
              break;
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 8,
        offset: const Offset(0, 4),
        color: Colors.white,
        icon: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            color: _hovering
                ? AppColors.primaryDark.withValues(alpha: 0.15)
                : AppColors.grayLight.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.more_vert_rounded,
            size: 20.sp,
            color: _hovering ? AppColors.primaryDark : Colors.grey.shade600,
          ),
        ),
        itemBuilder: (context) => [
          PopupMenuItem<String>(
            value: 'projects',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(
                    Icons.folder_open_rounded,
                    size: 16.sp,
                    color: AppColors.primaryDark,
                  ),
                ),
                Gap(10.w),
                Text(
                  LangKeys.projects.tr(),
                  style: AppStyles.black14Medium.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  // void _launchPhone() async {
  //   final phone = widget.item.phone;
  //   if (phone != null && phone.isNotEmpty) {
  //     final uri = Uri.parse('tel:$phone');
  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri);
  //     }
  //   }
  // }

  // void _launchEmail() async {
  //   final email = widget.item.email;
  //   if (email != null && email.isNotEmpty) {
  //     final uri = Uri.parse('mailto:$email');
  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri);
  //     }
  //   }
  // }
}
