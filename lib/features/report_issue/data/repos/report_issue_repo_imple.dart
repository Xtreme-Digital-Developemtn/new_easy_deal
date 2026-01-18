import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/report_issue/data/repos/report_issue_repo.dart';
import '../../../../core/utils/params/report_issue_parms.dart';
import '../../../../main_imports.dart';
import '../models/report_issue_model.dart';


class ReportIssueRepoImpl implements ReportIssueRepo {
  final ApiService? apiService;
  ReportIssueRepoImpl(this.apiService);




  @override
  Future<Either<Failure, ReportIssueModel>> reportIssue({
    required ReportIssueParms reportIssueParms,
  }) async {
    try {
      final Map<String, dynamic> body = {
        "type": reportIssueParms.type,
        "contact_email": reportIssueParms.email,
        "contact_phone": reportIssueParms.phone,
        "is_active": true,
      };

      /// العنوان والوصف حسب اللغة
      if (reportIssueParms.context.isArabic) {
        body["title_ar"] = reportIssueParms.title;
        body["description_ar"] = reportIssueParms.description;
      } else {
        body["title_en"] = reportIssueParms.title;
        body["description_en"] = reportIssueParms.description;
      }

      final response = await apiService!.postData(
        endPoint: EndPoints.reportsIssues,
        data: json.encode(body),
      );

      final result = ReportIssueModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }









}