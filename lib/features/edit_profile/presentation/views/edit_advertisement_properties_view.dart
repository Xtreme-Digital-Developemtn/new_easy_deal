import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/create_request/data/repos/create_request_repo_imple.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/specializations_areas_widgets/chip_item.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/search/data/models/areas_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

const Map<String, Map<String, dynamic>> _scopeData = {
  'purchase_sell_outside_compound': {
    'labelAr': 'بيع خارج كمبوند',
    'labelEn': 'Sell Outside Compound',
    'specs': {
      'purchasing_sell_residential_outside_compound':
          'وحدات سكنية',
      'purchasing_sell_national_housing_projects_outside_compound':
          'مشروعات الإسكان القومي',
      'purchasing_sell_administrative_commercial_units_outside_compound':
          'وحدات إدارية وتجارية',
      'purchasing_sell_industrial_and_warehousing_outside_compound':
          'صناعي وتخزيني',
      'purchasing_sell_lands_and_ready_projects_outside_compound':
          'أراضي ومشروعات جاهزة',
      'purchasing_sell_villas_and_buildings_outside_compound': 'فيلل وعمارات',
      'purchasing_sell_vacation_units_outside_compound': 'وحدات مصيفية',
    },
  },
  'primary_inside_compound': {
    'labelAr': 'بيع داخل كمبوند (أساسي)',
    'labelEn': 'Sell Inside Compound (Primary)',
    'specs': {
      'purchasing_sell_residential_inside_compound': 'وحدات سكنية',
      'purchasing_sell_villas_inside_compound': 'فيلل',
      'purchasing_sell_administrative_commercial_units_inside_compound':
          'وحدات إدارية وتجارية',
      'purchasing_sell_vacation_units_inside_compound': 'وحدات مصيفية',
    },
  },
  'resale_inside_compound': {
    'labelAr': 'بيع داخل كمبوند (إعادة بيع)',
    'labelEn': 'Sell Inside Compound (Resale)',
    'specs': {
      'purchasing_sell_residential_inside_compound': 'وحدات سكنية',
      'purchasing_sell_villas_inside_compound': 'فيلل',
      'purchasing_sell_administrative_commercial_units_inside_compound':
          'وحدات إدارية وتجارية',
      'purchasing_sell_vacation_units_inside_compound': 'وحدات مصيفية',
    },
  },
  'rentals_outside_compound': {
    'labelAr': 'إيجار خارج كمبوند',
    'labelEn': 'Rent Outside Compound',
    'specs': {
      'rent_residential_outside_compound': 'وحدات سكنية',
      'rent_national_housing_projects_outside_compound':
          'مشروعات الإسكان القومي',
      'rent_administrative_commercial_units_outside_compound':
          'وحدات إدارية وتجارية',
      'rent_industrial_and_warehousing_outside_compound': 'صناعي وتخزيني',
      'rent_hotel_vacation_units_outside_compound': 'وحدات فندقية/مصيفية',
    },
  },
  'rentals_inside_compound': {
    'labelAr': 'إيجار داخل كمبوند',
    'labelEn': 'Rent Inside Compound',
    'specs': {
      'rent_residential_inside_compound': 'وحدات سكنية',
      'rent_hotel_vacation_units_inside_compound': 'وحدات فندقية/مصيفية',
      'rent_administrative_commercial_units_inside_compound':
          'وحدات إدارية وتجارية',
    },
  },
};

class EditAdvertisementAndPropertyDetailsView extends StatefulWidget {
  const EditAdvertisementAndPropertyDetailsView({super.key});

  @override
  State<EditAdvertisementAndPropertyDetailsView> createState() =>
      _EditAdvertisementAndPropertyDetailsViewState();
}

