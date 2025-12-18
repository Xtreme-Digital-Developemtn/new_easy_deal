
import 'package:easy_deal/features/unit_details/data/models/unit_details_model.dart';

import '../../../../main_imports.dart';
 import '../../data/repos/unit_details_repo.dart';
import 'unit_details_states.dart';

class UnitDetailsCubit extends Cubit<UnitDetailsStates> {
  UnitDetailsCubit(this.unitDetailsRepo) : super(UnitDetailsInitState());

  UnitDetailsRepo? unitDetailsRepo;

  static UnitDetailsCubit get(context) => BlocProvider.of(context);


  UnitDetailsModel? unitDetailsModel;
  Future<void> getUnitDetails({required int unitId}) async {
    emit(GetUnitDetailsLoadingState());
    var result = await unitDetailsRepo!.getUnitDetails(unitId: unitId);
    return result.fold((failure) {
      emit(GetUnitDetailsErrorState(failure.errMessage));
    }, (data) async {
      unitDetailsModel = data;
      emit(GetUnitDetailsSuccessState(data));
    });
  }

}