import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class SelectGenderType extends StatelessWidget {
  const SelectGenderType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.selectGender.tr(),style: AppStyles.black16SemiBold,),
        Gap(12.h),
        BlocBuilder<RegisterCubit , RegisterStates>(
          builder: (context,state){
            var registerCubit = context.read<RegisterCubit>();
            return  Row(
              children: [
                Expanded(child: InkWell(
                  onTap: (){
                    registerCubit.selectGender(1);
                  },
                  borderRadius: BorderRadius.circular(40.r),
                  child: Container(
                    height : 45.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: registerCubit.selectGenderIndex==1 ? AppColors.blue : AppColors.white,
                      border: Border.all(
                        color: Color.fromRGBO(213, 224, 252, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.male,height: 20.h,
                          colorFilter: ColorFilter.mode(
                              registerCubit.selectGenderIndex==1 ? AppColors.white : AppColors.black , BlendMode.srcIn),
                        ),
                        Gap(8.w),
                        Text(LangKeys.male.tr(),style:registerCubit.selectGenderIndex==1 ? AppStyles.white14SemiBold : AppStyles.black14SemiBold,),
                      ],
                    ),
                  ),
                )),
                Gap(12.w),
                Expanded(child: InkWell(
                  onTap: (){
                    registerCubit.selectGender(2);
                  },
                  borderRadius: BorderRadius.circular(40.r),
                  child: Container(
                    height : 45.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: registerCubit.selectGenderIndex==2 ? AppColors.blue : AppColors.white,
                      border: Border.all(
                        color: Color.fromRGBO(213, 224, 252, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.female,height: 20.h,
                          colorFilter: ColorFilter.mode(
                              registerCubit.selectGenderIndex==2 ? AppColors.white : AppColors.black , BlendMode.srcIn),
                        ),
                        Gap(8.w),
                        Text(LangKeys.female.tr(),style:registerCubit.selectGenderIndex==2 ? AppStyles.white14SemiBold : AppStyles.black14SemiBold,),
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
