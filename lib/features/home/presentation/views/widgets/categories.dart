import 'package:easy_deal/features/home/presentation/view_model/home_cubit.dart';
import 'package:easy_deal/features/home/presentation/view_model/home_states.dart';
import 'package:easy_deal/main_imports.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) {
        return current is ChooseCategoryState;
      },
      builder: (context, state) {
        var homeCubit = context.read<HomeCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SizedBox(
            height: 24.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    homeCubit.chooseCategory(index);
                    context.pushNamed(Routes.createRequestView);
                    // context.pushNamed(
                    //   Routes.categoryUnitsView,
                    //   arguments: {"categoryName": homeCubit.categories[index]},
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: homeCubit.selectCategory == index
                          ? AppColors.primaryDark
                          : AppColors.backgroundLight,
                    ),
                    child: Center(
                      child: Text(
                        homeCubit.categories[index],
                        style: homeCubit.selectCategory == index
                            ? AppStyles.white12Medium
                            : AppStyles.black12Medium,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Gap(12.w);
              },
              itemCount: homeCubit.categories.length,
            ),
          ),
        );
      },
    );
  }
}
