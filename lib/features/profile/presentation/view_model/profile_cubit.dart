import 'package:easy_deal/features/profile/data/models/client_profile_model.dart';
import 'package:easy_deal/features/profile/data/models/social_media_model.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';
import 'package:url_launcher/url_launcher.dart';
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



  SocialMediaModel? socialMediaModel;

  Future<void> getSocialMedia() async {
    emit(GetSocialMediaLoadingState());
    var result = await profileRepo!.getSocialMedia();
    return result.fold((failure) {
      emit(GetSocialMediaErrorState(failure.errMessage));
    }, (data) async {
      socialMediaModel = data;
      emit(GetSocialMediaSuccessState(data));
    });
  }


  Future<void> openSocialLink(String link) async {
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

}