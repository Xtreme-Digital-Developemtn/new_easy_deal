import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';

import '../../../../main_imports.dart';
import '../../data/repos/edit_profile_repo.dart';
import 'edit_profile_states.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitState());

  EditProfileRepo? editProfileRepo;

  static EditProfileCubit get(context) => BlocProvider.of(context);



}