
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/enums.dart';
import '../../../../main_imports.dart';
import '../models/all_request_model.dart';

abstract class RequestsRepo{

  Future<Either<Failure, AllRequestModel>> getAllRequests({
    required int limit,
    required int offset,
    required RequestType type,
    required BuildContext context,
  });

}