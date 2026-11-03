import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/params/unit_inquiry_parms.dart';
import '../models/unit_details_model.dart';

abstract class UnitDetailsRepo{

  Future<Either<Failure,UnitDetailsModel>> getUnitDetails({required dynamic unitId});

  Future<Either<Failure,bool>> sendInquiry({required UnitInquiryParms unitInquiryParms});

}
