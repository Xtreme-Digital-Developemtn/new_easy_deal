import '../../../../main_imports.dart';
import '../../data/models/faqs_model.dart';
import '../../data/repos/faqs_repo.dart';
import 'faqs_states.dart';

class FAQsCubit extends Cubit<FAQsStates> {
  FAQsCubit(this.faQsRepo) : super(FAQsInitState());

  FAQsRepo? faQsRepo;

  static FAQsCubit get(context) => BlocProvider.of(context);


  FaqsModel? faqsModel;

  Future<void> getAllFaqs() async {
    emit(GetAllFAQsLoadingState());
    var result = await faQsRepo!.getAllFaqs();
    return result.fold(
          (failure) {
        emit(GetAllFAQsErrorState(failure.errMessage));
      },
          (data) async {
            faqsModel = data;
        emit(GetAllFAQsSuccessState(data));
      },
    );
  }


}