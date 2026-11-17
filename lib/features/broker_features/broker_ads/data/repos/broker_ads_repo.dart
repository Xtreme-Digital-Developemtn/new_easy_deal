import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../models/advertisement_shuffle_model.dart';

abstract class BrokerAdsRepo {
  /// [brokerId] بيقيّد النتيجة على إعلانات وسيط واحد. الـ endpoint
  /// (`unit/advertisement-shuffle`) هو نفسه اللي الصفحة الرئيسية بتجيب منه
  /// «الأكثر مبيعاً» لكل المستخدمين، فمن غير التقييد ده شاشة «إعلاناتي»
  /// كانت بتعرض إعلانات كل الوسطاء — ونفس القايمة لأي أكونت.
  Future<Either<Failure, AdvertisementShuffleModel>> getAdvertisementShuffle({
    required int limit,
    required int offset,
    int? brokerId,
  });
}
