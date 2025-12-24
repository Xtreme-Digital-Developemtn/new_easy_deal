import 'package:easy_localization/easy_localization.dart';
import '../../../../../../main_imports.dart';
import '../../../view_model/create_request_cubit.dart';

class SpecializationDropdown extends StatelessWidget {
  final CreateRequestCubit cubit;
  final List<dynamic> transactionTypes;

  const SpecializationDropdown({required this.cubit, required this.transactionTypes, super.key});

  @override
  Widget build(BuildContext context) {
    final specializationItems = transactionTypes.map<Map<String, String>>((item) {
      return {
        'label': item['label'] as String,
        'value': item['value'] as String,
      };
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.scopeOfSpecialization.tr(), style: AppStyles.black14Regular),
        Gap(12.h),
        CustomDropdown(
          itemDisplayBuilder: (label) => label.toString(),
          hint: LangKeys.scopeOfSpecialization.tr(),
          value: cubit.selectedSpecializationLabel,
          items: specializationItems.map((e) => e['label']!).toList(),
          onChanged: (selectedLabel) {
            final selectedItem = specializationItems.firstWhere(
                  (e) => e['label'] == selectedLabel,
            );
            cubit.selectSpecialization(
              value: selectedItem['value'],
              label: selectedItem['label'],
            );
          },
        ),
      ],
    );
  }
}
