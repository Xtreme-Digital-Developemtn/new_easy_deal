import '../../../../../main_imports.dart';
 import '../../data/models/advertisement_shuffle_model.dart';
import '../../data/repos/broker_ads_repo.dart';
import 'broker_ads_states.dart';

class BrokerAdsCubit extends Cubit<BrokerAdsStates> {
  BrokerAdsCubit(this.brokerAdsRepo) : super(BrokerAdsInitState());

  BrokerAdsRepo? brokerAdsRepo;

  static BrokerAdsCubit get(context) => BlocProvider.of(context);

  AdvertisementShuffleModel? advertisementShuffleModel;

  Future<void> getAdvertisementShuffle() async {
    emit(GetAdvertisementShuffleLoadingState());
    var result = await brokerAdsRepo!.getAdvertisementShuffle();
    return result.fold(
          (failure) {
        emit(GetAdvertisementShuffleErrorState(failure.errMessage));
      },
          (data) async {
            advertisementShuffleModel = data;
        emit(GetAdvertisementShuffleSuccessState(data));
      },
    );
  }


}