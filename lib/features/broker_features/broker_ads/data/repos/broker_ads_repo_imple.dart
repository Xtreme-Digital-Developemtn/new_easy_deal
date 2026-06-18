  import 'package:dartz/dartz.dart';
import '../../../../../main_imports.dart';
import '../models/advertisement_shuffle_model.dart';
import 'broker_ads_repo.dart';


class BrokerAdsRepoImpl implements BrokerAdsRepo {
  final ApiService? apiService;
  BrokerAdsRepoImpl(this.apiService);




@override
Future<Either<Failure, AdvertisementShuffleModel>> getAdvertisementShuffle() async{
  try {
    var response = await apiService!.getData(
      endPoint: EndPoints.advertisementShuffle,
    );
    AdvertisementShuffleModel result = AdvertisementShuffleModel.fromJson(response.data);
    return right(result);
  } catch (e) {
    return left(handleError(e));
  }
}








}