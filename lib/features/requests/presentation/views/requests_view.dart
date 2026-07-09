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
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _buildToggleButton({
    required BuildContext context,
    required String label,
    required int count,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isActive ? AppColors.white : AppColors.textSecondary,
                ),
              ),
              Gap(6.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.white.withValues(alpha: 0.2) : AppColors.blueLight,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: isActive ? AppColors.white : AppColors.primaryDark,
                  ),
                ),
              ),
            ],
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
              final cubit = context.read<RequestsCubit>();

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
                        onPressed: () => cubit.fetchAllTypes(context: context),
                        text: LangKeys.reload.tr(),
                      ),
                    ],
                  ),
                );
              }

              final isLoading = state is GetAllRequestsLoadingState && cubit.currentList.isEmpty;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeletonizer(
                    enabled: isLoading,
                    child: RequestsCount(
                      count: cubit.currentModel?.data.count ?? cubit.currentList.length,
                    ),
                  ),
                  Gap(24.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: "بواسطتي",
                          count: cubit.currentType == RequestType.assigned
                              ? cubit.currentList.length
                              : cubit.assignedCount,
                          isActive: cubit.currentType == RequestType.assigned,
                          onPressed: () => cubit.changeType(RequestType.assigned),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: "المرسلة",
                          count: cubit.currentType == RequestType.sent
                              ? cubit.currentList.length
                              : cubit.sentCount,
                          isActive: cubit.currentType == RequestType.sent,
                          onPressed: () => cubit.changeType(RequestType.sent),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: "المستلمة",
                          count: cubit.currentType == RequestType.received
                              ? cubit.currentList.length
                              : cubit.receivedCount,
                          isActive: cubit.currentType == RequestType.received,
                          onPressed: () => cubit.changeType(RequestType.received),
                        ),
                      ),
                    ],
                  ),
                  Gap(24.h),
                  RequestsList(
                    controller: scrollController,
                    data: cubit.currentList,
                    isLoading: isLoading,
                    hasMore: false,
                    isLoadingMore: false,
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
