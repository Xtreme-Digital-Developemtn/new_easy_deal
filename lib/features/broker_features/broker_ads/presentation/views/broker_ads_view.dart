import 'package:easy_deal/features/broker_features/broker_ads/presentation/views/widgets/ads_list_widget.dart';
import 'package:easy_localization/easy_localization.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.myAds),
      body: BlocConsumer<BrokerAdsCubit, BrokerAdsStates>(
        listener: (context, state) {
          if (state is LoadMoreAdvertisementShuffleErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
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
                  Text(state.error),
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
