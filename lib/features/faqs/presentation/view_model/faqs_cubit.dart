import '../../../../main_imports.dart';
import '../../data/repos/faqs_repo.dart';
import 'faqs_states.dart';

class FAQsCubit extends Cubit<FAQsStates> {
  FAQsCubit(this.faQsRepo) : super(FAQsInitState());

  FAQsRepo? faQsRepo;

  static FAQsCubit get(context) => BlocProvider.of(context);




}