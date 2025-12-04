import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: ListView(
        children: <Widget>[
          Gap(400.h),
          Text(title.tr(),style: AppStyles.black16Medium,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
