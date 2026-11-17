import '../../../../../main_imports.dart';
import '../../view_model/add_property_cubit.dart';
import 'ap_dynamic_field.dart';

/// Step 2 – unit information (fully dynamic based on the category selection).
class ApStep2UnitInfo extends StatelessWidget {
  const ApStep2UnitInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final fields = cubit.visibleStep2Fields();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // The key keeps each field's own widget state (e.g. an open dropdown)
      // attached to that field when conditional fields appear or disappear.
      children: [for (final name in fields) ApDynamicField(key: ValueKey(name), name: name)],
    );
  }
}
