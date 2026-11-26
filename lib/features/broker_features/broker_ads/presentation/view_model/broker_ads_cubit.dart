import '../../../../../core/utils/app_consts/session_cache.dart';
import '../../../../../main_imports.dart';
import '../../data/models/advertisement_shuffle_model.dart';
import '../../data/repos/broker_ads_repo.dart';
import 'broker_ads_states.dart';

class BrokerAdsCubit extends Cubit<BrokerAdsStates> {
  BrokerAdsCubit(this.brokerAdsRepo) : super(BrokerAdsInitState());

  BrokerAdsRepo? brokerAdsRepo;

  static BrokerAdsCubit get(context) => BlocProvider.of(context);

  AdvertisementShuffleModel? advertisementShuffleModel;

  /// Page size sent as `limit` to `unit?isAdvertisement=1`.
  int limit = 10;

  /// Ads accumulated across every page loaded so far (مفلترة على الوسيط الحالي).
  List<Data> ads = [];

  /// عدد العناصر اللي رجعت من السيرفر فعلاً — هو اللي بيتبعت كـ offset.
  /// مينفعش نستخدم `ads.length` لأن الفلترة المحلية بتقلّله فالصفحة الجاية
  /// كانت ترجّع نفس العناصر تاني.
  int offset = 0;

  /// False once the server has no more ads past [offset].
  bool hasMore = true;

  /// True while a `loadMore` page is in flight, so the list can show a footer
  /// loader without replacing the ads already on screen.
  bool isLoadingMore = false;

  /// id الوسيط الحالي من الكاش، بيتبعت كـ `brokerId` مع الريكوست. من غيره
  /// الـ endpoint بيرجّع إعلانات كل الوسطاء، فكانت نفس القايمة بتظهر لأي
  /// أكونت حتى بعد تسجيل خروج ودخول بأكونت تاني.
  int? get _brokerId => SessionCache.brokerId;

  /// خط دفاع تاني لو السيرفر ماحترمش الفلتر: مانعرضش إعلان وسيط تاني.
  List<Data> _onlyMine(List<Data> page) {
    final id = _brokerId;
    if (id == null) return page;
    return page.where((e) => e.brokerId == null || e.brokerId == id).toList();
  }

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
      brokerId: _brokerId,
    );
    return result.fold(
      (failure) {
        emit(GetAdvertisementShuffleErrorState(failure.errMessage));
      },
      (data) async {
        advertisementShuffleModel = data;
        final page = data.data ?? [];
        ads = _onlyMine(page);
        offset = page.length;
        hasMore = page.length >= limit && offset < (data.count ?? 0);
        emit(GetAdvertisementShuffleSuccessState(data));
        // لو الصفحة كلها كانت لوسطاء تانيين، نكمّل على الصفحة اللي بعدها
        // بدل ما الشاشة تبان فاضية والسيرفر عنده إعلانات للوسيط ده.
        if (ads.isEmpty && hasMore) {
          await loadMore();
        }
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
      brokerId: _brokerId,
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
        ads = [...ads, ..._onlyMine(page)];
        offset += page.length;
        hasMore = page.length >= limit && offset < (data.count ?? 0);
        isLoadingMore = false;
        emit(GetAdvertisementShuffleSuccessState(data));
      },
    );
  }
}
