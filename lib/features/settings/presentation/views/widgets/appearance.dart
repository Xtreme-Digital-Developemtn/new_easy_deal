import 'package:easy_deal/features/settings/presentation/views/widgets/mode_item.dart';
import 'package:easy_deal/main_imports.dart';

class Appearance extends StatelessWidget {
  const Appearance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.appearance,
          style: AppStyles.black16SemiBold,
        ),
        Gap(12.h),
        Row(
          children: [
            ModeItem(modeTitle: LangKeys.lightMode, modeIcon: Icons.light_mode_outlined,modeInex: 0,),
            Gap(12.w),
            ModeItem(modeTitle: LangKeys.darkMode, modeIcon: Icons.dark_mode_outlined,modeInex: 1,)

          ],
        ),
        Gap(12.h),
        Row(
          children: [
            ModeItem(
                modeTitle: LangKeys.useDeviceSettings,
               svgImage: SvgImages.mobile,
              modeInex: 2,
            ),
          ],
        ),
        Divider(
          color: Color.fromRGBO(213, 224, 252, 1),
          height: 24.h,
        )
      ],
    );
  }
}
