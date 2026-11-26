import 'package:dartz/dartz.dart';
import '../../../../../main_imports.dart';
import '../models/advertisement_shuffle_model.dart';
import 'broker_ads_repo.dart';

class BrokerAdsRepoImpl implements BrokerAdsRepo {
  final ApiService? apiService;
  BrokerAdsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AdvertisementShuffleModel>> getAdvertisementShuffle({
    required int limit,
    required int offset,
    int? brokerId,
  }) async {
    try {
      // `unit` مع `isAdvertisement=1` بيرجّع إعلانات الوسيط نفسه مرتّبة من
      // الأحدث، بدل `unit/advertisement-shuffle` اللي مشترك مع «الأكثر مبيعاً»
      // في الرئيسية وبيرجّع إعلانات كل الوسطاء بترتيب عشوائي.
      var response = await apiService!.getData(
        endPoint: EndPoints.brokerUnits,
        query: {
          'limit': limit,
          'offset': offset,
          'sort': 'desc',
          'sortBy': 'id',
          'isAdvertisement': 1,
          if (brokerId != null) 'brokerId': brokerId,
        },
      );
      AdvertisementShuffleModel result =
          AdvertisementShuffleModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }
}
