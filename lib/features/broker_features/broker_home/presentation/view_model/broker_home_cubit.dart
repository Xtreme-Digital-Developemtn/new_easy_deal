 import '../../../../../main_imports.dart';
import '../../data/models/broker_statistics_model.dart';
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


  BrokerStatisticsModel? brokerStatisticsModel;

  Future<void> getBrokerStatistics({required int brokerId}) async {
    emit(GetBrokerStatisticsLoadingState());
    var result = await aboutUsRepo!.getBrokerStatistics(brokerId: brokerId);
    return result.fold(
          (failure) {
        emit(GetBrokerStatisticsErrorState(failure.errMessage));
      },
          (data) async {
            brokerStatisticsModel = data;
        emit(GetBrokerStatisticsSuccessState(data));
      },
    );
  }

}