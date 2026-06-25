import 'package:easy_deal/features/layout/data/models/send_fcm_model.dart';
import 'package:easy_deal/features/layout/data/repos/layout_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../main_imports.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit(this.screens ,this.layoutRepo) : super(LayoutInitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  static int pageIndex = 0;

  final List<Widget> screens;

  LayoutRepo? layoutRepo;



  changeBottomNav(index ,context) {
    pageIndex = index;
    emit(ChangeBottomNavState());
  }

  DateTime? _lastPressed;
  void onPopInvoked(bool didPop,BuildContext context) {
    if (didPop) {
      return;
    }
    if(pageIndex==0){
      DateTime now = DateTime.now();
      if (_lastPressed == null || now.difference(_lastPressed!) > const Duration(seconds: 2)) {
        _lastPressed = now;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(LangKeys.exit.tr()),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        SystemNavigator.pop();
      }
    }else{
      changeBottomNav(0, context);

    }

  }



  SendFcmModel? sendFcmModel;

  Future<void> sendFcmToken() async {
    emit(SendFcmTokenLoading());
    var result = await layoutRepo!.sendFcmToken(fcmToken: CacheHelper.getData(key: "FCMToken"));
    return result.fold(
          (failure) {
        emit(SendFcmTokenError(failure.errMessage));
      },
          (data) async {
            sendFcmModel = data;
        emit(SendFcmTokenSuccess(data));
      },
    );
  }
}