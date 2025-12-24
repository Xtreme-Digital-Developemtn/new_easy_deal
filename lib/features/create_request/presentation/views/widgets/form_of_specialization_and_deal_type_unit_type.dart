import 'package:easy_deal/core/shared_widgets/custom_drop_down.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/data/static_form_data.dart';
import 'dropdowns/deal_type_dropdown.dart';
import 'dropdowns/specialization_dropdown.dart';
import 'dropdowns/unit_type_dropdown.dart';

class FormOfSpecializationAndDealTypeAndUnitType extends StatelessWidget {
  const FormOfSpecializationAndDealTypeAndUnitType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var cubit = context.read<CreateRequestCubit>();
        final formData = StaticFormData.getData(context);
        final transactionTypes = formData['transaction_types'] as List<dynamic>;
       /// SpecializationItems
        final specializationItems = transactionTypes.map<Map<String, String>>((item) {
          return {
            'label': item['label'] as String,
            'value': item['value'] as String,
          };
        }).toList();

        /// DealTypeItems
        List<Map<String,String>> dealTypeItems = [];

        if (cubit.selectedSpecializationValue != null) {
          final selectedTransaction = transactionTypes.firstWhere(
                (item) => item['value'] == cubit.selectedSpecializationValue,
          );

          final subtypes = selectedTransaction['subtypes'] as List<dynamic>;

          dealTypeItems = subtypes.map<Map<String,String>>((sub) {
            return {
              'label': sub['label'] as String,
              'value': sub['value'] as String,
            };
          }).toList();
        }

        /// UnitTypeItems
        List<Map<String,String>> unitTypeItems = [];

        if (cubit.selectedSpecializationValue != null &&
            cubit.selectedDealTypeValue != null) {

          final selectedTransaction = transactionTypes.firstWhere(
                (item) => item['value'] == cubit.selectedSpecializationValue,
          );

          final subtypes = selectedTransaction['subtypes'] as List<dynamic>;

          final selectedSubtype = subtypes.firstWhere(
                (sub) => sub['value'] == cubit.selectedDealTypeValue,
          );

          final units = selectedSubtype['units'] as List<dynamic>;

          unitTypeItems = units.map<Map<String,String>>((unit) {
            return {
              'label': unit['label'] as String,
              'value': unit['value'] as String,
            };
          }).toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpecializationDropdown(cubit: cubit, transactionTypes: transactionTypes),
            Gap(12.h),
            DealTypeDropdown(cubit: cubit, transactionTypes: transactionTypes),
            Gap(12.h),
            UnitTypeDropdown(cubit: cubit, transactionTypes: transactionTypes),

          ],
        );
      },
    );
  }
}

