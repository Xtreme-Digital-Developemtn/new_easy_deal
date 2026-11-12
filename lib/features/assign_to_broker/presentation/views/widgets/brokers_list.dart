import 'package:easy_deal/features/assign_to_broker/presentation/view_model/assign_to_broker_states.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/multi_values_cell.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/table_cell.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/data/specialization_display_data.dart';
import '../../../../../core/shared_widgets/empty_widget.dart';
import '../../../data/models/broker_model.dart';
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
              // التحميل والخطأ والحالة الفاضية بيبانوا جوه الكارت بدل جدول فاضي
              child: cubit.isLoading
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: const Center(child: CustomLoading()),
                    )
                  : cubit.errorMessage != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cubit.errorMessage!,
                            textAlign: TextAlign.center,
                            style: AppStyles.black12Medium.copyWith(color: Colors.red),
                          ),
                          Gap(12.h),
                          ElevatedButton(
                            onPressed: () => cubit.getRecommendedBrokers(),
                            child: Text(LangKeys.retry.tr()),
                          ),
                        ],
                      ),
                    )
                  : cubit.assignBrokersList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
                      child: EmptyWidget(msg: LangKeys.noRecommendationsYet),
                    )
                  : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths:   {
                    0: FixedColumnWidth(44.w),
                    1: FixedColumnWidth(160.w),
                    2: FixedColumnWidth(120.w),
                    3: FixedColumnWidth(100.w),
                    4: FixedColumnWidth(160.w),
                    // عرض كفاية إن أول تخصص يبان كامل وجانبه شارة الباقي
                    5: FixedColumnWidth(135.w),
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
                         // التخصص الأساسي (scope) بس - التخصص الفرعي مش بيظهر في الجدول
                         TableCellWidget(LangKeys.specializationScope.tr(), isHeader: true),
                      ],
                    ),
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
                            // التخصص الأساسي بدون تكرار، وبيظهر أول واحد وجانبه
                            // عدد الباقي، والضغط يفتح شيت فيه كلهم وتحت كل واحد وحداته
                            MultiValuesCell(
                              title: LangKeys.specializationScope.tr(),
                              subtitle: item.fullName,
                              values: _scopeItems(context, item.specializations),
                            ),
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

/// بيجمّع التخصصات الراجعة للوسيط على مستوى التخصص الأساسي
/// (specializationScope) بدون تكرار، وكل واحد بياخد وحدات تخصصاته الفرعية
/// (specialization) من الملف الثابت بدون تكرار كذلك.
List<MultiValueItem> _scopeItems(
  BuildContext context,
  List<Specializations> specializations,
) {
  final labels = <String, String>{};
  final units = <String, List<String>>{};

  for (final s in specializations) {
    final key = SpecializationDisplayData.normalizeKey(s.specializationScope);
    if (key.isEmpty) continue;

    labels.putIfAbsent(
      key,
      () => BrokerTextHelper.specializationScopeText(s.specializationScope ?? ''),
    );
    final list = units.putIfAbsent(key, () => <String>[]);
    final specUnits = SpecializationDisplayData.units(context, s.specialization);
    for (final unit in specUnits) {
      if (!list.contains(unit)) list.add(unit);
    }
  }

  return labels.entries
      .map((e) => MultiValueItem(label: e.value, units: units[e.key] ?? const []))
      .toList();
}
