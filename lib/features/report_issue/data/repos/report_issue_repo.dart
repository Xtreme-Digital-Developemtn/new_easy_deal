import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/params/report_issue_parms.dart';
import '../models/report_issue_model.dart';

abstract class ReportIssueRepo{

   Future<Either<Failure,ReportIssueModel>> reportIssue({required ReportIssueParms reportIssueParms});




}