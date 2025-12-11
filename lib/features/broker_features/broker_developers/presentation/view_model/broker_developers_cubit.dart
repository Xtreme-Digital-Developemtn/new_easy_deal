import '../../../../../main_imports.dart';
import '../../data/repos/broker_developers_repo.dart';
import 'broker_developers_states.dart';


class BrokerDevelopersCubit extends Cubit<BrokerDevelopersStates> {
  BrokerDevelopersCubit(this.brokerDevelopersRepo) : super(BrokerDevelopersInitState());

  BrokerDevelopersRepo? brokerDevelopersRepo;

  static BrokerDevelopersCubit get(context) => BlocProvider.of(context);




}