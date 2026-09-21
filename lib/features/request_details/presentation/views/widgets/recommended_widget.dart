import 'package:easy_deal/features/request_details/presentation/view_model/request_details_cubit.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_states.dart';

import '../../../../../main_imports.dart';
import 'replies_table.dart';

/// RecommendedWidget - تاب توصيات
/// API: https://new.easydealmasr.com/api/v1/requests/recommend/units/{requestId}/{brokerId}?limit=10&offset=0&sort=desc&sortBy=id
/// نفس طريقة الباجينيشن والـ auto-load بدون زرار
class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({super.key});

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchIfNeeded();
    });
  }

  void _fetchIfNeeded() {
    final cubit = context.read<RequestDetailsCubit>();
    if (cubit.recommendedList.isNotEmpty) return;
    final requestId = cubit.requestDetailsModel?.data?.id;
    if (requestId != null) {
      cubit.getRecommendedUnits(requestId: requestId);
    }
  }

  void _onLoadMore() {
    final cubit = context.read<RequestDetailsCubit>();
    final requestId = cubit.requestDetailsModel?.data?.id;
    if (requestId != null) {
      cubit.loadMoreRecommended(requestId: requestId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
      builder: (context, state) {
        final cubit = context.read<RequestDetailsCubit>();

        final isInitialLoading = state is GetRecommendedLoadingState && cubit.recommendedList.isEmpty;

        if (isInitialLoading) {
          return const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Center(child: CustomLoading()),
          );
        }

        if (state is GetRecommendedErrorState && cubit.recommendedList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.error, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _fetchIfNeeded,
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              ),
            ),
          );
        }

        final items = cubit.recommendedList;
        final hasMore = cubit.recommendedHasMore;
        final isLoadingMore = cubit.isLoadingMoreRecommended;

        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cubit.recommendedTotalCount > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 4),
                  child: Text(
                    'إجمالي التوصيات: ${cubit.recommendedTotalCount}  •  عرض ${items.length}',
                    style: const TextStyle(fontSize: 12, color: Color(0xff666666)),
                  ),
                ),
              RecommendedTable(
                items: items,
                hasMore: hasMore,
                isLoadingMore: isLoadingMore,
                onLoadMore: hasMore && !isLoadingMore ? _onLoadMore : null,
              ),
              if (state is GetRecommendedLoadMoreErrorState)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: Text(state.error, style: const TextStyle(color: Colors.red, fontSize: 12)),
                  ),
                ),
              if (hasMore && !isLoadingMore)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Center(
                    child: OutlinedButton(
                      onPressed: _onLoadMore,
                      child: const Text('تحميل المزيد'),
                    ),
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
