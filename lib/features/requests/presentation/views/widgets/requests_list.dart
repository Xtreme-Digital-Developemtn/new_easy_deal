import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_card.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_skeleton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../main_imports.dart';
import '../../../data/models/all_request_model.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({super.key, this.data, required this.isLoading});

  final List<Data1>? data;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: isLoading,
        child: ListView.separated(
          itemCount: isLoading ? 5 : data!.length,
          separatorBuilder: (context, index) => Gap(12.h),
          itemBuilder: (context, index) {
            if (isLoading) {
              return RequestListItemSkeleton();
            }
            final request = data![index];
            return RequestListItemCard(
              title: request.title.toString(),
              statusColor: AppColors.primaryDark,
              status: request.status.toString(),
              date: DateTime.now().subtract(Duration(days: 2)),
              type: request.type.toString(),
              address: request.detailedAddress?? LangKeys.noAddressFound.tr(),
              range: request.specializationScope.toString(),
              id: request.id.toString(),
            );
          },
        ),
      ),
    );
  }
}
