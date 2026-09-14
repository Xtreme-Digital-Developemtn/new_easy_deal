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
      children: [for (final name in fields) ApDynamicField(name: name)],
    );
  }
}
