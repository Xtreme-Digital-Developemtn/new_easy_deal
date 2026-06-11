

import 'package:dartz/dartz.dart';

import '../../../../main_imports.dart';
import '../models/send_otp_model.dart';


abstract class OtpRepo{

   Future<Either<Failure,SendOtpModel>> sendOtp({required String phone});




}