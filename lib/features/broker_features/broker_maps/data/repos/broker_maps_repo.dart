import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../models/add_map_model.dart';
import '../models/map_location_model.dart';

abstract class BrokerMapsRepo {
  Future<Either<Failure, BrokerMapsModel>> getMaps({required int brokerId});
  Future<Either<Failure, AddMapModel>> addMap({required File image  , required String description , required int brokerId  });
}