import 'package:easy_deal/features/assign_to_broker/presentation/view_model/assign_to_broker_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../view_model/assign_to_broker_cubit.dart';

class _TableCell extends StatelessWidget {
  const _TableCell(this.text, {this.isHeader = false});
  final String text;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Text(
        text,
        style: isHeader ? AppStyles.black14SemiBold : AppStyles.black12Medium.copyWith(fontSize: 10.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AssignBrokersList extends StatelessWidget {
  const AssignBrokersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignToBrokerCubit, AssignToBrokerStates>(
      builder: (context, state) {
        var cubit = context.read<AssignToBrokerCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.selectBroker.tr(), style: AppStyles.black16SemiBold),
            Gap(12.h),
            Card(
              elevation: 2,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(44),
                    1: FixedColumnWidth(160),
                    2: FixedColumnWidth(120),
                    3: FixedColumnWidth(100),
                    4: FixedColumnWidth(160),
                    5: FixedColumnWidth(140),
                    6: FixedColumnWidth(140),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder(
                    horizontalInside: BorderSide(color: AppColors.grayLight, width: 0.5),
                    bottom: BorderSide(color: AppColors.grayLight, width: 0.5),
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: AppColors.grayLight.withValues(alpha: 0.2)),
                      children: [
                        Checkbox(
                          value: cubit.selectAll,
                          checkColor: AppColors.white,
                          activeColor: AppColors.primaryDark,
                          onChanged: (_) => cubit.toggleSelectAll(),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        ),
                        _TableCell(LangKeys.brokerName.tr(), isHeader: true),
                        _TableCell(LangKeys.accountType.tr(), isHeader: true),
                        _TableCell(LangKeys.type.tr(), isHeader: true),
                        _TableCell(LangKeys.area.tr(), isHeader: true),
                        _TableCell(LangKeys.specialization.tr(), isHeader: true),
                        _TableCell(LangKeys.specializationScope.tr(), isHeader: true),
                      ],
                    ),
                    if (cubit.isLoading)
                      TableRow(
                        children: List.filled(7, const Center(child: CircularProgressIndicator())),
                      )
                    else if (cubit.assignBrokersList.isEmpty)
                      TableRow(
                        children: List.filled(7, Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr(), style: AppStyles.gray14Medium),
                          ),
                        )),
                      )
                    else
                      ...cubit.assignBrokersList.map((item) {
                        final isSelected = cubit.selectedItems.contains(item);
                        final areas = item.areas.map((a) => context.isArabic ? (a.nameAr ?? '') : (a.nameEn ?? '')).join(' - ');
                        final specializations = item.specializations.map((s) => s.specialization ?? '').join(' - ');
                        final scopes = item.specializations.map((s) => s.specializationScope ?? '').where((s) => s.isNotEmpty).join(' - ');
                        return TableRow(
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryDark.withValues(alpha: 0.05) : null,
                          ),
                          children: [
                            Checkbox(
                              value: isSelected,
                              checkColor: AppColors.white,
                              activeColor: AppColors.primaryDark,
                              onChanged: (_) => cubit.toggleItemSelection(item),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                            ),
                            _TableCell(item.fullName),
                            _TableCell(item.accountType),
                            _TableCell(item.type),
                            _TableCell(areas),
                            _TableCell(specializations),
                            _TableCell(scopes),
                          ],
                        );
                      }),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
