import 'package:easy_deal/features/requests/data/models/all_request_model.dart';

import '../../../../main_imports.dart';
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
  AllRequestModel? allRequestModel;
  Future<void> getAllRequests() async {
    offset = 0;
    hasMore = true;
    emit(GetAllRequestsLoadingState());
    var result = await requestsRepo!.getAllRequest(limit: limit, offset: offset);
    return result.fold((failure) {
      emit(GetAllRequestsErrorState(failure.errMessage));
    }, (data) async {
      requests = data.data.data ;

      hasMore = requests.length >= limit;
      emit(GetAllRequestsSuccessState(data));
    });
  }
  Future<void> loadMoreRequests() async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;

    offset += limit;

    var result = await requestsRepo!.getAllRequest(
      limit: limit,
      offset: offset,
    );

    result.fold(
          (failure) {
        isLoadingMore = false;
      },
          (data) {
        final newRequests = data.data.data  ;

        requests.addAll(newRequests);

        if (newRequests.length < limit) {
          hasMore = false;
        }

        isLoadingMore = false;

        emit(GetAllRequestsSuccessState(data));
      },
    );
  }


}