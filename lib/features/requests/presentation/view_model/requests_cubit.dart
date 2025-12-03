import '../../../../main_imports.dart';
import '../../data/repos/requests_repo.dart';
import 'requests_states.dart';

class RequestsCubit extends Cubit<RequestsStates> {
  RequestsCubit(this.faQsRepo) : super(RequestsInitState());

  RequestsRepo? faQsRepo;

  static RequestsCubit get(context) => BlocProvider.of(context);




}