class _EditAdvertisementAndPropertyDetailsViewState
    extends State<EditAdvertisementAndPropertyDetailsView> {
  List<Areas> selectedAreas = [];

  @override
  void initState() {
    super.initState();
    final profileAreas =
        context.read<ProfileCubit>().clientProfileModel?.data?.areas;
    if (profileAreas != null && profileAreas.isNotEmpty) {
      selectedAreas = List<Areas>.from(profileAreas);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.advertisementAndPropertyDetails.tr(),
      ),
      body: BlocListener<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          if (state is EditProfileDataSuccessState) {
            Toast.showSuccessToast(
              msg: state.updateProfileDataModel.message.toString(),
              context: context,
            );
            context.read<ProfileCubit>().getClientProfile(
                  clientId: CacheHelper.getData(key: "userId"),
                );
            context.pop();
          } else if (state is EditProfileDataErrorState) {
            Toast.showErrorToast(
              msg: state.error.toString(),
              context: context,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _SpecializationsSelector(),
                Divider(
                  color: Color.fromRGBO(213, 224, 252, 1),
                  height: 30.h,
                ),
                BlocProvider(
                  create: (_) =>
                      CreateRequestCubit(getIt.get<CreateRequestRepoImpl>()),
                  child: _CityAreaSelector(
                    selectedAreas: selectedAreas,
                    onChanged: (list) => setState(() => selectedAreas = list),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SpecializationsSelector extends StatefulWidget {
  const _SpecializationsSelector();

  @override
  State<_SpecializationsSelector> createState() =>
      _SpecializationsSelectorState();
}

class _SpecializationsSelectorState extends State<_SpecializationsSelector> {
  final Map<String, Set<String>> _selected = {};
  final Set<String> _expanded = {};

  Map<String, List<String>> _buildScopes() {
    final result = <String, List<String>>{};
    _selected.forEach((scope, specs) {
      if (specs.isNotEmpty) result[scope] = specs.toList();
    });
    return result;
  }

  void _save() {
    final scopes = _buildScopes();
    if (scopes.isEmpty) return;
    EditProfileCubit.get(context).updateSpecializationsAreas(
      id: CacheHelper.getData(key: "userId"),
      specializationScopes: scopes,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.specializations.tr(),
            style: AppStyles.black16SemiBold),
        Gap(12.h),
        ..._scopeData.entries.map((entry) {
          final scopeKey = entry.key;
          final scopeInfo = entry.value;
          final label = isArabic
              ? scopeInfo['labelAr'] as String
              : scopeInfo['labelEn'] as String;
          final specs = scopeInfo['specs'] as Map<String, String>;
          final selectedSet = _selected[scopeKey] ?? {};
          final isExpanded = _expanded.contains(scopeKey);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => setState(() {
                  if (isExpanded) {
                    _expanded.remove(scopeKey);
                  } else {
                    _expanded.add(scopeKey);
                  }
                }),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: selectedSet.isNotEmpty
                        ? AppColors.blueLight
                        : AppColors.white,
                    border: Border.all(color: AppColors.blueLight, width: 1.5),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(label, style: AppStyles.black14Medium),
                      ),
                      if (selectedSet.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Text('${selectedSet.length}',
                              style: AppStyles.primary14Medium),
                        ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.primaryDark,
                      ),
                    ],
                  ),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                  child: Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: specs.entries.map((spec) {
                      final specKey = spec.key;
                      final specLabel = isArabic ? spec.value : spec.key;
                      final isOn = selectedSet.contains(specKey);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected.putIfAbsent(scopeKey, () => {});
                            if (isOn) {
                              _selected[scopeKey]!.remove(specKey);
                            } else {
                              _selected[scopeKey]!.add(specKey);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: isOn
                                ? AppColors.primaryDark
                                : AppColors.white,
                            border: Border.all(
                              color: isOn
                                  ? AppColors.primaryDark
                                  : AppColors.blueLight,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            specLabel,
                            style: isOn
                                ? AppStyles.white14Medium
                                : AppStyles.black14Medium,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              Gap(8.h),
            ],
          );
        }),
        Gap(12.h),
        BlocBuilder<EditProfileCubit, EditProfileStates>(
          builder: (context, state) {
            if (state is EditProfileDataLoadingState) {
              return const CustomLoading();
            }
            return CustomButton(
              text: LangKeys.save.tr(),
              onPressed: _save,
            );
          },
        ),
      ],
    );
  }
}

class _CityAreaSelector extends StatefulWidget {
  final List<Areas> selectedAreas;
  final ValueChanged<List<Areas>> onChanged;
  const _CityAreaSelector(
      {required this.selectedAreas, required this.onChanged});

  @override
  State<_CityAreaSelector> createState() => _CityAreaSelectorState();
}

class _CityAreaSelectorState extends State<_CityAreaSelector> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<CreateRequestCubit>().getCities();
    });
  }

  String _name(dynamic model) =>
      context.isArabic ? (model.nameAr ?? '') : (model.nameEn ?? '');

  List<int> _areaIds(List<Areas> list) =>
      list.where((a) => a.id != null).map((a) => a.id!).toList();

  void _save(List<Areas> areas) {
    final profile = context.read<ProfileCubit>().clientProfileModel?.data;
    final editCubit = EditProfileCubit.get(context);
    editCubit.role = profile?.role;
    editCubit.updateProfileData(
      id: CacheHelper.getData(key: "userId"),
      fullName: profile?.fullName,
      phone: profile?.phone,
      email: profile?.email,
      areaIds: _areaIds(areas),
    );
  }

  void _add(CreateRequestCubit cubit) {
    final area = cubit.selectedAreaObj;
    if (area == null) return;
    if (widget.selectedAreas.any((a) => a.id == area.id)) return;
    final updated = [...widget.selectedAreas, area];
    widget.onChanged(updated);
    _save(updated);
  }

  void _remove(Areas area) {
    final updated =
        widget.selectedAreas.where((a) => a.id != area.id).toList();
    widget.onChanged(updated);
    _save(updated);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        final cubit = context.read<CreateRequestCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.areas.tr(), style: AppStyles.black16SemiBold),
            Gap(12.h),
            if (widget.selectedAreas.isNotEmpty)
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: widget.selectedAreas
                    .map((a) => ChipItem(
                          text: _name(a),
                          onRemove: () => _remove(a),
                        ))
                    .toList(),
              ),
            Gap(12.h),
            // City
            Container(
              width: double.infinity,
              height: 52.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.blueLight, width: 1.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                isExpanded: true,
                underline: const SizedBox.shrink(),
                value: cubit.selectedCityObj != null
                    ? _name(cubit.selectedCityObj)
                    : null,
                hint: Text(
                  state is GetCitiesLoadingState
                      ? 'Loading...'
                      : LangKeys.selectCity.tr(),
                  style: const TextStyle(color: Color(0xFF969696), fontSize: 14),
                ),
                items: cubit.citiesList
                    .map((c) => DropdownMenuItem<String>(
                          value: _name(c),
                          child: Text(_name(c)),
                        ))
                    .toList(),
                onChanged: cubit.citiesList.isEmpty
                    ? null
                    : (name) {
                        if (name != null) {
                          final city = cubit.citiesList.firstWhere(
                            (c) => _name(c) == name,
                          );
                          cubit.selectCity(city);
                          cubit.getAreas(cityId: city.id!);
                        }
                      },
              ),
            ),
            Gap(12.h),
            // Area
            if (cubit.selectedCityObj != null)
              Container(
                width: double.infinity,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.blueLight, width: 1.5),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: DropdownButton<String>(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  isExpanded: true,
                  underline: const SizedBox.shrink(),
                  value: cubit.selectedAreaObj != null
                      ? _name(cubit.selectedAreaObj)
                      : null,
                  hint: Text(
                    state is GetAreasLoadingState
                        ? 'Loading...'
                        : LangKeys.selectArea.tr(),
                    style: const TextStyle(color: Color(0xFF969696), fontSize: 14),
                  ),
                  items: cubit.areasList
                      .map((a) => DropdownMenuItem<String>(
                            value: _name(a),
                            child: Text(_name(a)),
                          ))
                      .toList(),
                  onChanged: cubit.areasList.isEmpty
                      ? null
                      : (name) {
                          if (name != null) {
                            final area = cubit.areasList.firstWhere(
                              (a) => _name(a) == name,
                            );
                            cubit.selectArea(area);
                          }
                        },
                ),
              ),
            Gap(12.h),
            BlocBuilder<EditProfileCubit, EditProfileStates>(
              builder: (context, editState) {
                if (cubit.selectedCityObj == null ||
                    cubit.selectedAreaObj == null) {
                  return const SizedBox.shrink();
                }
                if (editState is EditProfileDataLoadingState) {
                  return const CustomLoading();
                }
                return CustomButton(
                  text: LangKeys.add.tr(),
                  onPressed: () => _add(cubit),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
