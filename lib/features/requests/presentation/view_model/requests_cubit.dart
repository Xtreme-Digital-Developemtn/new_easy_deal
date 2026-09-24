import 'package:easy_deal/features/requests/data/models/all_request_model.dart';

import '../../../../core/utils/enums.dart';
import '../../../../main_imports.dart';
import '../../../profile/presentation/view_model/profile_cubit.dart';
import '../../data/repos/requests_repo.dart';
import 'requests_states.dart';

class RequestsCubit extends Cubit<RequestsStates> {
  RequestsCubit(this.requestsRepo) : super(RequestsInitState());

  RequestsRepo? requestsRepo;

  static RequestsCubit get(context) => BlocProvider.of(context);

  int limit = 100;

  List<RequestItem> assignedRequests = [];
  List<String?> assignedReceiverNames = [];
  List<RequestItem> sentRequests = [];
  List<RequestItem> receivedRequests = [];
  AllRequestModel? assignedModel;
  AllRequestModel? sentModel;
  AllRequestModel? receivedModel;

  int assignedOffset = 0;
  int sentOffset = 0;
  int receivedOffset = 0;
  bool assignedHasMore = true;
  bool sentHasMore = true;
  bool receivedHasMore = true;
  bool isLoadingMore = false;

  Map<String, dynamic>? _currentFilters;

  List<RequestItem> get currentList {
    switch (currentType) {
      case RequestType.assigned:
        return assignedRequests;
      case RequestType.sent:
        return sentRequests;
      case RequestType.received:
        return receivedRequests;
    }
  }

  List<String?>? get currentReceiverNames {
    return currentType == RequestType.assigned ? assignedReceiverNames : null;
  }

  AllRequestModel? get currentModel {
    switch (currentType) {
      case RequestType.assigned:
        return assignedModel;
      case RequestType.sent:
        return sentModel;
      case RequestType.received:
        return receivedModel;
    }
  }

  int get currentOffset {
    switch (currentType) {
      case RequestType.assigned:
        return assignedOffset;
      case RequestType.sent:
        return sentOffset;
      case RequestType.received:
        return receivedOffset;
    }
  }

  bool get currentHasMore {
    switch (currentType) {
      case RequestType.assigned:
        return assignedHasMore;
      case RequestType.sent:
        return sentHasMore;
      case RequestType.received:
        return receivedHasMore;
    }
  }

  int assignedTotalCount = 0;

  int get assignedCount => assignedTotalCount;
  int get sentCount => sentRequests.length;
  int get receivedCount => receivedRequests.length;

  static bool _isSameId(dynamic a, dynamic b) {
    if (a == null || b == null) return false;
    final numA = num.tryParse(a.toString());
    final numB = num.tryParse(b.toString());
    if (numA != null && numB != null) return numA == numB;
    return a.toString() == b.toString();
  }

  RequestType currentType = RequestType.assigned;

  List<AssignedBroker> _matchingAssignments(RequestItem request, dynamic userId) {
    return request.assignedBrokers
        .where((broker) => _isSameId(broker.senderId, userId))
        .toList();
  }

  /// Expands each request into one entry per matching assignment, so a
  /// request assigned to several brokers shows up once per assignment
  /// instead of being collapsed into a single card.
  void _expandAssignedMatches(
    List<RequestItem> requests,
    dynamic userId,
    List<RequestItem> outRequests,
    List<String?> outReceiverNames,
  ) {
    for (final request in requests) {
      for (final broker in _matchingAssignments(request, userId)) {
        outRequests.add(request);
        outReceiverNames.add(broker.receiverName?.toString());
      }
    }
  }

  /// The API's `senderId` query param does not actually filter the "assigned"
  /// list server-side, so we only look at the first page of raw results
  /// (the most recent `limit` requests) and filter those client-side by
  /// `assignedBrokers`.
  Future<void> _fetchAssignedFirstPage({
    required BuildContext context,
    required dynamic userId,
    Map<String, dynamic>? filters,
  }) async {
    final result = await requestsRepo!.getAllRequests(
      limit: limit,
      offset: 0,
      type: RequestType.assigned,
      context: context,
      filters: filters,
    );

    String? error;
    result.fold((failure) => error = failure.errMessage, (_) {});
    if (error != null) throw Exception(error);

    final data = result.fold((_) => null, (data) => data)!;
    assignedModel = data;
    final requests = <RequestItem>[];
    final receiverNames = <String?>[];
    _expandAssignedMatches(data.data.data, userId, requests, receiverNames);
    assignedRequests = requests;
    assignedReceiverNames = receiverNames;
    assignedTotalCount = requests.length;
    assignedOffset = data.data.data.length;
    assignedHasMore = false;
  }

