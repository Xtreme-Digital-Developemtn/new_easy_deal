import '../../../../../main_imports.dart';
 import '../../data/models/advertisement_shuffle_model.dart';
import '../../data/repos/broker_ads_repo.dart';
import 'broker_ads_states.dart';

class BrokerAdsCubit extends Cubit<BrokerAdsStates> {
  BrokerAdsCubit(this.brokerAdsRepo) : super(BrokerAdsInitState());

  BrokerAdsRepo? brokerAdsRepo;

  static BrokerAdsCubit get(context) => BlocProvider.of(context);

  AdvertisementShuffleModel? advertisementShuffleModel;

  /// Page size sent as `limit` to `unit/advertisement-shuffle`.
  int limit = 10;

  /// Ads accumulated across every page loaded so far.
  List<Data> ads = [];

  /// Number of ads already fetched — sent as `offset` for the next page.
  int offset = 0;

  /// False once the server has no more ads past [offset].
  bool hasMore = true;

  /// True while a `loadMore` page is in flight, so the list can show a footer
  /// loader without replacing the ads already on screen.
  bool isLoadingMore = false;

  /// Loads the first page, resetting anything loaded before.
  Future<void> getAdvertisementShuffle() async {
    ads = [];
    offset = 0;
    hasMore = true;
    isLoadingMore = false;
    emit(GetAdvertisementShuffleLoadingState());
    var result = await brokerAdsRepo!.getAdvertisementShuffle(
      limit: limit,
      offset: 0,
    );
    return result.fold(
          (failure) {
        emit(GetAdvertisementShuffleErrorState(failure.errMessage));
      },
          (data) async {
            advertisementShuffleModel = data;
            final page = data.data ?? [];
            ads = [...page];
            offset = ads.length;
            hasMore = page.length >= limit && offset < (data.count ?? 0);
        emit(GetAdvertisementShuffleSuccessState(data));
      },
    );
  }

  /// Appends the next page to [ads]. No-op while a page is in flight or once
  /// the server has nothing left to send.
  Future<void> loadMore() async {
    if (isLoadingMore || !hasMore) return;
    final model = advertisementShuffleModel;
    if (model == null) return;

    isLoadingMore = true;
    emit(GetAdvertisementShuffleSuccessState(model));

    var result = await brokerAdsRepo!.getAdvertisementShuffle(
      limit: limit,
      offset: offset,
    );
    return result.fold(
      (failure) {
        isLoadingMore = false;
        // Keep the ads already on screen; surface the failure as a message.
        emit(LoadMoreAdvertisementShuffleErrorState(failure.errMessage));
        emit(GetAdvertisementShuffleSuccessState(model));
      },
      (data) async {
        final page = data.data ?? [];
        advertisementShuffleModel = data;
        ads = [...ads, ...page];
        offset = ads.length;
        hasMore = page.length >= limit && offset < (data.count ?? 0);
        isLoadingMore = false;
        emit(GetAdvertisementShuffleSuccessState(data));
      },
    );
  }
}
