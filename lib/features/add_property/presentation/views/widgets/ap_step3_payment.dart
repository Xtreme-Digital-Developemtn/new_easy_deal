import '../../../../../main_imports.dart';
import '../../view_model/add_property_cubit.dart';
import 'ap_dynamic_field.dart';

/// Step 3 – payment / rent details (dynamic).
class ApStep3Payment extends StatelessWidget {
  const ApStep3Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final fields = cubit.visibleStep3Fields();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [for (final name in fields) ApDynamicField(name: name)],
    );
  }
}
