import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';

import '../../../../../main_imports.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.index, required this.image, required this.name});
  final int index;
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return GestureDetector(
          onTap: () {
            createRequestCubit.selectCategory(index);
          },
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.primaryDark.withValues(alpha: 0.1),
              border: Border.all(
                color: createRequestCubit.selectedIndex == index
                    ? AppColors.primaryDark
                    : Colors.transparent,
                width: 2.r,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                   image,
                  height: 70.h,
                  width: 70.w,
                  colorFilter:

                  ColorFilter.mode(
                      createRequestCubit.selectedIndex == index
                          ? AppColors.primaryDark
                          :
                      AppColors.gray, BlendMode.srcIn),

                ),
                Gap(12.h),
                Text(
                   name,
                  style: AppStyles.black16SemiBold.copyWith(
                    color: createRequestCubit.selectedIndex == index
                        ? AppColors.primaryDark
                        : AppColors.gray,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
