
import '../../../../main_imports.dart';
import '../../data/repos/category_units_repo.dart';
import 'category_units_states.dart';

class CategoryUnitsCubit extends Cubit<CategoryUnitsStates> {
  CategoryUnitsCubit(this.homeRepo) : super(CategoryUnitsInitState());

  CategoryUnitsRepo? homeRepo;

  static CategoryUnitsCubit get(context) => BlocProvider.of(context);



}