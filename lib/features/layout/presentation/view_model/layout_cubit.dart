import 'package:easy_localization/easy_localization.dart';
import '../../../../main_imports.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit(this.screens) : super(LayoutInitState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  static int pageIndex = 0;

  final List<Widget> screens;




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
}