  Future<void> fetchAllTypes({
    required BuildContext context,
    Map<String, dynamic>? filters,
  }) async {
    isLoadingMore = false;
    assignedOffset = 0;
    sentOffset = 0;
    receivedOffset = 0;
    assignedTotalCount = 0;
    assignedRequests = [];
    assignedReceiverNames = [];
    assignedHasMore = true;
    sentHasMore = true;
    receivedHasMore = true;
    _currentFilters = filters;
    emit(GetAllRequestsLoadingState());

    final profile = ProfileCubit.get(context).clientProfileModel;
    final userId = profile?.data?.id;
    if (userId == null) {
      emit(GetAllRequestsErrorState("Profile not loaded. Please try again."));
      return;
    }

    try {
      final results = await Future.wait([
        requestsRepo!.getAllRequests(limit: limit, offset: 0, type: RequestType.sent, context: context, filters: filters),
        requestsRepo!.getAllRequests(limit: limit, offset: 0, type: RequestType.received, context: context, filters: filters),
      ]);

      for (final result in results) {
        final error = result.fold((failure) => failure.errMessage, (data) => null);
        if (error != null) {
          emit(GetAllRequestsErrorState(error));
          return;
        }
      }

      results[0].fold((_) {}, (data) {
        sentModel = data;
        sentRequests = data.data.data;
        sentOffset = data.data.data.length;
        sentHasMore = sentOffset < (data.data.count ?? 0);
      });
      results[1].fold((_) {}, (data) {
        receivedModel = data;
        receivedRequests = data.data.data;
        receivedOffset = data.data.data.length;
        receivedHasMore = receivedOffset < (data.data.count ?? 0);
      });

      await _fetchAssignedFirstPage(context: context, userId: userId, filters: filters);

      currentType = RequestType.assigned;
      emit(GetAllRequestsSuccessState(assignedModel ?? sentModel!));
    } catch (e) {
      emit(GetAllRequestsErrorState(e.toString()));
    }
  }

  void changeType(RequestType type) {
    if (currentType == type) return;
    currentType = type;
    if (currentModel != null) {
      emit(GetAllRequestsSuccessState(currentModel!));
    }
  }

  Future<void> loadMore({required BuildContext context}) async {
    if (isLoadingMore || !currentHasMore) return;
    final model = currentModel;
    if (model == null) return;

    isLoadingMore = true;
    emit(GetAllRequestsSuccessState(model));

    try {
      final profile = ProfileCubit.get(context).clientProfileModel;
      final userId = profile?.data?.id;

      final result = await requestsRepo!.getAllRequests(
        limit: limit,
        offset: currentOffset,
        type: currentType,
        context: context,
        filters: _currentFilters,
      );

      result.fold(
        (failure) {
          isLoadingMore = false;
          emit(GetAllRequestsErrorState(failure.errMessage));
        },
        (data) {
          switch (currentType) {
            case RequestType.assigned:
              final newRequests = <RequestItem>[];
              final newReceiverNames = <String?>[];
              _expandAssignedMatches(data.data.data, userId, newRequests, newReceiverNames);
              assignedRequests = [...assignedRequests, ...newRequests];
              assignedReceiverNames = [...assignedReceiverNames, ...newReceiverNames];
              assignedTotalCount = assignedRequests.length;
              assignedOffset += data.data.data.length;
              assignedHasMore = assignedOffset < (data.data.count ?? 0);
              break;
            case RequestType.sent:
              sentRequests = [...sentRequests, ...data.data.data];
              sentOffset += data.data.data.length;
              sentHasMore = sentOffset < (data.data.count ?? 0);
              break;
            case RequestType.received:
              receivedRequests = [...receivedRequests, ...data.data.data];
              receivedOffset += data.data.data.length;
              receivedHasMore = receivedOffset < (data.data.count ?? 0);
              break;
          }
          isLoadingMore = false;
          emit(GetAllRequestsSuccessState(currentModel!));
        },
      );
    } catch (e) {
      isLoadingMore = false;
      emit(GetAllRequestsErrorState(e.toString()));
    }
  }
}
