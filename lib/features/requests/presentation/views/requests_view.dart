import 'package:easy_deal/features/requests/presentation/view_model/requests_cubit.dart';
import 'package:easy_deal/features/requests/presentation/view_model/requests_states.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_count.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_list.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RequestsView extends StatefulWidget {
  const RequestsView({super.key});

  @override
  State<RequestsView> createState() => _RequestsViewState();
}

class _RequestsViewState extends State<RequestsView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        context.read<RequestsCubit>().loadMoreRequests();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: BlocBuilder<RequestsCubit, RequestsStates>(
            builder: (context, state) {
              final requestsCubit = context.read<RequestsCubit>();

              if (state is GetAllRequestsErrorState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.error,
                        style: AppStyles.gray14Medium,
                        textAlign: TextAlign.center,
                      ),
                      Gap(16.h),
                      CustomButton(
                        onPressed: () => requestsCubit.getAllRequests(),
                        text: LangKeys.reload.tr(),
                      ),
                    ],
                  ),
                );
              }

              final isLoading =
                  state is GetAllRequestsLoadingState &&
                      requestsCubit.requests.isEmpty;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeletonizer(
                    enabled: isLoading,
                    child: RequestsCount(
                      count: requestsCubit.allRequestModel?.data.count ?? 0,
                    ),
                  ),
                  Gap(24.h),
                  RequestsList(
                    controller: scrollController,
                    data: requestsCubit.requests,
                    isLoading: isLoading,
                    hasMore: requestsCubit.hasMore,
                    isLoadingMore: requestsCubit.isLoadingMore,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.createRequestView);
        },
        backgroundColor: AppColors.primaryDark,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}