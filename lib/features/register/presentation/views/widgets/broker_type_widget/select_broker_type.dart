import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/register_cubit.dart';
import '../../../view_model/register_states.dart';

class SelectBrokerType extends StatelessWidget {
  const SelectBrokerType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.selectBrokerType.tr(),style: AppStyles.black16SemiBold,),
        Gap(12.h),
        BlocBuilder<RegisterCubit , RegisterStates>(
          builder: (context,state){
            var registerCubit = context.read<RegisterCubit>();
            return  Row(
              children: [
                Expanded(child: InkWell(
                  onTap: (){
                    registerCubit.selectBroker(1);
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: registerCubit.selectBrokerIndex==1 ? AppColors.primaryDark : AppColors.white,
                      border: Border.all(
                        color: Color.fromRGBO(213, 224, 252, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.male,height: 30.h,
                          colorFilter: ColorFilter.mode(
                              registerCubit.selectBrokerIndex==1 ? AppColors.white : AppColors.black , BlendMode.srcIn),
                        ),
                        Gap(8.w),
                        Text(LangKeys.male.tr(),style:registerCubit.selectBrokerIndex==1 ? AppStyles.white16SemiBold : AppStyles.black16SemiBold,),
                      ],
                    ),
                  ),
                )),
                Gap(12.w),
                Expanded(child: InkWell(
                  onTap: (){
                    registerCubit.selectBroker(2);
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: registerCubit.selectBrokerIndex==2 ? AppColors.primaryDark : AppColors.white,
                      border: Border.all(
                        color: Color.fromRGBO(213, 224, 252, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.female,height: 30.h,
                          colorFilter: ColorFilter.mode(
                              registerCubit.selectBrokerIndex==2 ? AppColors.white : AppColors.black , BlendMode.srcIn),
                        ),
                        Gap(8.w),
                        Text(LangKeys.female.tr(),style:registerCubit.selectBrokerIndex==2 ? AppStyles.white16SemiBold : AppStyles.black16SemiBold,),
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
