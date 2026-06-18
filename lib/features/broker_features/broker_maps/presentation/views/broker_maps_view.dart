import 'package:easy_deal/features/broker_features/broker_maps/presentation/views/widgets/header_section.dart';
import 'package:easy_deal/features/broker_features/broker_maps/presentation/views/widgets/locations_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
import '../view_model/broker_maps_cubit.dart';
import '../view_model/broker_maps_states.dart';

class BrokerMapsView extends StatefulWidget {
  const BrokerMapsView({super.key});
  @override
  State<BrokerMapsView> createState() => _BrokerMapsViewState();
}

class _BrokerMapsViewState extends State<BrokerMapsView> {
  @override
  void initState() {
    super.initState();
    var brokerId = CacheHelper.getData(key: StorageKeys.userId);
    context.read<BrokerMapsCubit>().getMaps(brokerId: brokerId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.maps),
      body: BlocBuilder<BrokerMapsCubit, BrokerMapsStates>(
        builder: (context, state) {
          if (state is GetMapsLoadingState) {
            return const CustomLoading();
          } else if (state is GetMapsErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.error),
                  Gap(16.h),
                  CustomButton(
                    text: LangKeys.reload,
                    onPressed: () {
                      var brokerId = CacheHelper.getData(key: StorageKeys.userId);
                      context.read<BrokerMapsCubit>().getMaps(brokerId: brokerId ?? 0);
                    },
                  ),
                ],
              ),
            );
          } else if (state is GetMapsSuccessState) {
            var data = state.mapsModel?.data ?? [];
            if (data.isEmpty) {
              return Center(
                child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr()),
              );
            }
            return Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSection(),
                  Gap(12.h),
                  Expanded(
                    child: LocationsListView(locations: data),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}