import '../../../../../main_imports.dart';
 import '../../data/repos/broker_maps_repo.dart';
import 'broker_maps_states.dart';

class BrokerMapsCubit extends Cubit<BrokerMapsStates> {
  BrokerMapsCubit(this.brokerMapsRepo) : super(BrokerMapsInitState());

  BrokerMapsRepo? brokerMapsRepo;

  static BrokerMapsCubit get(context) => BlocProvider.of(context);




}