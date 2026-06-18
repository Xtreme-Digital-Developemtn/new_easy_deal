import 'package:easy_deal/features/broker_features/broker_ads/presentation/views/widgets/ads_table_widget.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<BrokerAdsCubit>().getAdvertisementShuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.myAds),
      body: BlocBuilder<BrokerAdsCubit, BrokerAdsStates>(
        builder: (context, state) {
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
            var data = state.advertisementShuffleModel?.data ?? [];
            if (data.isEmpty) {
              return Center(
                child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr()),
              );
            }
            return AdsTableWidget(data: data);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
