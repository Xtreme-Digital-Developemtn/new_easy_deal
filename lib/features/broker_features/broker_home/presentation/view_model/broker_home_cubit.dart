 import '../../../../../main_imports.dart';
import '../../data/models/broker_statistics_model.dart';
import '../../data/models/last_requests_model_in_home.dart';
import '../../data/repos/broker_home_repo.dart';
import 'broker_home_states.dart';


class BrokerHomeCubit extends Cubit<BrokerHomeStates> {
  BrokerHomeCubit(this.aboutUsRepo) : super(BrokerHomeInitState());

  BrokerHomeRepo? aboutUsRepo;

  static BrokerHomeCubit get(context) => BlocProvider.of(context);


  int? selectedCategoryIndex;
  void selectCategoryItem(int index)
  {
    selectedCategoryIndex = index;
    emit(SelectCategoryItemState());
  }


  /// وقت آخر جلب ناجح لأي من بيانات اللوحة — بيستخدم كـ debounce عشان
  /// أول ظهور للتاب بعد تحميل الإقلاع ما يعملش نداء مكرر على طول.
  DateTime? _lastLoadedAt;

  /// بتتنادى لما تاب لوحة التحكم يرجع يظهر، أو من pull-to-refresh.
  /// بتجيب الإحصائيات والطلبات الأخيرة من الأول (forceRefresh) عشان الأرقام
  /// تتحدّث بعد تغيير حالة طلب من شاشة تانية (مثال: الطلب بقى منتهي).
  Future<void> refreshDashboard({
    required int brokerId,
    Duration minInterval = Duration.zero,
  }) async {
    if (minInterval > Duration.zero &&
        _lastLoadedAt != null &&
        DateTime.now().difference(_lastLoadedAt!) < minInterval) {
      return;
    }
    await Future.wait([
      getBrokerStatistics(brokerId: brokerId, forceRefresh: true),
      getLastRequestsModelInHome(brokerId: brokerId, forceRefresh: true),
    ]);
  }

  BrokerStatisticsModel? brokerStatisticsModel;

  Future<void> getBrokerStatistics({required int brokerId, bool forceRefresh = false}) async {
    // يمنع إعادة الجلب عند السكرول - يجلب أول مرة فقط
    if (!forceRefresh && brokerStatisticsModel != null) return;
    emit(GetBrokerStatisticsLoadingState());
    var result = await aboutUsRepo!.getBrokerStatistics(brokerId: brokerId);
    return result.fold(
          (failure) {
        emit(GetBrokerStatisticsErrorState(failure.errMessage));
      },
          (data) async {
            brokerStatisticsModel = data;
            _lastLoadedAt = DateTime.now();
        emit(GetBrokerStatisticsSuccessState(data));
      },
    );
  }

  LastRequestsModelInHome? lastRequestsModelInHome;

  Future<void> getLastRequestsModelInHome({required int brokerId, bool forceRefresh = false}) async {
    // يجلب أول مرة فقط - السكرول لفوق/تحت لن يعيد الطلب
    if (!forceRefresh && lastRequestsModelInHome != null) return;
    emit(GetLastRequestsModelInHomeLoadingState());
    var result = await aboutUsRepo!.getLastRequestsModelInHome(brokerId: brokerId);
    return result.fold(
          (failure) {
        emit(GetLastRequestsModelInHomeErrorState(failure.errMessage));
      },
          (data) async {
        lastRequestsModelInHome = data;
        _lastLoadedAt = DateTime.now();
        emit(GetLastRequestsModelInHomeSuccessState(data));
      },
    );
  }

}