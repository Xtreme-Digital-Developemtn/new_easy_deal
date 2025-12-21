import '../../../../../main_imports.dart';
 import '../../data/repos/broker_ads_repo.dart';
import 'broker_ads_states.dart';

class BrokerAdsCubit extends Cubit<BrokerAdsStates> {
  BrokerAdsCubit(this.brokerAdsRepo) : super(BrokerAdsInitState());

  BrokerAdsRepo? brokerAdsRepo;

  static BrokerAdsCubit get(context) => BlocProvider.of(context);




}