import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/developers_model.dart';

abstract class BrokerDevelopersRepo {
  Future<Either<Failure, DevelopersModel>> getDevelopers();
}