 import '../../../../../main_imports.dart';
import '../../data/repos/broker_home_repo.dart';
import 'broker_home_states.dart';


class BrokerHomeCubit extends Cubit<BrokerHomeStates> {
  BrokerHomeCubit(this.aboutUsRepo) : super(BrokerHomeInitState());

  BrokerHomeRepo? aboutUsRepo;

  static BrokerHomeCubit get(context) => BlocProvider.of(context);




}