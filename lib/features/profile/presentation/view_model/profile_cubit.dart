import 'package:easy_deal/features/profile/data/models/client_profile_model.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';

import '../../../../main_imports.dart';
import '../../data/models/logout_model.dart';
import '../../data/repos/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitState());

  ProfileRepo? profileRepo;

  static ProfileCubit get(context) => BlocProvider.of(context);


  LogoutModel? logoutModel;

  Future<void> logout() async {
    emit(LogoutLoadingState());
    var result = await profileRepo!.logout();
    return result.fold((failure) {
      emit(LogoutErrorState(failure.errMessage));
    }, (data) async {
        logoutModel = data;
        emit(LogoutSuccessState(data));
    });
  }


  ClientProfileModel? clientProfileModel;

  Future<void> getClientProfile({required int clientId}) async {
    emit(GetClientProfileLoadingState());
    var result = await profileRepo!.getClientProfile(clientId: clientId);
    return result.fold((failure) {
      emit(GetClientProfileErrorState(failure.errMessage));
    }, (data) async {
      clientProfileModel = data;
      emit(GetClientProfileSuccessState(data));
    });
  }

}