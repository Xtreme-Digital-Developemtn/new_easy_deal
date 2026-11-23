import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/errors/error_messages.dart';
import '../../../../../core/shared_cubits/session/app_session.dart';
import '../../../../../main_imports.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_states.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context,state){
        if (state is LogoutSuccessState) {
            // إعادة تشغيل كاملة للجلسة: التوكن والهوية بيتمسحوا وشجرة
            // التطبيق بتتبني من الأول، فمفيش أي بيانات من الأكونت
            // القديم بتفضل في الذاكرة.
            AppSession.signedOutWithMessage(LangKeys.logoutSuccessMsg.tr());
            return;
          }
        else if(state is LogoutErrorState){
          Toast.showErrorToast(
            msg: localizeErrorMessage(state.error.toString()),
            context: context,
          );
        }
      },
      builder:  (context,state){
        var profileCubit = context.read<ProfileCubit>();
        return AlertDialog(
          title: Text(LangKeys.confirmLogout.tr()),
          content: Text(LangKeys.areYouSureLogout.tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(LangKeys.cancel.tr()),
            ),
            TextButton(
              onPressed: () {
                  profileCubit.logout();
              },
              child: ConditionalBuilder(
                condition: state is ! LogoutLoadingState,
                fallback: (context)=>SizedBox(height : 30.h,width: 30.w,child: CustomLoading()),
                builder: (context){
                  return  Text(
                    LangKeys.logout.tr(),
                    style: TextStyle(color: AppColors.errorDark),
                  );
                },

              ),
            ),
          ],
        );
      },
    ),
  );
}