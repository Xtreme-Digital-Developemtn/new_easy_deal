


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/client_profile_model.dart';
import '../models/logout_model.dart';

abstract class ProfileRepo{

   Future<Either<Failure,LogoutModel>> logout();
   Future<Either<Failure,ClientProfileModel>> getClientProfile({required int clientId});




}