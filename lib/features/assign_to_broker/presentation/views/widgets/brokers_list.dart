import 'package:easy_deal/features/assign_to_broker/presentation/view_model/assign_to_broker_states.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/table_cell.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../view_model/assign_to_broker_cubit.dart';
import 'broker_text_helper.dart';

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
                  columnWidths:   {
                    0: FixedColumnWidth(44.w),
                    1: FixedColumnWidth(160.w),
                    2: FixedColumnWidth(120.w),
                    3: FixedColumnWidth(100.w),
                    4: FixedColumnWidth(160.w),
                    5: FixedColumnWidth(140.w),
                    6: FixedColumnWidth(140.w),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder(
                    horizontalInside: BorderSide(color: AppColors.grayLight, width: 0.5.w),
                    bottom: BorderSide(color: AppColors.grayLight, width: 0.5.w),
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
                         TableCellWidget(LangKeys.brokerName.tr(), isHeader: true),
                         TableCellWidget(LangKeys.accountType.tr(), isHeader: true),
                         TableCellWidget(LangKeys.type.tr(), isHeader: true),
                         TableCellWidget(LangKeys.area.tr(), isHeader: true),
                         TableCellWidget(LangKeys.specialization.tr(), isHeader: true),
                         TableCellWidget(LangKeys.specializationScope.tr(), isHeader: true),
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
                            TableCellWidget(item.fullName),
                            TableCellWidget(BrokerTextHelper.accountTypeText(item.accountType)),
                            TableCellWidget(BrokerTextHelper.typeText(item.type)),
                            TableCellWidget(areas),
                            TableCellWidget(item.specializations.map((s) => BrokerTextHelper.specializationText(s.specialization ?? '')).join(' - ')),
                            TableCellWidget(item.specializations.map((s) => BrokerTextHelper.specializationScopeText(s.specializationScope ?? '')).where((s) => s.isNotEmpty).join(' - ')),
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
