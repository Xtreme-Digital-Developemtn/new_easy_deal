import 'package:easy_deal/features/request_details/data/models/replies_model.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/data/models/sent_responses_model.dart';
 
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

class RequestDetailsChangeTabState extends RequestDetailsStates {}


// Sent Responses pagination states
class GetSentResponsesLoadingState extends RequestDetailsStates {}
class GetSentResponsesSuccessState extends RequestDetailsStates {
  final SentResponsesModel model;
  GetSentResponsesSuccessState(this.model);
}
class GetSentResponsesErrorState extends RequestDetailsStates {
  final String error;
  GetSentResponsesErrorState(this.error);
}
class GetSentResponsesLoadMoreLoadingState extends RequestDetailsStates {}
class GetSentResponsesLoadMoreSuccessState extends RequestDetailsStates {
  final SentResponsesModel model;
  GetSentResponsesLoadMoreSuccessState(this.model);
}
class GetSentResponsesLoadMoreErrorState extends RequestDetailsStates {
  final String error;
  GetSentResponsesLoadMoreErrorState(this.error);
}

// Replies (request/replies) pagination states - نفس النمط بنفس الباجينيشن
class GetRepliesLoadingState extends RequestDetailsStates {}
class GetRepliesSuccessState extends RequestDetailsStates {
  final RepliesModel model;
  GetRepliesSuccessState(this.model);
}
class GetRepliesErrorState extends RequestDetailsStates {
  final String error;
  GetRepliesErrorState(this.error);
}
class GetRepliesLoadMoreLoadingState extends RequestDetailsStates {}
class GetRepliesLoadMoreSuccessState extends RequestDetailsStates {
  final RepliesModel model;
  GetRepliesLoadMoreSuccessState(this.model);
}
class GetRepliesLoadMoreErrorState extends RequestDetailsStates {
  final String error;
  GetRepliesLoadMoreErrorState(this.error);
}



