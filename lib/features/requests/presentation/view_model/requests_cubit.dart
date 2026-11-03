import 'package:easy_deal/features/requests/data/models/all_request_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/toast/toast.dart';
import '../../../../main_imports.dart';
import '../../../profile/presentation/view_model/profile_cubit.dart';
import '../../data/repos/requests_repo.dart';
import 'requests_states.dart';

/// خطأ جوّاني بنرميه من دوال التحميل الفرعية عشان نوصّل رسالة الفشل
/// للمستخدم زي ما هي، من غير بادئة "Exception:".
class RequestsFetchException implements Exception {
  final String message;

  RequestsFetchException(this.message);

  @override
  String toString() => message;
}

class RequestsCubit extends Cubit<RequestsStates> {
  RequestsCubit(this.requestsRepo) : super(RequestsInitState());

  RequestsRepo? requestsRepo;

  static RequestsCubit get(context) => BlocProvider.of(context);

  int limit = 100;

  /// التابات الفرعية (بواسطتي / المرسلة / المستلمة) بتظهر للوسيط بس،
  /// والعميل بيشوف قائمة واحدة فيها كل طلباته.
  bool get isBroker => CacheHelper.getData(key: "userRole") == "broker";

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
  int sentTotalCount = 0;

  int get assignedCount => assignedTotalCount;
  int get sentCount => sentTotalCount;
  int get receivedCount => receivedRequests.length;

  /// الرقم اللي بيظهر جنب «الطلبات» فوق. تاب «المستلمة» بيجي مفلتر من
  /// السيرفر فعدده مضبوط، أما «بواسطتي» و«المرسلة» فبيتفلتروا محليًا
  /// فبنعرض عدد الكروت المحمّلة فعلًا بدل عدد السيرفر الكلي.
  int get displayCount {
    if (currentType == RequestType.received) {
      return _asInt(receivedModel?.data.count) ?? receivedRequests.length;
    }
    return currentList.length;
  }

  static bool _isSameId(dynamic a, dynamic b) {
    if (a == null || b == null) return false;
    final numA = num.tryParse(a.toString());
    final numB = num.tryParse(b.toString());
    if (numA != null && numB != null) return numA == numB;
    return a.toString() == b.toString();
  }

  static int? _asInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    return num.tryParse(v.toString())?.toInt();
  }

  /// العميل بيبدأ (ويفضل) على قائمة «المستلمة» لأنها هي الوحيدة اللي بترجع
  /// طلباته كلها من غير فلترة محلية على الوسطاء المعيّنين.
  RequestType currentType = CacheHelper.getData(key: "userRole") == "broker"
      ? RequestType.assigned
      : RequestType.received;

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

  /// Fetches the first page of "sent" requests and filters them
  /// client-side by the request's own `user.id` as a safety net (in case
  /// the server-side `userId` filter is ever unreliable, as happens with
  /// the "assigned" endpoint). The badge count is the number of cards we
  /// actually show, so the badge and the list can never disagree.
  Future<void> _fetchSentFirstPage({
    required BuildContext context,
    required dynamic userId,
    Map<String, dynamic>? filters,
  }) async {
    final result = await requestsRepo!.getAllRequests(
      limit: limit,
      offset: 0,
      type: RequestType.sent,
      context: context,
      filters: filters,
    );

    String? error;
    result.fold((failure) => error = failure.errMessage, (_) {});
    if (error != null) throw RequestsFetchException(error!);

    final data = result.fold((_) => null, (data) => data)!;
    sentModel = data;
    sentRequests = data.data.data
        .where((request) => _isSameId(request.user.id, userId))
        .toList();
    sentTotalCount = sentRequests.length;
    sentOffset = data.data.data.length;
    sentHasMore = sentOffset < (_asInt(data.data.count) ?? 0);
  }

  /// The API's `senderId` query param does not actually filter the "assigned"
  /// list server-side, so we filter the raw results client-side by
  /// `assignedBrokers`. Paging keeps walking the raw pages, so requests
  /// beyond the first `limit` are still reachable by scrolling.
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
    if (error != null) throw RequestsFetchException(error!);

    final data = result.fold((_) => null, (data) => data)!;
    assignedModel = data;
    final requests = <RequestItem>[];
    final receiverNames = <String?>[];
    _expandAssignedMatches(data.data.data, userId, requests, receiverNames);
    assignedRequests = requests;
    assignedReceiverNames = receiverNames;
    assignedTotalCount = requests.length;
    assignedOffset = data.data.data.length;
    assignedHasMore = assignedOffset < (_asInt(data.data.count) ?? 0);
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
    sentTotalCount = 0;
    assignedRequests = [];
    assignedReceiverNames = [];
    sentRequests = [];
    receivedRequests = [];
    assignedHasMore = true;
    sentHasMore = true;
    receivedHasMore = true;
    _currentFilters = filters;
    currentType = isBroker ? RequestType.assigned : RequestType.received;
    emit(GetAllRequestsLoadingState());

    final profile = ProfileCubit.get(context).clientProfileModel;
    final userId = profile?.data?.id;
    if (userId == null) {
      emit(GetAllRequestsErrorState(LangKeys.somethingWentWrong.tr()));
      return;
    }

    try {
      final receivedResult = await requestsRepo!.getAllRequests(
        limit: limit,
        offset: 0,
        type: RequestType.received,
        context: context,
        filters: filters,
      );

      final receivedError = receivedResult.fold((failure) => failure.errMessage, (data) => null);
      if (receivedError != null) {
        emit(GetAllRequestsErrorState(receivedError));
        return;
      }

      receivedResult.fold((_) {}, (data) {
        receivedModel = data;
        receivedRequests = data.data.data;
        receivedOffset = data.data.data.length;
        receivedHasMore = receivedOffset < (data.data.count ?? 0);
      });

      /// تابات «بواسطتي» و«المرسلة» للوسيط بس، فمفيش داعي نحمّلهم للعميل
      /// (كانوا بيتبعتوا 3 نداءات بنفس الكويري بالظبط).
      if (!isBroker) {
        emit(GetAllRequestsSuccessState(receivedModel!));
        return;
      }

      await Future.wait([
        _fetchSentFirstPage(context: context, userId: userId, filters: filters),
        _fetchAssignedFirstPage(context: context, userId: userId, filters: filters),
      ]);

      currentType = RequestType.assigned;
      emit(GetAllRequestsSuccessState(assignedModel ?? sentModel!));
    } catch (e) {
      emit(GetAllRequestsErrorState(
        e is RequestsFetchException ? e.message : LangKeys.somethingWentWrong.tr(),
      ));
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
          /// فشل التحميل الإضافي مالازمش يمسح القائمة اللي ظاهرة قدام
          /// المستخدم، فبنعرض توست وبنسيب البيانات مكانها.
          isLoadingMore = false;
          if (context.mounted) {
            Toast.showErrorToast(msg: failure.errMessage, context: context);
          }
          emit(GetAllRequestsSuccessState(model));
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
              final newSentItems = data.data.data
                  .where((request) => _isSameId(request.user.id, userId))
                  .toList();
              sentRequests = [...sentRequests, ...newSentItems];
              sentTotalCount = sentRequests.length;
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
      if (context.mounted) {
        Toast.showErrorToast(
          msg: e is RequestsFetchException
              ? e.message
              : LangKeys.somethingWentWrong.tr(),
          context: context,
        );
      }
      emit(GetAllRequestsSuccessState(model));
    }
  }
}
