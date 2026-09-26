import 'dart:async';

import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/core/shared_widgets/container_search_widget.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/developer_models_view.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/developer_sales_view.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developer_filter_sheet.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developer_projects_table_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

class DeveloperProjectsView extends StatefulWidget {
  final int developerId;
  final BrokerDevelopersCubit cubit;
  const DeveloperProjectsView({
    super.key,
    required this.developerId,
    required this.cubit,
  });

  @override
  State<DeveloperProjectsView> createState() => _DeveloperProjectsViewState();
}

class _DeveloperProjectsViewState extends State<DeveloperProjectsView> {
  DeveloperFilterResult? _appliedFilters;
  List<Map<String, dynamic>> _cities = [];
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    widget.cubit.getDeveloperProjects(widget.developerId);
    _loadCities();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Map<String, dynamic>? _combinedFilters() {
    final params = _appliedFilters?.toQueryParams() ?? <String, dynamic>{};
    final search = _searchText.trim();
    if (search.isNotEmpty) {
      params['search'] = search;
    }
    return params.isEmpty ? null : params;
  }

  void _reload() {
    widget.cubit.getDeveloperProjects(
      widget.developerId,
      filters: _combinedFilters(),
    );
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final newSearch = value.trim();
      if (newSearch == _searchText.trim()) return;
      setState(() => _searchText = value);
      _reload();
    });
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

  Future<void> _openFilter() async {
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
      _reload();
    } else if (result == null && _appliedFilters != null) {
      setState(() => _appliedFilters = null);
      _reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.projects,
        actions: [
          IconButton(
            onPressed: _openFilter,
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
          // 1) برا المشاريع: كل مبيعات المطور بدون فلتر
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      DeveloperSalesView(developerId: widget.developerId),
                ),
              );
            },
            child: Text(
              LangKeys.viewSalesTeam.tr(),
              style: AppStyles.black12Medium.copyWith(
                color: AppColors.primaryDark,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
            child: ContainerSearchWidget(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: BlocBuilder<BrokerDevelopersCubit, BrokerDevelopersStates>(
              builder: (context, state) {
                if (state is GetDeveloperProjectsLoadingState) {
                  return const CustomLoading();
                } else if (state is GetDeveloperProjectsErrorState) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.error),
                        Gap(16.h),
                        CustomButton(text: LangKeys.reload, onPressed: _reload),
                      ],
                    ),
                  );
                } else if (state is GetDeveloperProjectsSuccessState) {
                  var data = state.projectsModel?.data ?? [];
                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        LangKeys.thereAreNoItemsCurrentlyAvailable.tr(),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0),
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryDark,
                              AppColors.primaryDark.withValues(alpha: 0.85),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryDark.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.folder_open_rounded,
                                color: Colors.white,
                                size: 24.r,
                              ),
                            ),
                            Gap(14.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LangKeys.projects.tr(),
                                    style: AppStyles.black14Medium.copyWith(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Gap(4.h),
                                  Text(
                                    '${data.length} ${LangKeys.projects.tr()}',
                                    style: AppStyles.black14Medium.copyWith(
                                      color: Colors.white.withValues(
                                        alpha: 0.8,
                                      ),
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: DeveloperProjectsTableData(
                          data: data,
                          onModelsTap: (projectId) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DeveloperModelsView(
                                  projectId: projectId,
                                  developerId: widget.developerId,
                                ),
                              ),
                            );
                          },
                          onSalesTap: (projectId) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DeveloperSalesView(
                                  developerId: widget.developerId,
                                  projectId: projectId,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
