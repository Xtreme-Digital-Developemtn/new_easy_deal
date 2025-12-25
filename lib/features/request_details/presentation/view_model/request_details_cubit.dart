import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';

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


}