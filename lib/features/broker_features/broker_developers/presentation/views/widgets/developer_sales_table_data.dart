import 'package:data_table_2/data_table_2.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/developer_sales_model.dart' hide Project;
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperSalesTableData extends StatelessWidget {
  final List<Data> data;
  const DeveloperSalesTableData({super.key, required this.data});

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
    return Center(
      child: Text(
        text,
        style: AppStyles.black12Medium,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _chipCell(String text) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.primaryDark.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          text,
          style: AppStyles.black12Medium.copyWith(fontSize: 10.sp),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _actionChip({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: onTap != null ? AppColors.primaryDark.withValues(alpha: 0.08) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20.r),
            border: onTap != null ? Border.all(color: AppColors.primaryDark.withValues(alpha: 0.2)) : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14.sp, color: onTap != null ? AppColors.primaryDark : Colors.grey),
              Gap(4.w),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.black14Medium.copyWith(
                    color: onTap != null ? AppColors.primaryDark : Colors.grey,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
          minWidth: 1400.w,
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
            _col(LangKeys.fullName.tr(), 160),
            _col(LangKeys.phoneNumber.tr(), 150),
            _col(LangKeys.whatsapp.tr(), 150),
            _col(LangKeys.emailAddress.tr(), 180),
            _col(LangKeys.projects.tr(), 150),
            _col(LangKeys.procedures.tr(), 120),
          ],
          rows: List<DataRow>.generate(
            data.length,
            (index) {
              var item = data[index];
              final phone = item.phone ?? '';
              final whatsapp = item.whatsappPhone ?? '';
              final email = (item.email ?? '').toString();
              final projectName = item.project?.name ?? LangKeys.notAvailable.tr();

              return DataRow(
                color: index.isEven
                    ? WidgetStatePropertyAll(AppColors.grayLight.withValues(alpha: 0.08))
                    : const WidgetStatePropertyAll(Colors.white),
                cells: [
                  DataCell(Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 14.r,
                          backgroundColor: AppColors.primaryDark.withValues(alpha: 0.12),
                          child: Icon(Icons.person, size: 14.sp, color: AppColors.primaryDark),
                        ),
                        Gap(6.w),
                        Expanded(
                          child: Text(
                            item.name ?? LangKeys.notAvailable.tr(),
                            style: AppStyles.black12Medium.copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )),
                  DataCell(
                    phone.isNotEmpty
                        ? _actionChip(
                            icon: Icons.phone_outlined,
                            label: phone,
                            onTap: () async {
                              final uri = Uri.parse('tel:$phone');
                              if (await canLaunchUrl(uri)) await launchUrl(uri);
                            },
                          )
                        : _cell(LangKeys.notAvailable.tr()),
                  ),
                  DataCell(
                    whatsapp.isNotEmpty
                        ? _actionChip(
                            icon: Icons.chat_bubble_outline_rounded,
                            label: whatsapp,
                            onTap: () async {
                              final cleaned = whatsapp.replaceAll(RegExp(r'[^0-9]'), '');
                              final uri = Uri.parse('https://wa.me/$cleaned');
                              if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
                            },
                          )
                        : _cell(LangKeys.notAvailable.tr()),
                  ),
                  DataCell(email.isNotEmpty ? _chipCell(email) : _cell(LangKeys.notAvailable.tr())),
                  DataCell(_chipCell(projectName)),
                  DataCell(Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (phone.isNotEmpty)
                        InkWell(
                          onTap: () async {
                            final uri = Uri.parse('tel:$phone');
                            if (await canLaunchUrl(uri)) await launchUrl(uri);
                          },
                          borderRadius: BorderRadius.circular(6.r),
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Icon(Icons.call_rounded, size: 16.sp, color: Colors.green),
                          ),
                        ),
                      if (phone.isNotEmpty && whatsapp.isNotEmpty) Gap(6.w),
                      if (whatsapp.isNotEmpty)
                        InkWell(
                          onTap: () async {
                            final cleaned = whatsapp.replaceAll(RegExp(r'[^0-9]'), '');
                            final uri = Uri.parse('https://wa.me/$cleaned');
                            if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
                          },
                          borderRadius: BorderRadius.circular(6.r),
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: const Color(0xFF25D366).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Icon(Icons.chat_rounded, size: 16.sp, color: const Color(0xFF25D366)),
                          ),
                        ),
                      if (phone.isEmpty && whatsapp.isEmpty) Text(LangKeys.notAvailable.tr(), style: AppStyles.black12Medium),
                    ],
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
