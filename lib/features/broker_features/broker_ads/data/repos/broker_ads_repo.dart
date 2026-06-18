import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../models/advertisement_shuffle_model.dart';

abstract class BrokerAdsRepo{

   Future<Either<Failure,AdvertisementShuffleModel>> getAdvertisementShuffle();


}