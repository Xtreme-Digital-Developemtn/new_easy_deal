import 'package:easy_deal/features/requests/data/models/all_request_model.dart';

abstract class RequestsStates{}

class RequestsInitState extends RequestsStates{}


class GetAllRequestsLoadingState extends RequestsStates{}
class GetAllRequestsErrorState extends RequestsStates{
  final String error;
  GetAllRequestsErrorState(this.error);

}
class GetAllRequestsSuccessState extends RequestsStates{
  final AllRequestModel allRequestModel;
  GetAllRequestsSuccessState(this.allRequestModel);

}

