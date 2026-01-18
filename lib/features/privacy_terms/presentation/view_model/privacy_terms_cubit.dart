

import 'package:easy_deal/features/privacy_terms/data/models/terms_model.dart';

import '../../../../main_imports.dart';
 import '../../data/repos/privacy_terms_repo.dart';
import 'privacy_terms_states.dart';

class PrivacyTermsCubit extends Cubit<PrivacyTermsStates> {
  PrivacyTermsCubit(this.privacyTermsRepo) : super(PrivacyTermsInitState());

  PrivacyTermsRepo? privacyTermsRepo;
  static PrivacyTermsCubit get(context) => BlocProvider.of(context);



  TermsModel? termsModel;

  Future<void> getTerms() async {
    emit(GetPrivacyTermsLoadingState());
    var result = await privacyTermsRepo!.getTerms();
    return result.fold((failure) {
      emit(GetPrivacyTermsErrorState(failure.errMessage));
    }, (data) async {
      termsModel = data;
      emit(GetPrivacyTermsSuccessState(data));
    });
  }



}