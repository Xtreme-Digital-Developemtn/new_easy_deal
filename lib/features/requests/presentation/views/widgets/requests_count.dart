import 'package:easy_deal/features/requests/presentation/views/widgets/requests_filter.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RequestsCount extends StatelessWidget {
  const RequestsCount({
    super.key,
    required this.count,
    required this.onFilterApplied,
    this.currentFilters,
  });

  final int count;
  final void Function(RequestsFilterResult?) onFilterApplied;
  final RequestsFilterResult? currentFilters;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(LangKeys.requests.tr(),style: AppStyles.primary16SemiBold,),
            Gap(12.w),
            Text(
              '$count ${LangKeys.request.tr()}',
              style: AppStyles.gray14Medium,
            ),
          ],
        ),
        IconButton(
          onPressed: () async {
            final result = await showRequestsFilterSheet(
              context,
              currentFilters,
            );
            onFilterApplied(result);
          },
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.filter_list,
                color: currentFilters?.hasFilters == true
                    ? AppColors.primaryDark
                    : Colors.grey,
                size: 24.sp,
              ),
              if (currentFilters?.hasFilters == true)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
