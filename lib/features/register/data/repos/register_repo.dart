import 'package:dartz/dartz.dart';
import '../../../../main_imports.dart';
import '../models/register_model.dart';

abstract class RegisterRepo{

  Future<Either<Failure,RegisterModel>> register({required FormData data});




}