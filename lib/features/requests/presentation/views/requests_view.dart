import 'package:easy_deal/features/requests/presentation/view_model/requests_cubit.dart';
import 'package:easy_deal/features/requests/presentation/view_model/requests_states.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_count.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_list.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/enums.dart';
import '../../../profile/presentation/view_model/profile_cubit.dart';
import '../../../profile/presentation/view_model/profile_states.dart';
import 'widgets/requests_filter.dart';

class RequestsView extends StatefulWidget {
  const RequestsView({super.key});

  @override
  State<RequestsView> createState() => _RequestsViewState();
}

class _RequestsViewState extends State<RequestsView> {
  final ScrollController scrollController = ScrollController();
  RequestsFilterResult? _appliedFilters;
  bool _didFetch = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    // الشاشة بتتبني جوه IndexedStack أول ما الـ Layout يفتح، يعني قبل ما
    // البروفايل يخلّص تحميل. فبنأجّل أول نداء لحد ما يبقى معانا userId،
    // وإلا كان بيطلع خطأ في أول مرة بس.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _fetchWhenProfileReady(),
    );
  }

  void _fetchWhenProfileReady() {
    if (_didFetch || !mounted) return;
    if (context.read<ProfileCubit>().clientProfileModel?.data?.id == null) {
      return;
    }
    _didFetch = true;
    context.read<RequestsCubit>().fetchAllTypes(
      context: context,
      filters: _appliedFilters?.toQueryParams(),
    );
  }

  /// إعادة تحميل بنفس الفلاتر المطبّقة — بتستخدم في السحب للتحديث
  /// وبعد الرجوع من شاشة تفاصيل الطلب عشان الحالة تتحدّث على الكارت
  Future<void> _refresh() async {
    if (!mounted) return;
    if (!_didFetch) {
      _fetchWhenProfileReady();
      return;
    }
    await context.read<RequestsCubit>().fetchAllTypes(
      context: context,
      filters: _appliedFilters?.toQueryParams(),
    );
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final maxScroll = scrollController.position.maxScrollExtent;
    final current = scrollController.position.pixels;
    if (maxScroll > 0 && current >= maxScroll - 200) {
      final cubit = context.read<RequestsCubit>();
      if (cubit.currentHasMore && !cubit.isLoadingMore) {
        cubit.loadMore(context: context);
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  Widget _buildToggleButton({
    required BuildContext context,
    required String label,
    required int count,
    required bool isActive,
    required VoidCallback onPressed,
  })
  {
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
        child: BlocListener<ProfileCubit, ProfileStates>(
          listener: (context, profileState) {
            if (profileState is GetClientProfileSuccessState) {
              _fetchWhenProfileReady();
            } else if (profileState is GetClientProfileErrorState &&
                !_didFetch) {
              // البروفايل نفسه فشل، فبنخلي شاشة الطلبات توري رسالة الخطأ
              // وزرار إعادة التحميل بدل ما تفضل معلّقة على السكيليتون.
              _didFetch = true;
              context.read<RequestsCubit>().fetchAllTypes(context: context);
            }
          },
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

              // حالة البداية برضه تحميل، عشان مايظهرش «لا توجد طلبات»
              // في اللحظة اللي بين فتح التاب وأول نداء.
              final isLoading =
                  state is GetAllRequestsLoadingState || state is RequestsInitState;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeletonizer(
                    enabled: isLoading,
                    child: RequestsCount(
                      count: cubit.displayCount,
                      currentFilters: _appliedFilters,
                      onFilterApplied: (result) {
                        setState(() => _appliedFilters = result);
                        cubit.fetchAllTypes(
                          context: context,
                          filters: result?.toQueryParams(),
                        );
                      },
                    ),
                  ),
                  Gap(24.h),
                  if (cubit.isBroker)
                  Skeletonizer(
                    enabled: isLoading,
                    child: Row(
                    children: [
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: LangKeys.assigned.tr(),
                          count: cubit.assignedCount,
                          isActive: cubit.currentType == RequestType.assigned,
                          onPressed: () => cubit.changeType(RequestType.assigned),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: LangKeys.sentRequestsTab.tr(),
                          count: cubit.sentCount,
                          isActive: cubit.currentType == RequestType.sent,
                          onPressed: () => cubit.changeType(RequestType.sent),
                        ),
                      ),
                      Gap(8.w),
                      Expanded(
                        child: _buildToggleButton(
                          context: context,
                          label: LangKeys.receivedRequestsTab.tr(),
                          count: cubit.receivedCount,
                          isActive: cubit.currentType == RequestType.received,
                          onPressed: () => cubit.changeType(RequestType.received),
                        ),
                      ),
                    ],
                  ),
                  ),
                  Gap(24.h),
                  RequestsList(
                    controller: scrollController,
                    data: cubit.currentList,
                    receiverNames: cubit.currentReceiverNames,
                    isLoading: isLoading,
                    hasMore: cubit.currentHasMore,
                    isLoadingMore: cubit.isLoadingMore,
                    onRefresh: _refresh,
                  ),
                ],
              );
            },
          ),
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed(Routes.createRequestView);
          if (!context.mounted || !mounted) return;
          // بعد الرجوع من إنشاء طلب بنعيد التحميل بنفس الفلاتر المطبّقة،
          // وإلا الطلب الجديد مايظهرش إلا لما التاب يتقفل ويتفتح تاني.
          if (!_didFetch) {
            _fetchWhenProfileReady();
            return;
          }
          context.read<RequestsCubit>().fetchAllTypes(
            context: context,
            filters: _appliedFilters?.toQueryParams(),
          );
        },
        backgroundColor: AppColors.primaryDark,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
