import 'package:easy_deal/features/broker_features/boker_data/presentation/views/widgets/data_table_widget.dart';
import '../../../../../main_imports.dart';
import '../view_model/broker_data_cubit.dart';
import '../view_model/broker_data_states.dart';

class BrokerDataView extends StatefulWidget {
  const BrokerDataView({super.key});
  @override
  State<BrokerDataView> createState() => _BrokerDataViewState();
}

class _BrokerDataViewState extends State<BrokerDataView> {
  @override
  void initState() {
    super.initState();
    var brokerId = CacheHelper.getData(key: StorageKeys.brokerId);
    var userId = CacheHelper.getData(key: StorageKeys.userId);
    context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.myData),
      body: BlocBuilder<BrokerDataCubit, BrokerDataStates>(
        builder: (context, state) {
          if (state is GetBrokerUnitsLoadingState) {
            return const CustomLoading();
          } else if (state is GetBrokerUnitsErrorState) {
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
                      context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId ?? 0);
                    },
                  ),
                ],
              ),
            );
          } else if (state is GetBrokerUnitsSuccessState) {
            var data = state.brokerUnitsModel?.data ?? [];
            return DataTableWidget(data: data);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}