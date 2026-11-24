import '../../../../main_imports.dart';
import '../../data/models/faqs_model.dart';
import '../../data/repos/faqs_repo.dart';
import 'faqs_states.dart';

class FAQsCubit extends Cubit<FAQsStates> {
  FAQsCubit(this.faQsRepo) : super(FAQsInitState());

  FAQsRepo? faQsRepo;

  static FAQsCubit get(context) => BlocProvider.of(context);


  FaqsModel? faqsModel;

  /// Safe, ordered view of the questions coming from the API.
  List<Data> get faqs {
    final items = List<Data>.from(faqsModel?.data ?? const <Data>[]);
    items.sort(
      (a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0),
    );
    return items;
  }

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