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
  List<RequestItem> sentRequests = [];
  List<RequestItem> receivedRequests = [];
  AllRequestModel? assignedModel;
  AllRequestModel? sentModel;
  AllRequestModel? receivedModel;

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

  int get assignedCount => assignedRequests.length;
  int get sentCount => sentRequests.length;
  int get receivedCount => receivedRequests.length;

  RequestType currentType = RequestType.assigned;

  Future<void> fetchAllTypes({required BuildContext context}) async {
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
      });
      results[1].fold((_) {}, (data) {
        sentModel = data;
        sentRequests = data.data.data;
      });
      results[2].fold((_) {}, (data) {
        receivedModel = data;
        receivedRequests = data.data.data;
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
}
