import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_states.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../main_imports.dart';

class ProfileNameAndNotificationIcon extends StatelessWidget {
  const ProfileNameAndNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(CacheTokenManger.userToken);
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
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.notificationsView);
                },
                child: SvgPicture.asset(
                  SvgImages.notify2,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
