import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/create_request_cubit.dart';

class DealTypeDropdown extends StatelessWidget {
  final CreateRequestCubit cubit;
  final List<dynamic> transactionTypes;

  const DealTypeDropdown({required this.cubit, required this.transactionTypes, super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dealTypeItems = [];
    if (cubit.selectedSpecializationValue != null) {
      final selectedTransaction = transactionTypes.firstWhere(
            (item) => item['value'] == cubit.selectedSpecializationValue,
      );
      final subtypes = selectedTransaction['subtypes'] as List<dynamic>;

      dealTypeItems = subtypes.map<Map<String, String>>((sub) {
        return {
          'label': sub['label'] as String,
          'value': sub['value'] as String,
        };
      }).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.dealType.tr(), style: AppStyles.black14Regular),
        Gap(12.h),
        CustomDropdown(
          value: cubit.selectedDealTypeLabel,
          items: dealTypeItems.map((e) => e['label']!).toList(),
          hint: LangKeys.dealType.tr(),
          itemDisplayBuilder: (label) => label.toString(),
          onChanged: (selectedLabel) {
            final selectedItem = dealTypeItems.firstWhere(
                  (e) => e['label'] == selectedLabel,
            );
            cubit.selectDealType(
              value: selectedItem['value'],
              label: selectedItem['label'],
            );
          },
        ),
      ],
    );
  }
}
