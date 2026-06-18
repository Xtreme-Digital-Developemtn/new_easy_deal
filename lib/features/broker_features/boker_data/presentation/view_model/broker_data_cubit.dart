import '../../../../../main_imports.dart';
import '../../data/models/broker_units_model.dart';
import '../../data/repos/broker_data_repo.dart';
import 'broker_data_states.dart';

class BrokerDataCubit extends Cubit<BrokerDataStates> {
  BrokerDataCubit(this.brokerDataRepo) : super(BrokerDataInitState());

  BrokerDataRepo? brokerDataRepo;

  static BrokerDataCubit get(context) => BlocProvider.of(context);

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
}