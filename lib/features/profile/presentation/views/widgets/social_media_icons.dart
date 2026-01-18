import 'package:easy_deal/features/profile/presentation/views/widgets/social_icons_shimmer.dart';

import '../../../../../main_imports.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_states.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();

        /// 🔹 أثناء التحميل
        if (state is GetSocialMediaLoadingState || profileCubit.socialMediaModel == null) {
          return const SocialIconsShimmer();
        }

        /// 🔹 بعد التحميل
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                profileCubit.openSocialLink(
                  profileCubit.socialMediaModel!.data!.facebook.toString(),
                );
              },
              icon: SvgPicture.asset(SvgImages.facebook),
            ),
            IconButton(
              onPressed: () {
                profileCubit.openSocialLink(
                  profileCubit.socialMediaModel!.data!.linkedin.toString(),
                );
              },
              icon: SvgPicture.asset(SvgImages.linkedin),
            ),
            IconButton(
              onPressed: () {
                profileCubit.openSocialLink(
                  profileCubit.socialMediaModel!.data!.twitter.toString(),
                );
              },
              icon: SvgPicture.asset(SvgImages.twitter),
            ),
          ],
        );
      },
    );
  }
}

