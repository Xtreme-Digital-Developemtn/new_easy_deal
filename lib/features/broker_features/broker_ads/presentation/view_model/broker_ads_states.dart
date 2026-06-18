import '../../data/models/advertisement_shuffle_model.dart';

abstract class BrokerAdsStates{}

class BrokerAdsInitState extends BrokerAdsStates{}

class GetAdvertisementShuffleLoadingState extends BrokerAdsStates{}
class GetAdvertisementShuffleSuccessState extends BrokerAdsStates{
  final AdvertisementShuffleModel? advertisementShuffleModel;
  GetAdvertisementShuffleSuccessState(this.advertisementShuffleModel);

}
class GetAdvertisementShuffleErrorState extends BrokerAdsStates{
  final String error;
  GetAdvertisementShuffleErrorState(this.error);

}