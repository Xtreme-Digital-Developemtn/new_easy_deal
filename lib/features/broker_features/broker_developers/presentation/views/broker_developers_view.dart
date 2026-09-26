import 'dart:async';

import 'package:easy_deal/core/shared_widgets/container_search_widget.dart';
import 'package:easy_deal/features/broker_features/broker_developers/data/models/developers_model.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/developer_projects_view.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/contract_request_dialog.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developer_filter_sheet.dart';
import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developers_table_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

enum DeveloperContractTab { nonContracted, contracted, all }

class BrokerDevelopersView extends StatefulWidget {
  const BrokerDevelopersView({super.key});
  @override
  State<BrokerDevelopersView> createState() => _BrokerDevelopersViewState();
}

class _BrokerDevelopersViewState extends State<BrokerDevelopersView> {
  DeveloperFilterResult? _appliedFilters;
  List<Map<String, dynamic>> _cities = [];
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  String _searchText = '';

  DeveloperContractTab _selectedTab = DeveloperContractTab.all;
  int _currentPage = 0;
  static const int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    context.read<BrokerDevelopersCubit>().getDevelopers();
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

  void _resetPage() {
    _currentPage = 0;
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final newSearch = value.trim();
      if (newSearch == _searchText.trim()) return;
      setState(() {
        _searchText = value;
        _resetPage();
      });
      context.read<BrokerDevelopersCubit>().getDevelopers(
        filters: _combinedFilters(),
      );
    });
  }

  void _onTabSelected(DeveloperContractTab tab) {
    if (_selectedTab == tab) return;
    setState(() {
      _selectedTab = tab;
      _resetPage();
    });
  }

  bool _isContracted(DeveloperData d) =>
      d.brokers != null && d.brokers!.isNotEmpty;

  List<DeveloperData> _filteredByTab(List<DeveloperData> all) {
    switch (_selectedTab) {
      case DeveloperContractTab.contracted:
        return all.where(_isContracted).toList();
      case DeveloperContractTab.nonContracted:
        return all.where((d) => !_isContracted(d)).toList();
      case DeveloperContractTab.all:
        return all;
    }
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
                setState(() {
                  _appliedFilters = result;
                  _resetPage();
                });
                cubit.getDevelopers(filters: _combinedFilters());
              } else if (result == null && _appliedFilters != null) {
                setState(() {
                  _appliedFilters = null;
                  _resetPage();
                });
                cubit.getDevelopers(filters: _combinedFilters());
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
                final allData = cubit.developersModel?.data ?? [];
                final contractedCount = allData.where(_isContracted).length;
                final nonContractedCount = allData.length - contractedCount;
                final totalCount = allData.length;

                final filtered = _filteredByTab(allData);
                final totalPages = (filtered.length / _pageSize).ceil().clamp(
                  1,
                  1000000,
                );
                final safePage = _currentPage.clamp(0, totalPages - 1);
                final start = safePage * _pageSize;
                final end = (start + _pageSize).clamp(0, filtered.length);
                final pagedData = filtered.isEmpty
                    ? <DeveloperData>[]
                    : filtered.sublist(start, end);

                Widget tableArea;
                if (state is GetDevelopersLoadingState &&
                    cubit.developersModel == null) {
                  tableArea = const Expanded(child: CustomLoading());
                } else if (state is GetDevelopersErrorState &&
                    cubit.developersModel == null) {
                  tableArea = Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(state.error),
                          Gap(16.h),
                          CustomButton(
                            text: LangKeys.reload,
                            onPressed: () {
                              cubit.getDevelopers(filters: _combinedFilters());
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (filtered.isEmpty) {
                  tableArea = Expanded(
                    child: Center(
                      child: Text(
                        LangKeys.thereAreNoItemsCurrentlyAvailable.tr(),
                      ),
                    ),
                  );
                } else {
                  tableArea = Expanded(
                    child: DevelopersTableData(
                      data: pagedData,
                      totalCount: filtered.length,
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
                    ),
                  );
                }

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: _ContractToggleButton(
                              label: 'غير متعاقد',
                              count: nonContractedCount,
                              selected:
                                  _selectedTab ==
                                  DeveloperContractTab.nonContracted,
                              onTap: () => _onTabSelected(
                                DeveloperContractTab.nonContracted,
                              ),
                            ),
                          ),
                          Gap(8.w),
                          Expanded(
                            child: _ContractToggleButton(
                              label: 'متعاقد',
                              count: contractedCount,
                              selected:
                                  _selectedTab ==
                                  DeveloperContractTab.contracted,
                              onTap: () => _onTabSelected(
                                DeveloperContractTab.contracted,
                              ),
                            ),
                          ),
                          Gap(8.w),
                          Expanded(
                            child: _ContractToggleButton(
                              label: 'جميع المطورين',
                              count: totalCount,
                              selected:
                                  _selectedTab == DeveloperContractTab.all,
                              onTap: () =>
                                  _onTabSelected(DeveloperContractTab.all),
                            ),
                          ),
                        ],
                      ),
                    ),
                    tableArea,
                    if (filtered.isNotEmpty && totalPages > 1)
                      _PaginationBar(
                        currentPage: safePage,
                        totalPages: totalPages,
                        onPrev: safePage > 0
                            ? () => setState(() => _currentPage = safePage - 1)
                            : null,
                        onNext: safePage < totalPages - 1
                            ? () => setState(() => _currentPage = safePage + 1)
                            : null,
                        onPageSelected: (page) =>
                            setState(() => _currentPage = page),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContractToggleButton extends StatelessWidget {
  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  const _ContractToggleButton({
    required this.label,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryDark : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? AppColors.primaryDark : Colors.grey.shade300,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.primaryDark.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyles.black14Medium.copyWith(
                  color: selected ? Colors.white : AppColors.primaryDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
            ),
            Gap(6.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: selected
                    ? Colors.white.withValues(alpha: 0.2)
                    : AppColors.primaryDark.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                '$count',
                style: AppStyles.black14Medium.copyWith(
                  color: selected ? Colors.white : AppColors.primaryDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  final ValueChanged<int> onPageSelected;

  const _PaginationBar({
    required this.currentPage,
    required this.totalPages,
    required this.onPrev,
    required this.onNext,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onPrev,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: onPrev != null
                    ? AppColors.primaryDark.withValues(alpha: 0.1)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 14.sp,
                color: onPrev != null
                    ? AppColors.primaryDark
                    : Colors.grey.shade400,
              ),
            ),
          ),
          Gap(8.w),
          ...List.generate(totalPages, (index) {
            final selected = index == currentPage;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: InkWell(
                onTap: () => onPageSelected(index),
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primaryDark : Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: selected
                          ? AppColors.primaryDark
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: AppStyles.black14Medium.copyWith(
                      color: selected ? Colors.white : Colors.grey.shade700,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            );
          }),
          Gap(8.w),
          InkWell(
            onTap: onNext,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: onNext != null
                    ? AppColors.primaryDark.withValues(alpha: 0.1)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14.sp,
                color: onNext != null
                    ? AppColors.primaryDark
                    : Colors.grey.shade400,
              ),
            ),
          ),
          Gap(12.w),
          Text(
            'صفحة ${currentPage + 1} من $totalPages',
            style: AppStyles.black14Medium.copyWith(
              color: Colors.grey.shade600,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
