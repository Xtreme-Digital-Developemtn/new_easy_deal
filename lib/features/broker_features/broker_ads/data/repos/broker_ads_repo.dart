import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../models/advertisement_shuffle_model.dart';

abstract class BrokerAdsRepo {
  /// بتجيب إعلانات الوسيط من `unit?isAdvertisement=1` مرتّبة من الأحدث.
  /// [brokerId] بيقيّد النتيجة على وسيط واحد — من غيره الـ endpoint بيرجّع
  /// إعلانات كل الوسطاء فشاشة «إعلاناتي» كانت بتعرض نفس القايمة لأي أكونت.
  Future<Either<Failure, AdvertisementShuffleModel>> getAdvertisementShuffle({
    required int limit,
    required int offset,
    int? brokerId,
  });
}
