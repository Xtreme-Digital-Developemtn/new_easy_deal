import 'package:easy_deal/core/utils/toast/toast.dart';

import '../../../../../main_imports.dart';
import '../../../../layout/presentation/view_model/layout_cubit.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_states.dart';

void showLogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context,state){
          if(state is LogoutSuccessState){
            Toast.showSuccessToast(msg: state.logoutModel.message.toString(), context: context);
            context.pushNamedAndRemoveUntil(Routes.loginView);
            LayoutCubit.pageIndex=0;
            CacheTokenManger.clearUserToken();
          }
          else if(state is LogoutErrorState){
            Toast.showErrorToast(msg: state.error.toString(), context: context);
          }
        },
        builder:  (context,state){
          var profileCubit = context.read<ProfileCubit>();
          return Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.r),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 45.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  SvgPicture.asset(
                    SvgImages.sheetIcons,
                    width: 80.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.errorLight,
                      BlendMode.srcIn,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    "تسجيل الخروج",
                    style: AppStyles.black20Bold,
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    "هل أنت متأكد من أنك تريد تسجيل الخروج؟",
                    textAlign: TextAlign.center,
                    style: AppStyles.gray12Regular,
                  ),

                  SizedBox(height: 25.h),

                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          isEnabled: true,
                          gradientColors: false,
                          borderColor: BorderSide(
                            color: AppColors.grayLightest
                          ),
                          color: AppColors.white,
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          text: "إلغاء",
                          textColor: AppColors.primaryDark,
                        ),
                      ),

                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomButton(
                          isEnabled: true,
                          gradientColors: false,
                          borderColor: BorderSide(
                              color: AppColors.errorLight
                          ),
                          color: AppColors.white,
                          onPressed: (){
                            profileCubit.logout();
                          },
                          text: "إلغاء",
                          textColor: AppColors.errorDark,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}