import 'package:easy_deal/features/profile/presentation/views/widgets/profile_data_name_code_image.dart';
import 'package:easy_deal/features/profile/presentation/views/widgets/profile_list_items.dart';
import 'package:easy_deal/features/profile/presentation/views/widgets/social_media_icons.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(12.0.r),
        child: ListView(
          children: [
            ProfileDataNameCodeImage(),
            Gap(16.h),
            ProfileListItems(),
            Gap(16.h),
            SocialMediaIcons(),
            Gap(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(LangKeys.appVersion.tr(),),
                Gap(6.w),
                Text("1.0.0",style: AppStyles.primary16SemiBold,),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
