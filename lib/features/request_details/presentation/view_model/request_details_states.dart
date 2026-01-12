import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
 
abstract class RequestDetailsStates{}

class RequestDetailsInitState extends RequestDetailsStates{}

class GetRequestDetailsLoadingState extends RequestDetailsStates{}
class GetRequestDetailsErrorState extends RequestDetailsStates{
  final String error;
  GetRequestDetailsErrorState(this.error);

}
class GetRequestDetailsSuccessState extends RequestDetailsStates{
  final RequestDetailsModel requestDetailsModel;
  GetRequestDetailsSuccessState(this.requestDetailsModel);

}





