import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../main_imports.dart';
import '../../view_model/layout_cubit.dart';
import '../../view_model/layout_states.dart';

class ProfileNameAndNotificationIcon extends StatefulWidget {
  const ProfileNameAndNotificationIcon({super.key});

  @override
  State<ProfileNameAndNotificationIcon> createState() => _ProfileNameAndNotificationIconState();
}

class _ProfileNameAndNotificationIconState extends State<ProfileNameAndNotificationIcon> {
  @override
  void initState() {
    super.initState();
    if(CacheHelper.getData(key: "userRole")=="broker"){
      context.read<LayoutCubit>().getUnReadNotificationsCount();
    }

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      buildWhen: (previous, current) {
        return current is GetClientProfileLoadingState ||
            current is GetClientProfileSuccessState ||
            current is GetClientProfileErrorState;
      },
      builder: (context, state) {
        var profileCubit = context.read<ProfileCubit>();
        return Skeletonizer(
          enabled: state is GetClientProfileLoadingState || context.read<ProfileCubit>().clientProfileModel == null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomNetWorkImage(
                    raduis: 50,
                    imageUrl: profileCubit.clientProfileModel?.data?.image ?? "",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  Gap(6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          profileCubit.clientProfileModel?.data?.fullName ?? "",
                          style: AppStyles.black16SemiBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if(CacheHelper.getData(key: "userRole")=="broker")
              BlocSelector<LayoutCubit, LayoutStates, int>(
                selector: (state) {
                  return context
                      .read<LayoutCubit>()
                      .unReadNotificationsCountModel
                      ?.data
                      ?.unreadCount ??
                      0;
                },
                builder: (context, unreadCount) {
                  return InkWell(
                    onTap: () {
                      context.pushNamed(Routes.notificationsView);
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          SvgImages.notify2,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryDark,
                            BlendMode.srcIn,
                          ),
                        ),

                        if (unreadCount > 0)
                          Positioned(
                            top: -6.h,
                            right: -6.w,
                            child: Container(
                              width: 18.w,
                              height: 18.h,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                unreadCount > 99 ? '99+' : '$unreadCount',
                                style:   TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
