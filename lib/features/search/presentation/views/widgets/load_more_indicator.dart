import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';

import '../../../../../main_imports.dart';

class LoadMoreIndicator extends StatelessWidget {
  const LoadMoreIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit , SearchStates>(
      builder: (context,state){
        var searchCubit = context.read<SearchCubit>();
        if (!searchCubit.hasMore) {
          return SizedBox.shrink();
        }
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            children: [
              if (searchCubit.isLoadingMore)
                CustomLoading()
              else
                GestureDetector(
                  onTap: () {
                    if (!searchCubit.isLoadingMore) {
                      searchCubit.loadMoreUnits();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          size: 16.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                        Gap(8.w),
                        Text(
                          'تحميل المزيد',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },

    );
  }
}
