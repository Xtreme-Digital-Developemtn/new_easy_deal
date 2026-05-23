import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'dynamic_form_field.dart';

class FormOfUnitUploadUnitDocuments extends StatelessWidget {
  const FormOfUnitUploadUnitDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var cubit = context.read<CreateRequestCubit>();
        final inputs = cubit.currentStepInputs;
        return Column(
          children: inputs.map((config) => DynamicFormField(config: config)).toList(),
        );
      },
    );
  }
}
