import 'package:easy_deal/features/home/data/models/best_seller_units_model.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/shared_widgets/empty_widget.dart';
import '../../../../../main_imports.dart';
import '../../../../home/presentation/views/widgets/unit_item.dart';
import 'load_more_indicator.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      buildWhen: (previous, current) =>
          current is SearchInitState ||
          current is GetAllUnitsLoadingState ||
          current is GetAllUnitsSuccessState ||
          current is GetAllUnitsFilterSuccessState ||
          current is GetAllUnitsErrorState ||
          current is GetAllUnitsLoadingMoreState ||
          current is GetAllUnitsLoadMoreSuccessState,
      builder: (context, state) {
        final searchCubit = context.read<SearchCubit>();
        final bool isInitialLoading =
            searchCubit.isLoading && searchCubit.allUnitsModel == null;
        final List<Data>? data = searchCubit.allUnitsModel?.data;
        final bool isEmpty =
            data != null && data.isEmpty && !searchCubit.isLoadingMore;

        int itemCount;
        if (isInitialLoading) {
          itemCount = 5;
        } else if (isEmpty) {
          itemCount = 1;
        } else if (data != null) {
          itemCount = data.length + (searchCubit.hasMore ? 1 : 0);
        } else {
          itemCount = 0;
        }

        if (itemCount == 0) {
          return const SizedBox.shrink();
        }

        return Skeletonizer(
          enabled: isInitialLoading,
          child: ListView.separated(
            key: const PageStorageKey<String>('search_list'),
            controller: scrollController,
            padding: EdgeInsets.only(bottom: 20.h),
            itemBuilder: (context, index) {
                  if (isInitialLoading) {
                return _buildSkeletonItem();
              }
              if (isEmpty) {
                return EmptyWidget(msg: LangKeys.noUnitsFound);
              }
              if (data == null) {
                return const SizedBox.shrink();
              }
              if (index >= data.length) {
                return LoadMoreIndicator(
                  hasMore: searchCubit.hasMore,
                  isLoadingMore: searchCubit.isLoadingMore,
                  onTap: () => searchCubit.loadMoreUnits(),
                );
              }
              return UnitItem(unit: data[index]);
            },
            separatorBuilder: (context, index) {
              if (isInitialLoading || isEmpty || data == null || index >= data.length - 1) {
                return const SizedBox.shrink();
              }
              return Gap(12.h);
            },
            itemCount: itemCount,
          ),
        );
      },
    );
  }

  Widget _buildSkeletonItem() {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 120.w,
            height: 150.h,
            color: Colors.grey[200],
          ),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.w,
                  height: 20.h,
                  color: Colors.grey[200],
                ),
                Gap(8.h),
                Container(
                  width: 150.w,
                  height: 16.h,
                  color: Colors.grey[200],
                ),
                Gap(8.h),
                Container(
                  width: 120.w,
                  height: 16.h,
                  color: Colors.grey[200],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
