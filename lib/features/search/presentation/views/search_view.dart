import 'package:easy_deal/core/shared_widgets/container_search_widget.dart';
import 'package:easy_deal/core/shared_widgets/empty_widget.dart';
import 'package:easy_deal/features/home/presentation/views/widgets/unit_item.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_deal/features/search/presentation/views/widgets/filter_container.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:   EdgeInsets.all(12.r),
        child: BlocBuilder<SearchCubit , SearchStates>(
          builder: (context,state){
            var searchCubit = context.read<SearchCubit>();
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(child: ContainerSearchWidget()),
                    Gap(8.w),
                     FilterContainer(),
                  ],
                ),
                Gap(20.h),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await searchCubit.getAllUnits(reset: true);
                    },
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        // التحقق إذا وصلنا لنهاية الـ ListView
                        if (scrollNotification is ScrollEndNotification) {
                          final metrics = scrollNotification.metrics;
                          if (metrics.atEdge && metrics.pixels != 0) {
                            // تحميل المزيد من البيانات
                            searchCubit.loadMoreUnits();
                          }
                        }
                        return false;
                      },
                      child: Skeletonizer(
                        enabled: (searchCubit.allUnitsModel == null ||
                            state is GetAllUnitsLoadingState) &&
                            !searchCubit.isLoadingMore,
                        child: _buildContent(searchCubit, state, context),
                      ),
                    ),
                  ),
                )
              ],

            );
          },

        ),
      )),
    );
  }
}
Widget _buildContent(SearchCubit cubit, SearchStates state, BuildContext context) {
  // حالة عدم وجود بيانات
  if (cubit.allUnitsModel?.data?.isEmpty == true &&
      !cubit.isLoadingMore &&
      state is! GetAllUnitsLoadingState) {
    return EmptyWidget(msg: LangKeys.noUnitsFound);
  }

  // حالة وجود بيانات
  return Column(
    children: [
      Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            // التحقق إذا وصلنا لعنصر الـ Loading
            if (index >= (cubit.allUnitsModel?.data?.length ?? 0)) {
              return _buildLoadingMoreWidget(cubit);
            }

            return UnitItem(
              unit: cubit.allUnitsModel?.data?[index] ?? null,
            );
          },
          separatorBuilder: (context, index) {
            if (index >= (cubit.allUnitsModel?.data?.length ?? 0) - 1) {
              return SizedBox.shrink();
            }
            return Gap(12.h);
          },
          itemCount: (cubit.allUnitsModel?.data?.length ?? 0) +
              (cubit.hasMore && cubit.isLoadingMore ? 1 : 0),
        ),
      ),
    ],
  );
}

Widget _buildLoadingMoreWidget(SearchCubit cubit) {
  if (!cubit.isLoadingMore) return SizedBox.shrink();

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.h),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}