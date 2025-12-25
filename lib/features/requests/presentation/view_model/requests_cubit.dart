import 'package:easy_deal/features/requests/data/models/all_request_model.dart';

import '../../../../main_imports.dart';
import '../../data/repos/requests_repo.dart';
import 'requests_states.dart';

class RequestsCubit extends Cubit<RequestsStates> {
  RequestsCubit(this.requestsRepo) : super(RequestsInitState());

  RequestsRepo? requestsRepo;

  static RequestsCubit get(context) => BlocProvider.of(context);


  AllRequestModel? allRequestModel;
  Future<void> getAllRequests() async {
    emit(GetAllRequestsLoadingState());
    var result = await requestsRepo!.getAllRequest();
    return result.fold((failure) {
      emit(GetAllRequestsErrorState(failure.errMessage));
    }, (data) async {
      allRequestModel = data;
      emit(GetAllRequestsSuccessState(data));
    });
  }



}