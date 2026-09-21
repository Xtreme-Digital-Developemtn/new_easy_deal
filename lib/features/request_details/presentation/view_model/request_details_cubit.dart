import '../../data/models/replies_model.dart';
import '../../data/models/request_details_model.dart';
import '../../data/models/sent_responses_model.dart';
import '../../data/models/recommended_model.dart';

import '../../../../main_imports.dart';
import '../../data/repos/request_repo.dart';
import 'request_details_states.dart';


class RequestDetailsCubit extends Cubit<RequestDetailsStates> {
  RequestDetailsCubit(this.requestDetailsRepo) : super(RequestDetailsInitState());

  RequestDetailsRepo? requestDetailsRepo;
  static RequestDetailsCubit get(context) => BlocProvider.of(context);



  RequestDetailsModel? requestDetailsModel;
  int? _parseId(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is String) return int.tryParse(v);
    return int.tryParse(v.toString());
  }

  Future<void> requestDetails({required int requestId}) async {
    if (state is GetRequestDetailsLoadingState) return;
    emit(GetRequestDetailsLoadingState());
    var result = await requestDetailsRepo!.requestDetails(requestId: requestId);
    return result.fold((failure) {
      emit(GetRequestDetailsErrorState(failure.errMessage));
    }, (data) async {
      requestDetailsModel = data;
      emit(GetRequestDetailsSuccessState(data));
      // Auto load all lists on page open (without button) - نفس الطريقة
      getReplies(requestId: requestId);
      getSentResponses(requestId: requestId);
      getRecommendedUnits(requestId: requestId);
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
    final int? cachedSender = _parseId(CacheHelper.getData(key: StorageKeys.userId));
    final int? cachedBroker = _parseId(CacheHelper.getData(key: StorageKeys.brokerId));
    final int? sender = senderId ?? cachedSender;
    final int? broker = brokerId ?? cachedBroker;

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

  // ================= Replies (request/replies) Pagination - نفس الطريقة =================
  RepliesModel? repliesModel;
  List<ReplyData> repliesList = [];
  List<Units> repliesUnitsFlat = [];
  int repliesLimit = 10;
  int repliesOffset = 0;
  int repliesTotalCount = 0;
  bool repliesHasMore = true;
  bool isLoadingMoreReplies = false;

  Future<void> getReplies({
    required int requestId,
    int? brokerId,
    int? senderId,
    bool isLoadMore = false,
    int? limit,
  }) async {
    final int effectiveLimit = limit ?? repliesLimit;
    final int? cachedBroker = _parseId(CacheHelper.getData(key: StorageKeys.brokerId));
    final int? cachedSender = _parseId(CacheHelper.getData(key: StorageKeys.userId));
    final int? broker = brokerId ?? cachedBroker;
    final int? sender = senderId ?? cachedSender;

    if (isLoadMore) {
      if (isLoadingMoreReplies || !repliesHasMore) return;
      isLoadingMoreReplies = true;
      emit(GetRepliesLoadMoreLoadingState());
    } else {
      repliesOffset = 0;
      repliesHasMore = true;
      repliesList = [];
      repliesUnitsFlat = [];
      repliesTotalCount = 0;
      emit(GetRepliesLoadingState());
    }

    final result = await requestDetailsRepo!.getReplies(
      requestId: requestId,
      brokerId: broker,
      senderId: sender,
      limit: effectiveLimit,
      offset: repliesOffset,
    );

    result.fold(
      (failure) {
        isLoadingMoreReplies = false;
        if (isLoadMore) {
          emit(GetRepliesLoadMoreErrorState(failure.errMessage));
        } else {
          emit(GetRepliesErrorState(failure.errMessage));
        }
      },
      (data) {
        repliesModel = data;
        final newItems = data.data ?? [];
        repliesTotalCount = data.count ?? newItems.length;

        if (isLoadMore) {
          repliesList.addAll(newItems);
          repliesOffset += newItems.length;
        } else {
          repliesList = newItems;
          repliesOffset = newItems.length;
        }

        repliesUnitsFlat = repliesList.expand((e) => e.units ?? <Units>[]).toList();

        if (repliesTotalCount > 0) {
          repliesHasMore = repliesOffset < repliesTotalCount;
        } else {
          repliesHasMore = newItems.length >= effectiveLimit;
        }

        isLoadingMoreReplies = false;
        if (isLoadMore) {
          emit(GetRepliesLoadMoreSuccessState(data));
        } else {
          emit(GetRepliesSuccessState(data));
        }
      },
    );
  }

  Future<void> loadMoreReplies({required int requestId, int? brokerId}) async {
    await getReplies(requestId: requestId, brokerId: brokerId, isLoadMore: true);
  }

  Future<void> refreshReplies({required int requestId, int? brokerId}) async {
    await getReplies(requestId: requestId, brokerId: brokerId, isLoadMore: false);
  }

  // ================= Recommended (requests/recommend/units) Pagination - نفس الطريقة =================
  RecommendedModel? recommendedModel;
  List<RecommendedData> recommendedList = [];
  int recommendedLimit = 10;
  int recommendedOffset = 0;
  int recommendedTotalCount = 0;
  bool recommendedHasMore = true;
  bool isLoadingMoreRecommended = false;

  Future<void> getRecommendedUnits({
    required int requestId,
    int? brokerId,
    bool isLoadMore = false,
    int? limit,
  }) async {
    final int effectiveLimit = limit ?? recommendedLimit;
    final int? cachedBroker = _parseId(CacheHelper.getData(key: StorageKeys.brokerId));
    // brokerId من الـ URL path - لو مش موجود نستخدم الـ cached أو 1 كـ fallback للـ example 1205/1
    final int broker = brokerId ?? cachedBroker ?? 1;

    if (isLoadMore) {
      if (isLoadingMoreRecommended || !recommendedHasMore) return;
      isLoadingMoreRecommended = true;
      emit(GetRecommendedLoadMoreLoadingState());
    } else {
      recommendedOffset = 0;
      recommendedHasMore = true;
      recommendedList = [];
      recommendedTotalCount = 0;
      emit(GetRecommendedLoadingState());
    }

    final result = await requestDetailsRepo!.getRecommendedUnits(
      requestId: requestId,
      brokerId: broker,
      limit: effectiveLimit,
      offset: recommendedOffset,
    );

    result.fold(
      (failure) {
        isLoadingMoreRecommended = false;
        if (isLoadMore) {
          emit(GetRecommendedLoadMoreErrorState(failure.errMessage));
        } else {
          emit(GetRecommendedErrorState(failure.errMessage));
        }
      },
      (data) {
        recommendedModel = data;
        final newItems = data.data ?? [];
        recommendedTotalCount = data.count ?? newItems.length;

        if (isLoadMore) {
          recommendedList.addAll(newItems);
          recommendedOffset += newItems.length;
        } else {
          recommendedList = newItems;
          recommendedOffset = newItems.length;
        }

        if (recommendedTotalCount > 0) {
          recommendedHasMore = recommendedOffset < recommendedTotalCount;
        } else {
          recommendedHasMore = newItems.length >= effectiveLimit;
        }

        isLoadingMoreRecommended = false;
        if (isLoadMore) {
          emit(GetRecommendedLoadMoreSuccessState(data));
        } else {
          emit(GetRecommendedSuccessState(data));
        }
      },
    );
  }

  Future<void> loadMoreRecommended({required int requestId, int? brokerId}) async {
    await getRecommendedUnits(requestId: requestId, brokerId: brokerId, isLoadMore: true);
  }

  Future<void> refreshRecommended({required int requestId, int? brokerId}) async {
    await getRecommendedUnits(requestId: requestId, brokerId: brokerId, isLoadMore: false);
  }

}
