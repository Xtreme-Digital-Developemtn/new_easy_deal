import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/create_request_cubit.dart';

class UnitTypeDropdown extends StatelessWidget {
  final CreateRequestCubit cubit;
  final List<dynamic> transactionTypes;

  const UnitTypeDropdown({required this.cubit, required this.transactionTypes, super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> unitTypeItems = [];
    if (cubit.selectedSpecializationValue != null && cubit.selectedDealTypeValue != null) {
      final selectedTransaction = transactionTypes.firstWhere(
            (item) => item['value'] == cubit.selectedSpecializationValue,
      );
      final subtypes = selectedTransaction['subtypes'] as List<dynamic>;
      final selectedSubtype = subtypes.firstWhere(
            (sub) => sub['value'] == cubit.selectedDealTypeValue,
      );
      final units = selectedSubtype['units'] as List<dynamic>;

      unitTypeItems = units.map<Map<String, String>>((unit) {
        return {
          'label': unit['label'] as String,
          'value': unit['value'] as String,
        };
      }).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.unitType.tr(), style: AppStyles.black14Regular),
        Gap(12.h),
        CustomDropdown(
          value: cubit.selectedUnitTypeLabel,
          items: unitTypeItems.map((e) => e['label']!).toList(),
          hint: LangKeys.unitType.tr(),
          itemDisplayBuilder: (label) => label.toString(),
          onChanged: (selectedLabel) {
            final selectedItem = unitTypeItems.firstWhere(
                  (e) => e['label'] == selectedLabel,
            );
            cubit.selectUnitType(
              value: selectedItem['value'],
              label: selectedItem['label'],
            );
          },
        ),
      ],
    );
  }
}