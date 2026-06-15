import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
import '../../view_model/assign_to_broker_cubit.dart';
import '../../view_model/assign_to_broker_states.dart';

class AssignButton extends StatelessWidget {
  const AssignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignToBrokerCubit, AssignToBrokerStates>(
      builder: (context, state) {
        final isAssigning = state is AssignBrokersLoadingState;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          color: Colors.white,
          child: CustomButton(
            onPressed: isAssigning ? null : () {
              context.read<AssignToBrokerCubit>().assignToBrokers(context);
            },
            text: LangKeys.save.tr(),
          ),
        );
      },
    );
  }
}
