import '../../../../../main_imports.dart';
import '../../data/models/developer_projects_model.dart';
import '../../data/models/developers_model.dart';
import '../../data/repos/broker_developers_repo.dart';
import 'broker_developers_states.dart';

class BrokerDevelopersCubit extends Cubit<BrokerDevelopersStates> {
  BrokerDevelopersCubit(this.brokerDevelopersRepo) : super(BrokerDevelopersInitState());

  BrokerDevelopersRepo? brokerDevelopersRepo;

  static BrokerDevelopersCubit get(context) => BlocProvider.of(context);

  DevelopersModel? developersModel;
  DeveloperProjectsModel? developerProjectsModel;

  Future<void> getDevelopers() async {
    emit(GetDevelopersLoadingState());
    var result = await brokerDevelopersRepo!.getDevelopers();
    return result.fold(
      (failure) {
        emit(GetDevelopersErrorState(failure.errMessage));
      },
      (data) async {
        developersModel = data;
        emit(GetDevelopersSuccessState(data));
      },
    );
  }

  Future<void> getDeveloperProjects(int developerId) async {
    emit(GetDeveloperProjectsLoadingState());
    var result = await brokerDevelopersRepo!.getDeveloperProjects(developerId);
    return result.fold(
      (failure) {
        emit(GetDeveloperProjectsErrorState(failure.errMessage));
      },
      (data) async {
        developerProjectsModel = data;
        emit(GetDeveloperProjectsSuccessState(data));
      },
    );
  }
}