import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.homeRepo) : super(SearchInitState());

  SearchRepo? homeRepo;

  static SearchCubit get(context) => BlocProvider.of(context);



}