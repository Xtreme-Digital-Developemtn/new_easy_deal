import 'package:easy_deal/features/requests/presentation/view_model/requests_cubit.dart';
import 'package:easy_deal/features/requests/presentation/view_model/requests_states.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_count.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_list.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/enums.dart';

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
        context.read<RequestsCubit>().loadMoreRequests(context: context);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _buildToggleButton({
    required BuildContext context,
    required String label,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryDark : AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isActive ? AppColors.primaryDark : AppColors.blueLight,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
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
                        onPressed: () => requestsCubit.getAllRequests(context: context),
                        text: LangKeys.reload.tr(),
                      ),
                    ],
                  ),
                );
              }

              final isLoading =
                  state is GetAllRequestsLoadingState &&
                      (requestsCubit.currentType == RequestType.assigned
                          ? requestsCubit.assignedRequests.isEmpty
                          : requestsCubit.requests.isEmpty);

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
                  Row(
                    children: [
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: "بواسطتي",
                          isActive: requestsCubit.currentType == RequestType.assigned,
                          onPressed: () {
                            requestsCubit.changeType(RequestType.assigned, context);
                          },
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: "المرسلة",
                          isActive: requestsCubit.currentType == RequestType.sent,
                          onPressed: () {
                            requestsCubit.changeType(RequestType.sent, context);
                          },
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: "المستلمة",
                          isActive: requestsCubit.currentType == RequestType.received,
                          onPressed: () {
                            requestsCubit.changeType(RequestType.received, context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(24.h),
                  RequestsList(
                    controller: scrollController,
                    data: requestsCubit.currentType == RequestType.assigned
                        ? requestsCubit.assignedRequests
                        : requestsCubit.requests,
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