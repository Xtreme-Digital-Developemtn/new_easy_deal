import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
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

