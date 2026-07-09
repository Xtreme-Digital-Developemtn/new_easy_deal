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

  int limit = 3;
  int offset = 0;

  bool hasMore = true;
  bool isLoadingMore = false;

  List<RequestItem> requests = [];
  List<RequestItem> assignedRequests = [];
  AllRequestModel? allRequestModel;
  Future<void> getAllRequests({required BuildContext context}) async {
    offset = 0;
    hasMore = true;
    emit(GetAllRequestsLoadingState());
    var result = await requestsRepo!.getAllRequests(
      limit: limit,
      offset: offset,
      type: currentType,
      context: context
    );
    return result.fold((failure) {
      emit(GetAllRequestsErrorState(failure.errMessage));
    }, (data) async {
      requests = data.data.data;
      allRequestModel = data;
      final profile = ProfileCubit.get(context).clientProfileModel;

      final userId = profile?.data?.id;

      assignedRequests = requests.where((request) {
        return request.assignedBrokers.any(
          (broker) => broker.senderId?.toString() == userId?.toString(),
        );
      }).toList();
      hasMore = requests.length >= limit;
      emit(GetAllRequestsSuccessState(data));
    });
  }
  Future<void> loadMoreRequests({required BuildContext context }) async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;

    offset += limit;

    var result = await requestsRepo!.getAllRequests(
      limit: limit,
      offset: offset,
        type : currentType,
      context: context,
    );

    result.fold(
          (failure) {
        isLoadingMore = false;
      },
          (data) {
        final newRequests = data.data.data;

        requests.addAll(newRequests);

        final profile = ProfileCubit.get(context).clientProfileModel;
        final userId = profile?.data?.id;
        assignedRequests = requests.where((request) {
          return request.assignedBrokers.any(
            (broker) => broker.senderId?.toString() == userId?.toString(),
          );
        }).toList();

        if (newRequests.length < limit) {
          hasMore = false;
        }

        isLoadingMore = false;

        emit(GetAllRequestsSuccessState(data));
      },
    );
  }
  RequestType currentType = RequestType.assigned;
  void changeType(RequestType type , BuildContext context) {
    currentType = type;
    getAllRequests(context: context);
  }





}