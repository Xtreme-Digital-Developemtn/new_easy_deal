import 'package:easy_deal/core/shared_widgets/container_search_widget.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_deal/features/search/presentation/views/widgets/filter_container.dart';
import 'package:easy_deal/features/search/presentation/views/widgets/search_content.dart';
import 'package:easy_deal/main_imports.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<SearchCubit>();
      if (cubit.allUnitsModel == null) {
        cubit.getAllUnits();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      final cubit = context.read<SearchCubit>();
      if (!cubit.isLoadingMore && cubit.hasMore) {
        cubit.loadMoreUnits();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: BlocBuilder<SearchCubit, SearchStates>(
            builder: (context, state) {
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
                      child: SearchContent(scrollController: _scrollController),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // // مؤشر التحميل في أسفل الشاشة
  // Widget _buildBottomLoadingIndicator() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 10.h),
  //     color: Colors.transparent,
  //     child: Column(
  //       children: [
  //         LinearProgressIndicator(
  //           minHeight: 2.h,
  //           backgroundColor: Colors.transparent,
  //           valueColor: AlwaysStoppedAnimation<Color>(
  //             Theme.of(context).primaryColor,
  //           ),
  //         ),
  //         Gap(10.h),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               width: 20.w,
  //               height: 20.h,
  //               child: CircularProgressIndicator(
  //                 strokeWidth: 2.0,
  //                 valueColor: AlwaysStoppedAnimation<Color>(
  //                   Theme.of(context).primaryColor,
  //                 ),
  //               ),
  //             ),
  //             Gap(8.w),
  //             Text(
  //               'جاري تحميل المزيد...',
  //               style: TextStyle(
  //                 fontSize: 12.sp,
  //                 color: Colors.grey[600],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
