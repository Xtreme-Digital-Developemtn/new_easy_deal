
import '../../../../main_imports.dart';
 import '../../data/repos/unit_details_repo.dart';
import 'unit_details_states.dart';

class UnitDetailsCubit extends Cubit<UnitDetailsStates> {
  UnitDetailsCubit(this.unitDetailsRepo) : super(UnitDetailsInitState());

  UnitDetailsRepo? unitDetailsRepo;

  static UnitDetailsCubit get(context) => BlocProvider.of(context);



}