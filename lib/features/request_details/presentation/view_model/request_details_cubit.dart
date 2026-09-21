import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/data/models/sent_responses_model.dart';

import '../../../../main_imports.dart';
import '../../data/repos/request_repo.dart';
import 'request_details_states.dart';


class RequestDetailsCubit extends Cubit<RequestDetailsStates> {
  RequestDetailsCubit(this.requestDetailsRepo) : super(RequestDetailsInitState());

  RequestDetailsRepo? requestDetailsRepo;
  static RequestDetailsCubit get(context) => BlocProvider.of(context);



  RequestDetailsModel? requestDetailsModel;
  Future<void> requestDetails({required int requestId}) async {
    emit(GetRequestDetailsLoadingState());
    var result = await requestDetailsRepo!.requestDetails(requestId: requestId);
    return result.fold((failure) {
      emit(GetRequestDetailsErrorState(failure.errMessage));
    }, (data) async {
      requestDetailsModel = data;
      emit(GetRequestDetailsSuccessState(data));
    });
  }


  int selectedIndex = 0;

  void changeTab(int index) {
    selectedIndex = index;
    emit(RequestDetailsChangeTabState());
  }

  // ================= Sent Responses Pagination =================
  SentResponsesModel? sentResponsesModel;
  List<SentResponseItem> sentResponsesList = [];
  int sentResponsesLimit = 10;
  int sentResponsesOffset = 0;
  int sentResponsesTotalCount = 0;
  bool sentResponsesHasMore = true;
  bool isLoadingMoreSentResponses = false;

  Future<void> getSentResponses({
    required int requestId,
    int? senderId,
    int? brokerId,
    bool isLoadMore = false,
    int? limit,
  }) async {
    final int effectiveLimit = limit ?? sentResponsesLimit;
    final int sender = senderId ?? CacheHelper.getData(key: StorageKeys.userId) as int? ?? 0;
    final int broker = brokerId ?? CacheHelper.getData(key: StorageKeys.brokerId) as int? ?? 0;

    if (isLoadMore) {
      if (isLoadingMoreSentResponses || !sentResponsesHasMore) return;
      isLoadingMoreSentResponses = true;
      emit(GetSentResponsesLoadMoreLoadingState());
    } else {
      // fresh load / reset pagination
      sentResponsesOffset = 0;
      sentResponsesHasMore = true;
      sentResponsesList = [];
      sentResponsesTotalCount = 0;
      emit(GetSentResponsesLoadingState());
    }

    final result = await requestDetailsRepo!.getSentResponses(
      requestId: requestId,
      senderId: sender,
      brokerId: broker,
      limit: effectiveLimit,
      offset: sentResponsesOffset,
    );

    result.fold(
      (failure) {
        isLoadingMoreSentResponses = false;
        if (isLoadMore) {
          emit(GetSentResponsesLoadMoreErrorState(failure.errMessage));
        } else {
          emit(GetSentResponsesErrorState(failure.errMessage));
        }
      },
      (data) {
        sentResponsesModel = data;
        final newItems = data.data ?? [];
        sentResponsesTotalCount = data.count ?? data.totalCount ?? newItems.length;

        if (isLoadMore) {
          sentResponsesList.addAll(newItems);
          sentResponsesOffset += newItems.length;
        } else {
          sentResponsesList = newItems;
          sentResponsesOffset = newItems.length;
        }

        // hasMore if offset < totalCount and last fetch was full page
        if (sentResponsesTotalCount > 0) {
          sentResponsesHasMore = sentResponsesOffset < sentResponsesTotalCount;
        } else {
          sentResponsesHasMore = newItems.length >= effectiveLimit;
        }

        isLoadingMoreSentResponses = false;
        if (isLoadMore) {
          emit(GetSentResponsesLoadMoreSuccessState(data));
        } else {
          emit(GetSentResponsesSuccessState(data));
        }
      },
    );
  }

  Future<void> loadMoreSentResponses({required int requestId, int? senderId, int? brokerId}) async {
    await getSentResponses(requestId: requestId, senderId: senderId, brokerId: brokerId, isLoadMore: true);
  }

  Future<void> refreshSentResponses({required int requestId, int? senderId, int? brokerId}) async {
    await getSentResponses(requestId: requestId, senderId: senderId, brokerId: brokerId, isLoadMore: false);
  }

}
