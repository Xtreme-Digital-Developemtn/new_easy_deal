import 'package:easy_deal/features/settings/presentation/view_model/settings_cubit.dart';
import 'package:easy_deal/features/settings/presentation/view_model/settings_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

class ModeItem extends StatelessWidget {
  const ModeItem({super.key, required this.modeTitle,   this.modeIcon, this.svgImage, required this.modeInex});
  final String modeTitle;
  final IconData? modeIcon;
  final String? svgImage;
  final int modeInex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AppSettingsCubit , AppSettingsStates>(
        builder: (context,state){
          var appSettingsCubit = context.read<AppSettingsCubit>();
          return  InkWell(
            onTap: (){
              appSettingsCubit.selectMode(modeInex);
            },
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: appSettingsCubit.selectModeIndex==modeInex ? AppColors.primaryDark : AppColors.white,
                border: Border.all(
                  color: Color.fromRGBO(213, 224, 252, 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  svgImage==null ?
                  Icon(modeIcon,color: appSettingsCubit.selectModeIndex==modeInex ? AppColors.white:AppColors.black ,) : SvgPicture.asset(
                    svgImage!,colorFilter: ColorFilter.mode(
                      appSettingsCubit.selectModeIndex==modeInex ? AppColors.white : AppColors.black, BlendMode.srcIn),),
                  Gap(8.w),
                  svgImage==null ?
                  Text(modeTitle.tr(),style: appSettingsCubit.selectModeIndex==modeInex ? AppStyles.white14Medium : AppStyles.black14Medium,) :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(modeTitle.tr(),style:appSettingsCubit.selectModeIndex==modeInex ? AppStyles.white14Medium:  AppStyles.black14Medium,) ,
                      Text(LangKeys.useDeviceSettingsMsg.tr().tr(),style: AppStyles.gray14Medium,) ,
                    ],

                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
