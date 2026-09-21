import 'package:easy_deal/features/request_details/presentation/view_model/request_details_cubit.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_states.dart';

import '../../../../../main_imports.dart';
import 'replies_table.dart';

/// SentRepliesWidget - يعرض الردود المرسلة `unit/list-sent-unit-requests`
/// نفس طريقة الـ pagination والـ auto-load بدون زرار
class SentRepliesWidget extends StatefulWidget {
  const SentRepliesWidget({super.key});

  @override
  State<SentRepliesWidget> createState() => _SentRepliesWidgetState();
}

class _SentRepliesWidgetState extends State<SentRepliesWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchIfNeeded();
    });
  }

  void _fetchIfNeeded() {
    final cubit = context.read<RequestDetailsCubit>();
    if (cubit.sentResponsesList.isNotEmpty) return;
    final requestId = cubit.requestDetailsModel?.data?.id;
    if (requestId != null) {
      cubit.getSentResponses(requestId: requestId);
    }
  }

  void _onLoadMore() {
    final cubit = context.read<RequestDetailsCubit>();
    final requestId = cubit.requestDetailsModel?.data?.id;
    if (requestId != null) {
      cubit.loadMoreSentResponses(requestId: requestId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
      builder: (context, state) {
        final cubit = context.read<RequestDetailsCubit>();

        final isInitialLoading = state is GetSentResponsesLoadingState && cubit.sentResponsesList.isEmpty;

        if (isInitialLoading) {
          return const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Center(child: CustomLoading()),
          );
        }

        if (state is GetSentResponsesErrorState && cubit.sentResponsesList.isEmpty) {
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
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        final items = cubit.sentResponsesList;
        final hasMore = cubit.sentResponsesHasMore;
        final isLoadingMore = cubit.isLoadingMoreSentResponses;

        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cubit.sentResponsesTotalCount > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 4),
                  child: Text(
                    'Total sent: ${cubit.sentResponsesTotalCount}  •  Showing ${items.length}',
                    style: const TextStyle(fontSize: 12, color: Color(0xff666666)),
                  ),
                ),
              RepliesTable(
                items: items,
                hasMore: hasMore,
                isLoadingMore: isLoadingMore,
                onLoadMore: hasMore && !isLoadingMore ? _onLoadMore : null,
              ),
              if (state is GetSentResponsesLoadMoreErrorState)
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
                      child: const Text('Load More'),
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
