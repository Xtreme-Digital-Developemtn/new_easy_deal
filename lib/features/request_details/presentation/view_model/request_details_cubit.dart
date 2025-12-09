import '../../../../main_imports.dart';
import '../../data/repos/request_repo.dart';
import 'request_details_states.dart';


class RequestDetailsCubit extends Cubit<RequestDetailsStates> {
  RequestDetailsCubit(this.requestDetailsRepo) : super(RequestDetailsInitState());

  RequestDetailsRepo? requestDetailsRepo;
  static RequestDetailsCubit get(context) => BlocProvider.of(context);




}