import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class SelectAccountType extends StatelessWidget {
  const SelectAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.selectAccountType.tr(),style: AppStyles.black16SemiBold,),
        Gap(12.h),
        BlocBuilder<RegisterCubit , RegisterStates>(
          builder: (context,state){
            var registerCubit = context.read<RegisterCubit>();
            return  Row(
              children: [
                Expanded(child: InkWell(
                  onTap: (){
                    registerCubit.selectType(1);
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: registerCubit.selectTypeIndex==1 ? AppColors.primaryDark : AppColors.white,
                      border: Border.all(
                        color: Color.fromRGBO(213, 224, 252, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.client,height: 30.h,
                          colorFilter: ColorFilter.mode(
                              registerCubit.selectTypeIndex==1 ? AppColors.white : AppColors.black , BlendMode.srcIn),
                        ),
                        Gap(8.w),
                        Text(LangKeys.client.tr(),style:registerCubit.selectTypeIndex==1 ? AppStyles.white16SemiBold : AppStyles.black16SemiBold,),
                      ],
                    ),
                  ),
                )),
                Gap(12.w),
                Expanded(child: InkWell(
                  onTap: (){
                    registerCubit.selectType(2);
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: registerCubit.selectTypeIndex==2 ? AppColors.primaryDark : AppColors.white,
                      border: Border.all(
                        color: Color.fromRGBO(213, 224, 252, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.client,height: 30.h,
                        colorFilter: ColorFilter.mode(
                            registerCubit.selectTypeIndex==2 ? AppColors.white : AppColors.black , BlendMode.srcIn),
                        ),
                        Gap(8.w),
                        Text(LangKeys.broker.tr(),style:registerCubit.selectTypeIndex==2 ? AppStyles.white16SemiBold : AppStyles.black16SemiBold,),
                      ],
                    ),
                  ),
                )),
              ],
            );
          },

        ),
      ],
    );
  }
}
