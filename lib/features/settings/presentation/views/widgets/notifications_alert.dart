import 'package:easy_deal/features/settings/presentation/view_model/settings_cubit.dart';
import 'package:easy_deal/features/settings/presentation/view_model/settings_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class NotificationsAlert extends StatelessWidget {
  const NotificationsAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LangKeys.alertAndNotifications),
          style: AppStyles.black16SemiBold,
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  SvgImages.notify2,
                  height: 50.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                ),
                Gap(6.w),
                Text(
                context.tr(LangKeys.enableNotifications),
                  style: AppStyles.primary14Medium,
                ),
              ],
            ),
            BlocBuilder<AppSettingsCubit , AppSettingsStates>(
              builder: (context,state){
                var appSettingsCubit = context.read<AppSettingsCubit>();
                return CupertinoSwitch(
                  activeTrackColor: AppColors.primaryDark,
                  value: appSettingsCubit.enableNotifications,
                  onChanged: (value) {
                    appSettingsCubit.changeNotificationsEnable(value);
                  },
                );
              },
            ),
          ],
        ),
        Divider(
          color: Color.fromRGBO(213, 224, 252, 1),
          height: 24.h,
        ),
      ],
    );
  }
}
