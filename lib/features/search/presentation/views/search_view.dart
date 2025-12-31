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
                  child: Skeletonizer(
                    enabled: searchCubit.allUnitsModel==null || state is GetAllUnitsLoadingState,
                    child:
            searchCubit.allUnitsModel!=null  &&  searchCubit.allUnitsModel!.data!.isEmpty
            ? EmptyWidget(msg: LangKeys.noUnitsFound):
                    ListView.separated(
                      itemBuilder: (context,index){
                        return UnitItem();
                      },
                      separatorBuilder: (context,index){
                        return Gap(12.h);
                      },
                      itemCount:searchCubit.allUnitsModel?.data?.length ?? 10,
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
