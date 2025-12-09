import 'package:easy_deal/features/assign_to_broker/data/models/broker_model.dart';

import '../../../../../main_imports.dart';
import '../../view_model/assign_to_broker_cubit.dart';

class AssignBrokerItem extends StatelessWidget {
  const AssignBrokerItem({super.key, required this.isSelected, required this.item});
  final bool isSelected;
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: isSelected
              ? AppColors.primaryDark
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: ListTile(
        leading: Checkbox(
          value: isSelected,
          checkColor: AppColors.white,
          activeColor: AppColors.primaryDark,
          onChanged: (value) => context.read<AssignToBrokerCubit>().toggleItemSelection(item),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        title: Row(
          children: [
            CustomNetWorkImage(imageUrl: item.imageUrl, fit: BoxFit.cover,raduis: 50.r,height: 50.h,width: 50.w,),
            Gap(6.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(SvgImages.star,height: 16.h,),
                    Text("4.6",style: AppStyles.black12Medium,),
                  ],
                ),
              ],
            ),
          ],
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.blueLight
          ),
          child: Text("Business",style: AppStyles.primary16SemiBold,),
        ),
        onTap: () => context.read<AssignToBrokerCubit>().toggleItemSelection(item),
      ),
    );
  }
}
