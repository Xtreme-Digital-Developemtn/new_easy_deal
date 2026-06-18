import '../../../../../main_imports.dart';
import '../../data/models/map_location_model.dart';
import '../../data/repos/broker_maps_repo.dart';
import 'broker_maps_states.dart';

class BrokerMapsCubit extends Cubit<BrokerMapsStates> {
  BrokerMapsCubit(this.brokerMapsRepo) : super(BrokerMapsInitState());

  BrokerMapsRepo? brokerMapsRepo;

  static BrokerMapsCubit get(context) => BlocProvider.of(context);

  BrokerMapsModel? mapsModel;

  Future<void> getMaps({required int brokerId}) async {
    emit(GetMapsLoadingState());
    var result = await brokerMapsRepo!.getMaps(brokerId: brokerId);
    return result.fold(
      (failure) {
        emit(GetMapsErrorState(failure.errMessage));
      },
      (data) async {
        mapsModel = data;
        emit(GetMapsSuccessState(data));
      },
    );
  }
}