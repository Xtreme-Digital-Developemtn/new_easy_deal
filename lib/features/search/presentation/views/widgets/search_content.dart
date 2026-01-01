import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_deal/features/search/presentation/views/widgets/skeleton_loader.dart';

import '../../../../../core/shared_widgets/empty_widget.dart';
import '../../../../../main_imports.dart';
import '../../../../home/presentation/views/widgets/unit_item.dart';
import 'load_more_indicator.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key, required this.scrollController});
  final   ScrollController scrollController;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SearchCubit , SearchStates>(
      builder: (context,state){
        var searchCubit = context.read<SearchCubit>();
        if (searchCubit.isLoading && searchCubit.allUnitsModel == null) {
          return SkeletonLoader();
        }
        if (searchCubit.allUnitsModel?.data?.isEmpty == true &&
            !searchCubit.isLoading &&
            !searchCubit.isLoadingMore) {
          return EmptyWidget(msg: LangKeys.noUnitsFound);
        }

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                padding: EdgeInsets.only(bottom: 20.h),
                itemBuilder: (context, index) {
                  if (index >= (searchCubit.allUnitsModel?.data?.length ?? 0)) {
                    return LoadMoreIndicator();
                  }

                  return UnitItem(
                    unit: searchCubit.allUnitsModel?.data?[index],
                  );
                },
                separatorBuilder: (context, index) {
                  if (index >= (searchCubit.allUnitsModel?.data?.length ?? 0) - 1) {
                    return SizedBox.shrink();
                  }
                  return Gap(12.h);
                },
                itemCount: (searchCubit.allUnitsModel?.data?.length ?? 0) +
                    (searchCubit.hasMore ? 1 : 0),
              ),
            ),
            // if (searchCubit.isLoadingMore) CustomLoading(),
          ],
        );
      },

    );
  }
}
