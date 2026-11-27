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

/// أكشنز صفحة الطلبات (نفس أكشنز تفاصيل الطلب) ==============================
class UpdateRequestStatusLoadingState extends RequestsStates{}

class UpdateRequestStatusSuccessState extends RequestsStates{
  final String message;
  UpdateRequestStatusSuccessState(this.message);
}

class UpdateRequestStatusErrorState extends RequestsStates{
  final String error;
  UpdateRequestStatusErrorState(this.error);
}

class MakeUnitLoadingState extends RequestsStates{}

class MakeUnitSuccessState extends RequestsStates{
  final String message;
  MakeUnitSuccessState(this.message);
}

class MakeUnitErrorState extends RequestsStates{
  final String error;
  MakeUnitErrorState(this.error);
}

