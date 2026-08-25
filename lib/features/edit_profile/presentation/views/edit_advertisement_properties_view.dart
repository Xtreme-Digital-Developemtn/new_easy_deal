import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/create_request/data/repos/create_request_repo_imple.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/specializations_areas_widgets/chip_item.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/specializations_areas_widgets/main_section.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/features/search/data/models/areas_model.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class EditAdvertisementAndPropertyDetailsView extends StatefulWidget {
  const EditAdvertisementAndPropertyDetailsView({super.key});

  @override
  State<EditAdvertisementAndPropertyDetailsView> createState() =>
      _EditAdvertisementAndPropertyDetailsViewState();
}

class _EditAdvertisementAndPropertyDetailsViewState
    extends State<EditAdvertisementAndPropertyDetailsView> {
  List<String> currentSpecializations = ['شقق للبيع', 'عقارات تجارية'];
  List<String> availableSpecializations = ['شقق للإيجار', 'أراضي', 'مكاتب'];

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
                MainSection(
                  title: LangKeys.specializations.tr(),
                  currentItems: currentSpecializations,
                  availableItems: availableSpecializations,
                  onAddItem: (item) {
                    setState(() {
                      currentSpecializations.add(item);
                      availableSpecializations.remove(item);
                    });
                  },
                  onRemoveItem: (item) {
                    setState(() {
                      currentSpecializations.remove(item);
                      availableSpecializations.add(item);
                    });
                  },
                  onAddCustomItem: (item) {
                    setState(() {
                      currentSpecializations.add(item);
                    });
                  },
                ),
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


