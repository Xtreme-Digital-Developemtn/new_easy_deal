import 'package:easy_deal/features/request_details/presentation/view_model/request_details_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/request_details/presentation/view_model/request_details_states.dart';

import '../../../../../main_imports.dart';
import 'replies_table.dart';

/// RepliesWidget - يعرض نفس جدول الردود بنفس الباجينيشن
/// لكن مصدر البيانات هو API الجديد:
/// https://new.easydealmasr.com/api/v1/request/replies?limit=10&offset=0&sort=desc&sortBy=id&requestId=496&brokerId=1
/// Data auto-loads on screen open (without button) via cubit.getReplies()
class RepliesWidget extends StatefulWidget {
  const RepliesWidget({super.key});

  @override
  State<RepliesWidget> createState() => _RepliesWidgetState();
}

class _RepliesWidgetState extends State<RepliesWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchIfNeeded();
    });
  }

  void _fetchIfNeeded() {
    final cubit = context.read<RequestDetailsCubit>();
    // لو الداتا already محملة من auto-load في requestDetails => لا تعيد التحميل
    if (cubit.repliesList.isNotEmpty) return;
    final requestId = cubit.requestDetailsModel?.data?.id;
    if (requestId != null) {
      cubit.getReplies(requestId: requestId);
    }
  }

  void _onLoadMore() {
    final cubit = context.read<RequestDetailsCubit>();
    final requestId = cubit.requestDetailsModel?.data?.id;
    if (requestId != null) {
      cubit.loadMoreReplies(requestId: requestId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDetailsCubit, RequestDetailsStates>(
      builder: (context, state) {
        final cubit = context.read<RequestDetailsCubit>();

        final isInitialLoading = state is GetRepliesLoadingState && cubit.repliesList.isEmpty;

        if (isInitialLoading) {
          return const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Center(child: CustomLoading()),
          );
        }

        if (state is GetRepliesErrorState && cubit.repliesList.isEmpty) {
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
                    child: Text(LangKeys.retry.tr()),
                  ),
                ],
              ),
            ),
          );
        }

        final replies = cubit.repliesList;
        final hasMore = cubit.repliesHasMore;
        final isLoadingMore = cubit.isLoadingMoreReplies;

        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cubit.repliesTotalCount > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 4),
                  child: Text(
                    LangKeys.repliesCountSummary.tr(namedArgs: {
                      'total': '${cubit.repliesTotalCount}',
                      'shown': '${cubit.repliesUnitsFlat.length}',
                    }),
                    style: const TextStyle(fontSize: 12, color: Color(0xff666666)),
                  ),
                ),
              RepliesModelTable(
                replies: replies,
                hasMore: hasMore,
                isLoadingMore: isLoadingMore,
                onLoadMore: hasMore && !isLoadingMore ? _onLoadMore : null,
              ),
              if (state is GetRepliesLoadMoreErrorState)
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
                      child: Text(LangKeys.loadMore.tr()),
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
