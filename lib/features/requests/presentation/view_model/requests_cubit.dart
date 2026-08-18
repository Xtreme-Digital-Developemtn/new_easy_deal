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

  int limit = 10;

  List<RequestItem> assignedRequests = [];
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

  int get assignedCount => assignedRequests.length;
  int get sentCount => sentRequests.length;
  int get receivedCount => receivedRequests.length;

  RequestType currentType = RequestType.assigned;

  Future<void> fetchAllTypes({required BuildContext context}) async {
    isLoadingMore = false;
    assignedOffset = 0;
    sentOffset = 0;
    receivedOffset = 0;
    assignedHasMore = true;
    sentHasMore = true;
    receivedHasMore = true;
    emit(GetAllRequestsLoadingState());

    final profile = ProfileCubit.get(context).clientProfileModel;
    if (profile?.data?.id == null) {
      emit(GetAllRequestsErrorState("Profile not loaded. Please try again."));
      return;
    }

    try {
      final results = await Future.wait([
        requestsRepo!.getAllRequests(limit: limit, offset: 0, type: RequestType.assigned, context: context),
        requestsRepo!.getAllRequests(limit: limit, offset: 0, type: RequestType.sent, context: context),
        requestsRepo!.getAllRequests(limit: limit, offset: 0, type: RequestType.received, context: context),
      ]);

      for (final result in results) {
        final error = result.fold((failure) => failure.errMessage, (data) => null);
        if (error != null) {
          emit(GetAllRequestsErrorState(error));
          return;
        }
      }

      results[0].fold((_) {}, (data) {
        assignedModel = data;
        final userId = profile?.data?.id;
        assignedRequests = data.data.data.where((request) {
          return request.assignedBrokers.any(
            (broker) => broker.senderId?.toString() == userId?.toString(),
          );
        }).toList();
        assignedOffset = data.data.data.length;
        assignedHasMore = assignedOffset < (data.data.count ?? 0);
      });
      results[1].fold((_) {}, (data) {
        sentModel = data;
        sentRequests = data.data.data;
        sentOffset = data.data.data.length;
        sentHasMore = sentOffset < (data.data.count ?? 0);
      });
      results[2].fold((_) {}, (data) {
        receivedModel = data;
        receivedRequests = data.data.data;
        receivedOffset = data.data.data.length;
        receivedHasMore = receivedOffset < (data.data.count ?? 0);
      });

      currentType = RequestType.assigned;
      emit(GetAllRequestsSuccessState(assignedModel!));
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
      );

      result.fold(
        (failure) {
          isLoadingMore = false;
          emit(GetAllRequestsErrorState(failure.errMessage));
        },
        (data) {
          switch (currentType) {
            case RequestType.assigned:
              final newItems = data.data.data.where((request) {
                return request.assignedBrokers.any(
                  (broker) => broker.senderId?.toString() == userId?.toString(),
                );
              }).toList();
              assignedRequests = [...assignedRequests, ...newItems];
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
