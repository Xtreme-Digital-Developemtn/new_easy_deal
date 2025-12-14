import '../../../../../main_imports.dart';
import '../../data/repos/broker_data_repo.dart';
import 'broker_data_states.dart';

class BrokerDataCubit extends Cubit<BrokerDataStates> {
  BrokerDataCubit(this.brokerDataRepo) : super(BrokerDataInitState());

  BrokerDataRepo? brokerDataRepo;

  static BrokerDataCubit get(context) => BlocProvider.of(context);




}