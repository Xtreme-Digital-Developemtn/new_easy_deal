import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';

import '../../../../../main_imports.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.index, required this.image, required this.name, required this.des});
  final int index;
  final String image;
  final String name;
  final String des;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit , CreateRequestStates>(
      builder: (context,state){
        var createRequestCubit = context.read<CreateRequestCubit>();
        return GestureDetector(
          onTap: () {
            createRequestCubit.selectCategory(index);
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xffD5E0FC),
                    width: 2.r,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                       image,
                      height: 50.h,
                      width: 50.w,
                      colorFilter:
                      ColorFilter.mode(
                          createRequestCubit.selectedIndex == index
                              ? AppColors.primaryLight
                              :
                          AppColors.primaryDark, BlendMode.srcIn),

                    ),
                    Gap(12.h),
                    Text(
                       name,
                      style: AppStyles.black14SemiBold.copyWith(
                        color: createRequestCubit.selectedIndex == index
                            ? AppColors.primaryLight
                            : AppColors.primaryDark,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(4.h),
                    Text(
                      des,
                      style: AppStyles.black14Medium.copyWith(
                        color: createRequestCubit.selectedIndex == index
                            ? AppColors.primaryLight
                            : AppColors.primaryDark,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if(createRequestCubit.selectedIndex == index)
              Padding(
                padding:   EdgeInsets.all(12.r),
                child: Container(
                  height: 25.h,
                  padding: EdgeInsets.all(2.r),
                  width: 25.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryLight
                  ),
                  child: Center(child: Icon(Icons.check,color: AppColors.white,)),
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}
