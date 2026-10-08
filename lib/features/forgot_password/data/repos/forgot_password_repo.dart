import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, String>> sendOtp({required String phone});
  Future<Either<Failure, String>> verifyOtp({
    required String phone,
    required String otp,
  });
  Future<Either<Failure, String>> resetPassword({
    required String phone,
    required String password,
    required String passwordConfirmation,
  });
}
