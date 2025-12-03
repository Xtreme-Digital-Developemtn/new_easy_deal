import 'package:easy_deal/features/settings/presentation/view_model/settings_states.dart';
import '../../../../main_imports.dart';
import '../../data/repos/app_settings_repo.dart';

class AppSettingsCubit extends Cubit<AppSettingsStates> {
  AppSettingsCubit(this.appSettingsRepo) : super(AppSettingsInitState());

  AppSettingsRepo? appSettingsRepo;
  static AppSettingsCubit get(context) => BlocProvider.of(context);


  int selectModeIndex = 0;
  void selectMode(modeIndex){
    selectModeIndex = modeIndex;
    emit(SelectModeState());
  }


  bool enableNotifications = true;
  changeNotificationsEnable(status)
  {
    enableNotifications = status;
    emit(ChangeNotificationsEnableState());
  }

}