import 'package:easy_deal/features/profile/presentation/views/widgets/social_icons_shimmer.dart';
import 'package:easy_localization/easy_localization.dart';

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
        if (profileCubit.isSocialMediaLoading) {
          return const SocialIconsShimmer();
        }

        /// 🔹 فشل التحميل أو لسه مجابش (مثلًا التطبيق اتفتح وهو أوفلاين):
        /// زر إعادة محاولة بدل شيمر بيلف للأبد.
        if (profileCubit.socialMediaModel?.data == null) {
          return Center(
            child: TextButton.icon(
              onPressed: () => profileCubit.getSocialMedia(),
              icon: Icon(
                Icons.refresh,
                size: 20.r,
                color: AppColors.primaryDark,
              ),
              label: Text(
                LangKeys.retry.tr(),
                style: AppStyles.primary16SemiBold,
              ),
            ),
          );
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

