import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/recommended_model.dart';
import '../models/replies_model.dart';
import '../models/request_details_model.dart';
import '../models/sent_responses_model.dart';
import '../models/update_status_model.dart';

abstract class RequestDetailsRepo {
  Future<Either<Failure, RequestDetailsModel>> requestDetails({
    required int requestId,
  });
  Future<Either<Failure, UpdateStatusModel>> updateRequestStatus({
    required int requestId,
    required String status,
    required String userId,
    required String unitId,
  });
  Future<Either<Failure, SentResponsesModel>> getSentResponses({
    required int requestId,
    int? senderId,
    int? brokerId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  });
  Future<Either<Failure, RepliesModel>> getReplies({
    required int requestId,
    int? brokerId,
    int? senderId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  });
  Future<Either<Failure, RecommendedModel>> getRecommendedUnits({
    required int requestId,
    required int brokerId,
    int limit = 10,
    int offset = 0,
    String sort = 'desc',
    String sortBy = 'id',
  });
}
