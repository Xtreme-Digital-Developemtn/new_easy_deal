import 'package:easy_deal/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
class ProfileDataNameCodeImage extends StatelessWidget {
  const ProfileDataNameCodeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12.r),
      height: 135.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color.fromRGBO(12, 59, 182, 0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              ProfileImage(),
              Gap(20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mostafa Bahr",style: AppStyles.black18SemiBold,),
                  Gap(8.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.r),
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color:  AppColors.grayLighter,
                      )
                    ),
                    child: Row(
                      children: [
                        Text("${LangKeys.driverCode.tr()} : ",style: AppStyles.black12Medium.copyWith(
                          color: AppColors.secondBlack,
                        ),),
                      Text("123456",style: AppStyles.black12SemiBold,),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  context.pushNamed(Routes.editProfileView);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(SvgImages.edit),
                    Gap(8.w),
                    Text(LangKeys.editProfile.tr(),style: AppStyles.primary16SemiBold,),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
