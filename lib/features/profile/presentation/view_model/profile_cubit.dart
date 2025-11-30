import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.homeRepo) : super(ProfileInitState());

  ProfileRepo? homeRepo;

  static ProfileCubit get(context) => BlocProvider.of(context);

  

}