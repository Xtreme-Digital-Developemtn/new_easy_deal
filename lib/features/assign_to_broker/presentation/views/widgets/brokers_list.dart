import 'package:easy_deal/features/assign_to_broker/presentation/view_model/assign_to_broker_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../view_model/assign_to_broker_cubit.dart';
import 'assign_broker_item.dart';

class AssignBrokersList extends StatelessWidget {
  const AssignBrokersList({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignToBrokerCubit , AssignToBrokerStates>(
      builder: (context,state){
        var assignToBrokerCubit = context.read<AssignToBrokerCubit>();
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.selectBroker.tr(), style: AppStyles.black16SemiBold),
            Gap(12.h),
            Card(
              elevation: 2,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ListTile(
                leading: Checkbox(
                  value: assignToBrokerCubit.selectAll,
                  checkColor: AppColors.white,
                  activeColor: AppColors.primaryDark,
                  onChanged: (value) => assignToBrokerCubit.toggleSelectAll(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          LangKeys.selectAll.tr(),
                          style: AppStyles.black16SemiBold,
                        ),
                        Gap(8.w),
                        SvgPicture.asset(SvgImages.arrowDown,colorFilter: ColorFilter.mode(AppColors.black,
                            BlendMode.srcIn),),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          LangKeys.type.tr(),
                          style: AppStyles.black16SemiBold,
                        ),
                        Gap(8.w),
                        SvgPicture.asset(
                          SvgImages.arrowDown,colorFilter: ColorFilter.mode(AppColors.black,
                            BlendMode.srcIn),),
                      ],
                    ),
                  ],
                ),
                onTap: assignToBrokerCubit.toggleSelectAll,
              ),
            ),
            Gap(12.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: assignToBrokerCubit.assignBrokersList.length,
              separatorBuilder: (context, index) => Gap(8.h),
              itemBuilder: (context, index) {
                final item = assignToBrokerCubit.assignBrokersList[index];
                final isSelected = assignToBrokerCubit.selectedItems.contains(item);
                return AssignBrokerItem(isSelected : isSelected,item: item,);
              },
            ),
          ],
        );
      },

    );
  }
}
