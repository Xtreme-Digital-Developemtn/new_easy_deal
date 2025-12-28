import 'package:easy_deal/features/search/data/models/all_units_model.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import '../../../../main_imports.dart';
import '../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(SearchInitState());

  SearchRepo? searchRepo;

  static SearchCubit get(context) => BlocProvider.of(context);


  AllUnitsModel? allUnitsModel;
  Future<void> getAllUnits() async {
    emit(GetAllUnitsLoadingState());
    var result = await searchRepo!.getAllUnits();
    return result.fold((failure) {
      emit(GetAllUnitsErrorState(failure.errMessage));
    }, (data) async {
      allUnitsModel = data;
      emit(GetAllUnitsSuccessState(data));
    });
  }


}