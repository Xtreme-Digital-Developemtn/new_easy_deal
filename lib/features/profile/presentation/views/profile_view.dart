import 'package:easy_deal/features/profile/presentation/views/widgets/profile_data_name_code_image.dart';
import 'package:easy_deal/features/profile/presentation/views/widgets/profile_list_items.dart';
import 'package:easy_deal/main_imports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(12.0.r),
        child: Column(
          children: [
            ProfileDataNameCodeImage(),
            Gap(16.h),
            ProfileListItems(),
          ],
        ),
      )),
    );
  }
}
