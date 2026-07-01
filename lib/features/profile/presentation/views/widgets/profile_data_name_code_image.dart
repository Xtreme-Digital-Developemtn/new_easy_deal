import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';
import 'package:easy_deal/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
import 'logout_bottom_sheet.dart';

class ProfileDataNameCodeImage extends StatelessWidget {
  const ProfileDataNameCodeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        var profileCubit = context.read<ProfileCubit>();
        return Container(
          padding: EdgeInsets.all(12.r),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Color.fromRGBO(12, 59, 182, 0.05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ProfileImage(),
                      Gap(20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${profileCubit.clientProfileModel?.data?.fullName}",
                            style: AppStyles.black18SemiBold,
                          ),
                          Gap(8.h),
                          if(context.watch<ProfileCubit>().promoCodesLastAppliedModel!=null)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.r),
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: AppColors.grayLighter),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Promo Code : ",
                                  style: AppStyles.black12Medium.copyWith(
                                    color: AppColors.secondBlack,
                                  ),
                                ),

                                Text(
                                  "${context.watch<ProfileCubit>().promoCodesLastAppliedModel!.data!.promoCode}",
                                  style: AppStyles.black12SemiBold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50.r),
                    onTap: () {
                      // showLogoutDialog(context);
                      showLogoutBottomSheet(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.errorVeryLight,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          SvgImages.logout,
                          colorFilter: ColorFilter.mode(
                            AppColors.errorLight,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.editProfileView);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(SvgImages.edit),
                        Gap(8.w),
                        Text(
                          LangKeys.editProfile.tr(),
                          style: AppStyles.primary16SemiBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
