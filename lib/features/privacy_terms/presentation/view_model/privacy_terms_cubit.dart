

import '../../../../main_imports.dart';
 import '../../data/repos/privacy_terms_repo.dart';
import 'privacy_terms_states.dart';

class PrivacyTermsCubit extends Cubit<PrivacyTermsStates> {
  PrivacyTermsCubit(this.privacyTermsRepo) : super(PrivacyTermsInitState());

  PrivacyTermsRepo? privacyTermsRepo;
  static PrivacyTermsCubit get(context) => BlocProvider.of(context);





}