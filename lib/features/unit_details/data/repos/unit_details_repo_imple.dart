import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../../core/utils/params/unit_inquiry_parms.dart';
import '../../../../main_imports.dart';
import '../models/unit_details_model.dart';
import 'unit_details_repo.dart';

class UnitDetailsRepoImpl implements UnitDetailsRepo {
  final ApiService? apiService;

  UnitDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UnitDetailsModel>> getUnitDetails({required dynamic unitId}) async {
    try {
      var response = await apiService!.getData(
        endPoint: "${EndPoints.unitDetails}/$unitId",
      );
      UnitDetailsModel result = UnitDetailsModel.fromJson(
        response.data,
      );
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> sendInquiry({
    required UnitInquiryParms unitInquiryParms,
  }) async {
    try {
      final title =
          "استفسار عن الوحدة رقم ${unitInquiryParms.unitId} من ${unitInquiryParms.name}";
      final description =
          "${unitInquiryParms.message}\nالاسم: ${unitInquiryParms.name}\nرقم الهاتف: ${unitInquiryParms.phone}";

      final Map<String, dynamic> body = {
        "type": "inquiry",
        "contact_phone": unitInquiryParms.phone,
        "is_active": true,
      };

      /// العنوان والوصف حسب اللغة زي ما البلاغات بتتبعت
      if (unitInquiryParms.context.isArabic) {
        body["title_ar"] = title;
        body["description_ar"] = description;
      } else {
        body["title_en"] = title;
        body["description_en"] = description;
      }

      await apiService!.postData(
        endPoint: EndPoints.unitInquiry,
        data: json.encode(body),
      );

      return right(true);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
