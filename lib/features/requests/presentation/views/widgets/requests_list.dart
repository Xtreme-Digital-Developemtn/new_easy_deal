import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_card.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_skeleton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../main_imports.dart';
import '../../../data/models/all_request_model.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.hasMore,
    required this.isLoadingMore,
    this.data,
  });

  final ScrollController controller;
  final List<RequestItem>? data;
  final bool isLoading;
  final bool hasMore;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    final items = data ?? [];
    final isEmpty = !isLoading && items.isEmpty;

    return Expanded(
      child: Skeletonizer(
        enabled: isLoading,
        child: isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 64.sp,
                      color: AppColors.grayMedium,
                    ),
                    Gap(16.h),
                    Text(
                      LangKeys.noRequests.tr(),
                      style: AppStyles.gray14Medium,
                    ),
                  ],
                ),
              )
            : ListView.separated(
                controller: controller,
                itemCount: isLoading
                    ? 5
                    : items.length + (isLoadingMore ? 1 : 0),
                separatorBuilder: (context, index) => Gap(12.h),
                itemBuilder: (context, index) {
                  if (isLoading) {
                    return const RequestListItemSkeleton();
                  }

                  if (index == items.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: CustomLoading(),
                      ),
                    );
                  }

                  final request = items[index];

            return RequestListItemCard(
              title: request.title.toString().tr(),
              statusColor: AppColors.primaryDark,
              status: request.status.toString().tr(),
              date: DateTime.now().subtract(
                const Duration(days: 2),
              ),
              type: request.type.toString().tr(),
              address:
                  request.detailedAddress ??
                      LangKeys.noAddressFound.tr(),
              range: request.specializationScope.toString().tr(),
              id: request.id.toString(),
            );
                },
              ),
      ),
    );
  }
}