import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/register_model.dart';
import '../models/send_otp_model.dart';
import '../models/verify_otp_model.dart';

abstract class RegisterRepo{

  Future<Either<Failure,RegisterModel>> register({required FormData data});
  Future<Either<Failure,SendOtpModel>> sendOtp({required String phone});
  Future<Either<Failure,VerifyOtpModel>> verifyOtp({required String otp,required String phone});



}