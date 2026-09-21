import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/request_details_model.dart';
import '../models/sent_responses_model.dart';

abstract class RequestDetailsRepo{

 Future<Either<Failure , RequestDetailsModel>> requestDetails({required int requestId});
 Future<Either<Failure , SentResponsesModel>> getSentResponses({
  required int requestId,
  required int senderId,
  required int brokerId,
  int limit = 10,
  int offset = 0,
  String sort = 'desc',
  String sortBy = 'id',
 });

}
