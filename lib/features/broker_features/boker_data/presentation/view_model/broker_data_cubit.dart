import '../../../../../main_imports.dart';
import '../../data/models/broker_units_model.dart';
import '../../data/models/requests_check_advertisement_count_model.dart';
import '../../data/models/unit_publish_as_ad_model.dart';
import '../../data/repos/broker_data_repo.dart';
import 'broker_data_states.dart';

class BrokerDataCubit extends Cubit<BrokerDataStates> {
  BrokerDataCubit(this.brokerDataRepo) : super(BrokerDataInitState());

  BrokerDataRepo? brokerDataRepo;

  static BrokerDataCubit get(context) => BlocProvider.of(context);
  int? selectedUnitId;
  BrokerUnitsModel? brokerUnitsModel;

  Future<void> getBrokerUnits({required int brokerId}) async {
    emit(GetBrokerUnitsLoadingState());
    var result = await brokerDataRepo!.getBrokerUnits(brokerId: brokerId);
    return result.fold(
      (failure) {
        emit(GetBrokerUnitsErrorState(failure.errMessage));
      },
      (data) async {
        brokerUnitsModel = data;
        emit(GetBrokerUnitsSuccessState(data));
      },
    );
  }

  RequestsCheckAdvertisementCountModel? requestsCheckAdvertisementCountModel;
  Future<void> requestsCheckAdvertisementCount() async {
    emit(GetRequestsCheckAdvertisementCountLoadingState());
    var result = await brokerDataRepo!.requestsCheckAdvertisementCount();
    return result.fold(
          (failure) {
        emit(GetRequestsCheckAdvertisementCountErrorState(failure.errMessage));
      },
          (data) async {
            requestsCheckAdvertisementCountModel = data;
        emit(GetRequestsCheckAdvertisementCountSuccessState(data));
      },
    );
  }


  UnitPublishAsAdModel? unitPublishAsAdModel;
  Future<void> unitPublishAsAd({required int id , required String caption}) async {
    emit(UnitPublishAsAdLoadingState());
    var result = await brokerDataRepo!.unitPublishAsAd(id: id,caption: caption);
    return result.fold(
          (failure) {
        emit(UnitPublishAsAdErrorState(failure.errMessage));
      },
          (data) async {
            unitPublishAsAdModel = data;
        emit(UnitPublishAsAdSuccessState(data));
      },
    );
  }



}