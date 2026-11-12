import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_card.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/request_list_item_skeleton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../main_imports.dart';
import '../../../data/config/request_translations.dart';
import '../../../data/models/all_request_model.dart';

/// لون شارة الحالة حسب الحالة نفسها، مش لون واحد لكل الحالات.
Color _statusColor(dynamic rawStatus) {
  switch (rawStatus?.toString()) {
    case 'new':
      return AppColors.primaryDark;
    case 'in_processing':
      return AppColors.orangeMedium;
    case 'finished':
    case 'completed':
      return AppColors.successDark;
    case 'rejected':
    case 'cancelled':
      return AppColors.errorDark;
    default:
      return AppColors.grayDarkest;
  }
}

class RequestsList extends StatelessWidget {
  const RequestsList({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.hasMore,
    required this.isLoadingMore,
    this.data,
    this.receiverNames,
    this.onRefresh,
  });

  final ScrollController controller;
  final List<RequestItem>? data;
  final List<String?>? receiverNames;
  final bool isLoading;
  final bool hasMore;
  final bool isLoadingMore;

  /// سحب لتحديث، وكمان بيتنده بعد الرجوع من شاشة تفاصيل الطلب
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    final items = data ?? [];
    final isEmpty = !isLoading && items.isEmpty;

    return Expanded(
      child: Skeletonizer(
        enabled: isLoading,
        child: _withRefresh(
          child: isEmpty
            ? ListView(
                controller: controller,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 120.h),
                  Column(
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
                ],
              )
            : ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
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
                  final receiverName = (receiverNames != null && index < receiverNames!.length)
                      ? receiverNames![index]
                      : null;

            return RequestListItemCard(
              title: RequestTranslations.title(request.type, request.unit),
              statusColor: _statusColor(request.status),
              status: RequestTranslations.status(request.status),
              // date: DateTime.now().subtract(
              //   const Duration(days: 2),
              // ),
              type: RequestTranslations.type(request.type),
              address:
                  request.detailedAddress ??
                      LangKeys.noAddressFound.tr(),
              range: RequestTranslations.specializationScope(request.specializationScope),
              id: request.id ,
              assignedToLabel: receiverName,
              // بعد الرجوع من التفاصيل بنعيد التحميل عشان الحالة لو اتغيّرت
              // جوه التفاصيل تتحدّث على الكارت
              onReturn: onRefresh == null ? null : () => onRefresh!(),
            );
                },
              ),
        ),
      ),
    );
  }

  /// بيلف الليستة بـRefreshIndicator لو فيه onRefresh، وإلا بيرجّعها زي ما هي
  Widget _withRefresh({required Widget child}) {
    if (onRefresh == null) return child;
    return RefreshIndicator(
      onRefresh: onRefresh!,
      color: AppColors.primaryDark,
      child: child,
    );
  }
}