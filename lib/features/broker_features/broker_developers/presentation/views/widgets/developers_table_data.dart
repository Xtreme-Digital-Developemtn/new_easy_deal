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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
          // هيدر بلون متدرج خفيف بدل الأبيض العادي
          headingRowColor: MaterialStateProperty.all(
            AppColors.blueLight.withOpacity(0.35),
          ),
          headingRowHeight: 54.h,
          headingTextStyle: AppStyles.black14Medium.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
          // تلوين متبادل للصفوف (Zebra style) + هوفر
          dataRowColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.blueLight.withOpacity(0.18);
            }
            return Colors.white;
          }),

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

          columnSpacing: 12.w,
          horizontalMargin: 16.w,
          dataRowHeight: 64.h,
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
              final isActive = item.isActive == true;

              return DataRow(
                cells: [
                  // اسم المطور + صورة داخل دائرة بحدود ملونة
                  DataCell(
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.blueLight,
                              width: 1.5,
                            ),
                          ),
                          child: item.image != null
                              ? ClipOval(
                            child: CustomNetWorkImage(
                              imageUrl: item.image!,
                              raduis: 50,
                              height: 30.h,
                              width: 30.w,
                              fit: BoxFit.cover,
                            ),
                          )
                              : CircleAvatar(
                            radius: 15.r,
                            backgroundColor: AppColors.blueLight,
                            child: Icon(Icons.person, size: 16.sp, color: Colors.white),
                          ),
                        ),
                        Gap(8.w),
                        Expanded(
                          child: Text(
                            item.fullName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.black14Medium,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // الإيميل داخل شيبة (chip) ملونة بدل الحدود السوداء
                  DataCell(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppColors.blueLight.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        item.email ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.black14Medium.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  DataCell(Text(item.phone ?? '', style: AppStyles.black14Medium)),

                  // عدد المشاريع داخل دائرة صغيرة
                  DataCell(
                    Center(
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blueLight.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${item.numberOfProjects ?? 0}',
                          style: AppStyles.black14Medium.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),

                  // حالة المطور: شيبة خضراء/حمراء مع نقطة ملونة
                  DataCell(
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: (isActive ? Colors.green : Colors.red).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8.w,
                            height: 8.w,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // زر الإجراءات مع تأثير ضغط وانتقال لوني
                  DataCell(
                    Center(
                      child: _AnimatedActionButton(
                        onTap: () => onProceduresTap?.call(item.developerId ?? 0),
                      ),
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

/// زر أيقونة العين مع أنيميشن بسيط عند الضغط (scale) وتغيير لون الخلفية عند الهوفر
class _AnimatedActionButton extends StatefulWidget {
  final VoidCallback onTap;
  const _AnimatedActionButton({required this.onTap});

  @override
  State<_AnimatedActionButton> createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<_AnimatedActionButton> {
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
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: _hovering
                  ? AppColors.blueLight.withOpacity(0.9)
                  : AppColors.blueLight,
              shape: BoxShape.circle,
              boxShadow: _hovering
                  ? [
                BoxShadow(
                  color: AppColors.blueLight.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
                  : [],
            ),
            child: SvgPicture.asset(
              SvgImages.eye,
              height: 18.h,
              width: 18.w,
            ),
          ),
        ),
      ),
    );
  }
}