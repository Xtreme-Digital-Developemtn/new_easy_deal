import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/developers_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopersTableData extends StatelessWidget {
  final List<DeveloperData> data;
  final void Function(int developerId)? onProceduresTap;

  const DevelopersTableData({
    super.key,
    required this.data,
    this.onProceduresTap,
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
              color: Colors.black.withOpacity(0.05),
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
                    AppColors.primaryDark.withOpacity(0.85),
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
                      color: Colors.white.withOpacity(0.2),
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
                  AppColors.blueLight.withOpacity(0.2),
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
                    return AppColors.blueLight.withOpacity(0.15);
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
                  DataColumn2(
                    label: _headerCell(LangKeys.developer.tr()),
                    size: ColumnSize.L,
                    fixedWidth: 180.w,
                  ),
                  DataColumn2(
                    label: _headerCell("اسم المشروع"),
                    size: ColumnSize.L,
                    fixedWidth: 180.w,
                  ),
                  DataColumn2(
                    label: _headerCell("خارج أو داخل كمبوند"),
                    size: ColumnSize.L,
                    fixedWidth: 180.w,
                  ),
                  DataColumn2(
                    label: _headerCell("المنطقة"),
                    size: ColumnSize.L,
                    fixedWidth: 160.w,
                  ),
                  DataColumn2(
                    label: _headerCell("المنطقة الفرعية"),
                    size: ColumnSize.L,
                    fixedWidth: 180.w,
                  ),
                  DataColumn2(
                    label: _headerCell("نوع الوحدة"),
                    size: ColumnSize.L,
                    fixedWidth: 160.w,
                  ),
                  DataColumn2(
                    label: _headerCell("المساحة"),
                    size: ColumnSize.M,
                    fixedWidth: 120.w,
                  ),
                  DataColumn2(
                    label: _headerCell("السعر"),
                    size: ColumnSize.M,
                    fixedWidth: 140.w,
                  ),
                  DataColumn2(
                    label: _headerCell("المعرض والحالة المالية"),
                    size: ColumnSize.L,
                    fixedWidth: 220.w,
                  ),
                  DataColumn2(
                    label: _headerCell("تاريخ التسليم"),
                    size: ColumnSize.M,
                    fixedWidth: 160.w,
                  ),
                  DataColumn2(
                    label: _headerCell("اللوكيشن"),
                    size: ColumnSize.L,
                    fixedWidth: 180.w,
                  ),
                  DataColumn2(
                    label: _headerCell("الملاحظات"),
                    size: ColumnSize.L,
                    fixedWidth: 220.w,
                  ),
                  DataColumn2(
                    label: _headerCell(LangKeys.emailAddress.tr()),
                    size: ColumnSize.L,
                    fixedWidth: 200.w,
                  ),
                  DataColumn2(
                    label: _headerCell(LangKeys.phoneNumber.tr()),
                    size: ColumnSize.L,
                    fixedWidth: 130.w,
                  ),
                  DataColumn2(
                    label: _headerCell(LangKeys.projects.tr()),
                    size: ColumnSize.S,
                    fixedWidth: 80.w,
                  ),
                  DataColumn2(
                    label: _headerCell(LangKeys.status.tr()),
                    size: ColumnSize.S,
                    fixedWidth: 100.w,
                  ),
                  DataColumn2(
                    label: _headerCell(LangKeys.procedures.tr()),
                    size: ColumnSize.S,
                    fixedWidth: 60.w,
                  ),
                ],
                rows: List<DataRow>.generate(data.length, (index) {
                  var item = data[index];
                  final isActive = item.isActive == true;
                  final isEven = index.isEven;

                  return DataRow(
                    color: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.hovered)) {
                        return AppColors.blueLight.withOpacity(0.12);
                      }
                      return isEven
                          ? Colors.white
                          : AppColors.grayLight.withOpacity(0.06);
                    }),
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isActive
                                      ? AppColors.primaryDark.withOpacity(0.3)
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
                                      backgroundColor: isActive
                                          ? AppColors.primaryDark.withOpacity(
                                              0.15,
                                            )
                                          : Colors.grey.shade200,
                                      child: Icon(
                                        Icons.person,
                                        size: 16.sp,
                                        color: isActive
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
                      DataCell(
                        _chipCell(
                          "item.projectName" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.compoundType" ?? LangKeys.notAvailable.tr(), // داخل أو خارج كمبوند
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.area" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.subArea" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.unitType" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.areaSize"?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.price" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.exhibitionAndFinancialStatus" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.deliveryDate" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.location" ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),

                      DataCell(
                        _chipCell(
                          "item.notes "?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),
                      DataCell(
                        _chipCell(
                          item.email ?? LangKeys.notAvailable.tr(),
                          AppColors.primaryDark.withOpacity(0.08),
                          AppColors.primaryDark.withOpacity(0.7),
                        ),
                      ),
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
                      DataCell(
                        Center(
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primaryDark.withOpacity(0.1),
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
                      DataCell(_statusChip(isActive)),
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: onTap != null
              ? AppColors.primaryDark.withOpacity(0.08)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20.r),
          border: onTap != null
              ? Border.all(color: AppColors.primaryDark.withOpacity(0.2))
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

  Widget _statusChip(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: (isActive ? Colors.green : Colors.red).withOpacity(0.1),
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
              color: isActive ? Colors.green : Colors.red,
            ),
          ),
          Gap(6.w),
          Text(
            isActive ? LangKeys.active.tr() : LangKeys.inactive.tr(),
            style: AppStyles.black14Medium.copyWith(
              color: isActive ? Colors.green.shade700 : Colors.red.shade700,
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
            case 'call':
              _launchPhone();
              break;
            case 'email':
              _launchEmail();
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
                ? AppColors.primaryDark.withOpacity(0.15)
                : AppColors.grayLight.withOpacity(0.3),
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
                    color: AppColors.primaryDark.withOpacity(0.1),
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
          PopupMenuItem<String>(
            value: 'call',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(
                    Icons.phone_outlined,
                    size: 16.sp,
                    color: Colors.green.shade700,
                  ),
                ),
                Gap(10.w),
                Text(
                  LangKeys.phoneNumber.tr(),
                  style: AppStyles.black14Medium.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'email',
            height: 44.h,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(
                    Icons.email_outlined,
                    size: 16.sp,
                    color: Colors.blue.shade700,
                  ),
                ),
                Gap(10.w),
                Text(
                  LangKeys.emailAddress.tr(),
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

  void _launchPhone() async {
    final phone = widget.item.phone;
    if (phone != null && phone.isNotEmpty) {
      final uri = Uri.parse('tel:$phone');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  void _launchEmail() async {
    final email = widget.item.email;
    if (email != null && email.isNotEmpty) {
      final uri = Uri.parse('mailto:$email');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }
}
