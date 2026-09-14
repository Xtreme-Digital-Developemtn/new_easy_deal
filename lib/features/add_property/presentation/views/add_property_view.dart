import '../../../../main_imports.dart';
import '../view_model/add_property_cubit.dart';
import '../view_model/add_property_states.dart';
import 'widgets/ap_nav_buttons.dart';
import 'widgets/ap_step0_category.dart';
import 'widgets/ap_step1_location.dart';
import 'widgets/ap_step2_unit_info.dart';
import 'widgets/ap_step3_payment.dart';
import 'widgets/ap_step4_documents.dart';
import 'widgets/ap_step5_review.dart';
import 'widgets/ap_step_header.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;
    return Scaffold(
      appBar: GlobalAppBar(title: isArabic ? 'إضافة عقار' : 'Add Property'),
      body: BlocConsumer<AddPropertyCubit, AddPropertyStates>(
        listener: (context, state) {
          if (state is CreateUnitSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                state.published
                    ? (isArabic ? 'تم إضافة العقار ونشره بنجاح' : 'Property published successfully')
                    : (isArabic ? 'تم إضافة العقار بنجاح' : 'Property added successfully'),
              ),
            ));
            Navigator.of(context).maybePop();
          } else if (state is CreateUnitErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: Colors.red, content: Text(state.message)),
            );
          } else if (state is GetCitiesErrorState ||
              state is GetAreasErrorState ||
              state is GetSubAreasErrorState) {
            final msg = state is GetCitiesErrorState
                ? state.message
                : state is GetAreasErrorState
                    ? state.message
                    : (state as GetSubAreasErrorState).message;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<AddPropertyCubit>();
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ApStepHeader(),
                      _stepBody(cubit.currentStep),
                    ],
                  ),
                ),
              ),
              ApNavButtons(),
            ],
          );
        },
      ),
    );
  }

  Widget _stepBody(int step) {
    switch (step) {
      case 0:
        return ApStep0Category();
      case 1:
        return ApStep1Location();
      case 2:
        return ApStep2UnitInfo();
      case 3:
        return ApStep3Payment();
      case 4:
        return ApStep4Documents();
      case 5:
        return const ApStep5Review();
      default:
        return const SizedBox.shrink();
    }
  }
}
