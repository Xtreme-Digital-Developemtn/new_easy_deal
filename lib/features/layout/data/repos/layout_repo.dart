import 'package:dartz/dartz.dart';
import 'package:easy_deal/features/layout/data/models/send_fcm_model.dart';
import '../../../../core/errors/failure.dart';

abstract class LayoutRepo{

  Future<Either<Failure,SendFcmModel>> sendFcmToken({required String fcmToken});




}