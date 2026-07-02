import 'package:easy_deal/features/create_request/presentation/views/widgets/past_button.dart';

import '../../../../../main_imports.dart';
import '../../view_model/create_request_cubit.dart';
import '../../view_model/create_request_states.dart';
import 'next_button.dart';

class NextAndPreviousButtons extends StatelessWidget {
  const NextAndPreviousButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var cubit = context.read<CreateRequestCubit>();
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          color: Colors.white,
          child: Row(
            children: [
              if (cubit.currentStepNumber > 1)
                PastButton(),
              if (cubit.currentStepNumber > 1)
                Gap(10.w),
              Expanded(child: NextButton()),
            ],
          ),
        );
      },
    );
  }
}
