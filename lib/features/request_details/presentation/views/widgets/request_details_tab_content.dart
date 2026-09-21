import 'package:easy_deal/features/request_details/presentation/views/widgets/replies_widget.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_overview.dart';

import '../../../../../main_imports.dart';
import '../../view_model/request_details_cubit.dart';
import '../../view_model/request_details_states.dart';

class RequestDetailsTabContent extends StatelessWidget {
  const RequestDetailsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
      builder: (context, state) {
        final cubit = RequestDetailsCubit.get(context);
        final data = cubit.requestDetailsModel?.data;

        switch (cubit.selectedIndex) {
          case 0:
            return RequestOverview(data: data);

          case 1:
            return const RepliesWidget(); // now paginated with real SentResponsesModel data

          // case 2:
          //   return const SentRepliesWidget();

          default:
            return RequestOverview(data: data);
        }
      },
    );
  }
}