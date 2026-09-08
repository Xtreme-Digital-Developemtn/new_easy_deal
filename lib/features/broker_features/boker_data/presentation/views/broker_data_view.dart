import 'package:easy_deal/features/broker_features/boker_data/presentation/views/widgets/ads_table_widget.dart';
import 'package:easy_deal/features/broker_features/boker_data/presentation/views/widgets/broker_data_filter_sheet.dart';
import '../../../../../main_imports.dart';
import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import '../view_model/broker_data_cubit.dart';
import '../view_model/broker_data_states.dart';

class BrokerDataView extends StatefulWidget {
  const BrokerDataView({super.key});
  @override
  State<BrokerDataView> createState() => _BrokerDataViewState();
}

class _BrokerDataViewState extends State<BrokerDataView> {
  BrokerDataBasicFilterResult? _basicFilters;
  BrokerDataAdvancedFilterResult? _advancedFilters;
  List<Map<String, dynamic>> _cities = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
    _loadCities();
  }

  void _fetchData() {
    var brokerId = CacheHelper.getData(key: StorageKeys.brokerId);
    final params = <String, dynamic>{};

    if (_basicFilters != null && _basicFilters!.hasFilters) {
      params.addAll(_basicFilters!.toQueryParams());
    }
    if (_advancedFilters != null && _advancedFilters!.hasFilters) {
      params.addAll(_advancedFilters!.toQueryParams());
    }

    context.read<BrokerDataCubit>().getBrokerUnits(
      brokerId: brokerId ?? 0,
      filters: params.isNotEmpty ? params : null,
    );
  }

  Future<void> _loadCities() async {
    try {
      final api = getIt.get<ApiService>();
      final response = await api.getData(
        endPoint: EndPoints.cities,
        query: {'limit': 100, 'offset': 0, 'sort': 'asc', 'sortBy': 'id'},
      );
      final data = response.data['data'];
      if (data != null && data is List) {
        setState(() {
          _cities = data.cast<Map<String, dynamic>>();
        });
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.myData,
        actions: [
          // Advanced filter icon
          IconButton(
            onPressed: () async {
              final result = await showBrokerDataAdvancedFilterSheet(
                context,
                _advancedFilters,
                cities: _cities,
                loadAreas: (cityId) async {
                  try {
                    final api = getIt.get<ApiService>();
                    final response = await api.getData(
                      endPoint: EndPoints.areas,
                      query: {
                        'limit': 100,
                        'offset': 0,
                        'sort': 'asc',
                        'sortBy': 'id',
                        'cityId': cityId,
                      },
                    );
                    final data = response.data['data'];
                    if (data != null && data is List) {
                      return data.cast<Map<String, dynamic>>();
                    }
                  } catch (_) {}
                  return [];
                },
              );
              if (result != null) {
                setState(() => _advancedFilters = result);
                _fetchData();
              } else if (result == null && _advancedFilters != null) {
                setState(() => _advancedFilters = null);
                _fetchData();
              }
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.tune,
                  color: _advancedFilters?.hasFilters == true
                      ? AppColors.primaryDark
                      : Colors.grey,
                  size: 24.sp,
                ),
                if (_advancedFilters?.hasFilters == true)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Basic filter icon
          IconButton(
            onPressed: () async {
              final result = await showBrokerDataBasicFilterSheet(
                context,
                _basicFilters,
              );
              if (result != null) {
                setState(() => _basicFilters = result);
                _fetchData();
              } else if (result == null && _basicFilters != null) {
                setState(() => _basicFilters = null);
                _fetchData();
              }
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  SvgImages.filter,
                  colorFilter: ColorFilter.mode(
                    _basicFilters?.hasFilters == true
                        ? AppColors.primaryDark
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                if (_basicFilters?.hasFilters == true)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<BrokerDataCubit, BrokerDataStates>(
        buildWhen: (previous, current) {
          return current is GetBrokerUnitsLoadingState ||
              current is GetBrokerUnitsSuccessState ||
              current is GetBrokerUnitsErrorState;
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
                    onPressed: () => _fetchData(),
                  ),
                ],
              ),
            );
          } else if (state is GetBrokerUnitsSuccessState) {
            var data = state.brokerUnitsModel?.data ?? [];
            return RefreshIndicator(
              onRefresh: () async => _fetchData(),
              child: DataTableWidget(data: data),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
