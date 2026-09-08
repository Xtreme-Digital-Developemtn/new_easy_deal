import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/developer_projects_view.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/contract_request_dialog.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developer_filter_sheet.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developers_table_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

class BrokerDevelopersView extends StatefulWidget {
  const BrokerDevelopersView({super.key});
  @override
  State<BrokerDevelopersView> createState() => _BrokerDevelopersViewState();
}

class _BrokerDevelopersViewState extends State<BrokerDevelopersView> {
  DeveloperFilterResult? _appliedFilters;
  List<Map<String, dynamic>> _cities = [];

  @override
  void initState() {
    super.initState();
    context.read<BrokerDevelopersCubit>().getDevelopers();
    _loadCities();
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
    var cubit = context.read<BrokerDevelopersCubit>();
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.developers,
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showDeveloperFilterSheet(
                context,
                _appliedFilters,
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
                setState(() => _appliedFilters = result);
                cubit.getDevelopers(filters: result.toQueryParams());
              } else if (result == null && _appliedFilters != null) {
                setState(() => _appliedFilters = null);
                cubit.getDevelopers();
              }
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.filter_list_rounded,
                  color: _appliedFilters?.hasFilters == true
                      ? AppColors.primaryDark
                      : Colors.grey,
                  size: 24.sp,
                ),
                if (_appliedFilters?.hasFilters == true)
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
      body: BlocBuilder<BrokerDevelopersCubit, BrokerDevelopersStates>(
        builder: (context, state) {
          if (state is GetDevelopersLoadingState &&
              cubit.developersModel == null) {
            return const CustomLoading();
          }
          if (state is GetDevelopersErrorState &&
              cubit.developersModel == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.error),
                  Gap(16.h),
                  CustomButton(
                    text: LangKeys.reload,
                    onPressed: () {
                      cubit.getDevelopers(
                        filters: _appliedFilters?.toQueryParams(),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          var data = cubit.developersModel?.data ?? [];
          if (data.isEmpty) {
            return Center(
              child: Text(
                LangKeys.thereAreNoItemsCurrentlyAvailable.tr(),
              ),
            );
          }
          return DevelopersTableData(
            data: data,
            onProceduresTap: (developerId) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DeveloperProjectsView(
                    developerId: developerId,
                    cubit: cubit,
                  ),
                ),
              );
            },
            onSendContractRequest: (developerId) {
              showDialog(
                context: context,
                builder: (_) =>
                    ContractRequestDialog(developerId: developerId),
              );
            },
          );
        },
      ),
    );
  }
}
