import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_card.dart';

import '../../../../../main_imports.dart';
import '../../../data/models/all_request_model.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({super.key, this.data});
  final List<Data1>? data;
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: ListView.separated(
        itemCount: data!.length,
        separatorBuilder: (context, index) => Gap(12.h),
        itemBuilder: (context, index) {
          final request = data![index];
          return RequestListItemCard(
              title: request.title.toString(),
            statusColor: AppColors.primaryDark,
            status: request.status.toString(),
            date:  DateTime.now().subtract(Duration(days: 2)),
            type: request.type.toString(),
            address:  request.detailedAddress.toString(),
            range:request.specializationScope.toString(),
            id: request.id.toString(),
          );
        },
      ),
    );
  }
}
