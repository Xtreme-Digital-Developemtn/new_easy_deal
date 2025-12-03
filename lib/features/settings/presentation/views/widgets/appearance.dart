import 'package:easy_deal/features/settings/presentation/views/widgets/mode_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class Appearance extends StatelessWidget {
  const Appearance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.appearance.tr(),
          style: AppStyles.black16SemiBold,
        ),
        Gap(12.h),
        Row(
          children: [
            ModeItem(modeTitle: LangKeys.lightMode.tr(), modeIcon: Icons.light_mode_outlined,modeInex: 0,),
            Gap(12.w),
            ModeItem(modeTitle: LangKeys.darkMode.tr(), modeIcon: Icons.dark_mode_outlined,modeInex: 1,)

          ],
        ),
        Gap(12.h),
        Row(
          children: [
            ModeItem(
                modeTitle: LangKeys.useDeviceSettings.tr(),
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
