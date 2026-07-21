import 'package:easy_deal/features/broker_features/boker_data/data/models/broker_units_model.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/views/widgets/broker_data_filter_sheet.dart';
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
  BrokerDataFilterResult? _appliedFilters;

  List<BrokerUnitData> _filterData(List<BrokerUnitData> data) {
    if (_appliedFilters == null || !_appliedFilters!.hasFilters) return data;
    return data.where((item) {
      if (_appliedFilters!.unitType != null &&
          item.type != _appliedFilters!.unitType) {
        return false;
      }
      if (_appliedFilters!.compoundType != null &&
          item.compoundType != _appliedFilters!.compoundType) {
        return false;
      }
      if (_appliedFilters!.operation != null &&
          item.unitOperation != _appliedFilters!.operation) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    var brokerId = CacheHelper.getData(key: StorageKeys.brokerId);
    context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.myData,
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showBrokerDataFilterSheet(context, _appliedFilters);
              if (result != null) {
                setState(() => _appliedFilters = result);
              }
            },
            icon: SvgPicture.asset(
              SvgImages.filter,
              colorFilter: ColorFilter.mode(
                _appliedFilters?.hasFilters == true ? AppColors.primaryDark : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<BrokerDataCubit, BrokerDataStates>(
        buildWhen: (previous, current){
          return current is GetBrokerUnitsLoadingState ||
          current is GetBrokerUnitsSuccessState ||
          current is GetBrokerUnitsErrorState ;
        },
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
            var filteredData = _filterData(data);
            return RefreshIndicator(
              onRefresh: () async {
                var brokerId = CacheHelper.getData(key: StorageKeys.brokerId);
                await context.read<BrokerDataCubit>().getBrokerUnits(brokerId: brokerId ?? 0, isRefresh: true);
              },
              child: DataTableWidget(data: filteredData),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}