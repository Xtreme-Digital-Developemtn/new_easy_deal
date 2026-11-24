import 'package:easy_deal/features/broker_features/broker_ads/presentation/views/widgets/ads_list_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/errors/error_messages.dart';
import '../../../../../main_imports.dart';
import '../view_model/broker_ads_cubit.dart';
import '../view_model/broker_ads_states.dart';

class BrokerAdsView extends StatefulWidget {
  const BrokerAdsView({super.key});
  @override
  State<BrokerAdsView> createState() => _BrokerAdsViewState();
}

class _BrokerAdsViewState extends State<BrokerAdsView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    context.read<BrokerAdsCubit>().getAdvertisementShuffle();
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final maxScroll = scrollController.position.maxScrollExtent;
    final current = scrollController.position.pixels;
    if (maxScroll > 0 && current >= maxScroll - 200) {
      final cubit = context.read<BrokerAdsCubit>();
      if (cubit.hasMore && !cubit.isLoadingMore) {
        cubit.loadMore();
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  /// «إنشاء إعلان جديد» — بيفتح نفس form إضافة الوحدة. في آخر الـ form زرار
  /// «إنشاء ونشر» اللي بياخد caption وبيبعت isAdvertisement = 1، فالوحدة
  /// بتتسجل كإعلان وتظهر هنا. بعد الرجوع بنعمل refresh لليستة.
  Future<void> _openCreateAd() async {
    await context.pushNamed(Routes.addPropertyView);
    if (!mounted) return;
    context.read<BrokerAdsCubit>().getAdvertisementShuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.myAds),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openCreateAd,
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add, color: AppColors.white),
        label: Text(
          LangKeys.createNewAd.tr(),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<BrokerAdsCubit, BrokerAdsStates>(
        listener: (context, state) {
          if (state is LoadMoreAdvertisementShuffleErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(localizeErrorMessage(state.error))),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<BrokerAdsCubit>();
          if (state is GetAdvertisementShuffleLoadingState) {
            return const CustomLoading();
          } else if (state is GetAdvertisementShuffleErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      localizeErrorMessage(state.error),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gap(16.h),
                  CustomButton(
                    text: LangKeys.reload,
                    onPressed: () {
                      context.read<BrokerAdsCubit>().getAdvertisementShuffle();
                    },
                  ),
                ],
              ),
            );
          } else if (state is GetAdvertisementShuffleSuccessState) {
            final data = cubit.ads;
            if (data.isEmpty) {
              return Center(
                child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr()),
              );
            }
            return RefreshIndicator(
              onRefresh: cubit.getAdvertisementShuffle,
              child: AdsListWidget(
                data: data,
                controller: scrollController,
                isLoadingMore: cubit.isLoadingMore,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
