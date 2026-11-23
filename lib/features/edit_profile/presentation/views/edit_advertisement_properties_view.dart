import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/core/data/specialization_display_data.dart';
import 'package:easy_deal/core/shared_widgets/units_expandable_line.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/create_request/data/repos/create_request_repo_imple.dart';
import 'package:easy_deal/features/create_request/data/stepper_config/stepper_constants.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/specializations_areas_widgets/chip_item.dart';
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
        title: LangKeys.advertisementAndPropertyDetails,
      ),
      body: BlocListener<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          if (state is EditProfileDataSuccessState) {
            Toast.showSuccessToast(
              msg: state.updateProfileDataModel.message.toString(),
              context: context,
            );
            // بنفضل في الشاشة بعد الحفظ: اليوزر لازم يشوف العدّاد اتغيّر،
            // وكمان يقدر يضيف أكتر من منطقة ورا بعض من غير ما يفتحها تاني.
            context.read<ProfileCubit>().getClientProfile(
                  clientId: CacheHelper.getData(key: "userId"),
                );
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

  /// المجموعات اللي كانت محفوظة على السيرفر أول ما فتحنا الشاشة.
  /// لازم تفضل تتبعت في الريكوست: لو فضيت واحدة منها تتبعت [] عشان السيرفر
  /// يمسحها فعلاً، مش نشيلها من الريكوست وهو يسيبها زي ما هي.
  final Set<String> _initialScopes = {};

  @override
  void initState() {
    super.initState();
    // Prefill من البروفايل لو السيرفر راجع القائمة الفعلية (TC11)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final data = context.read<ProfileCubit>().clientProfileModel?.data;
      final scopes = data?.specializationScopes;
      if (scopes != null && scopes.isNotEmpty) {
        setState(() {
          scopes.forEach((k, v) {
            _selected[k] = v.toSet();
            if (v.isNotEmpty) {
              _initialScopes.add(k);
              // بنفرد كل مجموعة فيها تحديد عشان اليوزر يشوف اختياراته كلها
              _expanded.add(k);
            }
          });
        });
      }
    });
  }

  Map<String, List<String>> _buildScopes() {
    final result = <String, List<String>>{};
    _selected.forEach((scope, specs) {
      if (specs.isNotEmpty) result[scope] = specs.toList();
    });
    // أي مجموعة كانت محفوظة وبقيت فاضية دلوقتي تتبعت كـ []
    for (final scope in _initialScopes) {
      result.putIfAbsent(scope, () => const <String>[]);
    }
    return result;
  }

  void _save() {
    // مش بنمنع الحفظ لو مفيش تخصصات خالص: بنبعت وخلي السيرفر يقول رأيه
    // (يقبل صفر تخصصات أو يرجّع إيرور) بدل ما الزرار يبقى ساكت.
    EditProfileCubit.get(context).updateSpecializationsAreas(
      id: CacheHelper.getData(key: "userId"),
      specializationScopes: _buildScopes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalSelected =
        _selected.values.fold<int>(0, (sum, s) => sum + s.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(LangKeys.specializations.tr(),
                style: AppStyles.black16SemiBold),
            if (totalSelected > 0) ...[
              Gap(8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child:
                    Text('$totalSelected', style: AppStyles.primary14Medium),
              ),
            ],
          ],
        ),
        Gap(12.h),
        // نفس مصدر شاشة التسجيل بالظبط عشان الاتنين ما يفرقوا
        ...specializationScopeOptions.map((option) {
          final scopeKey = option.value;
          final label = option.translationKey != null
              ? option.translationKey!.tr()
              : option.key;
          final specs = specializationScopeSubOptions[scopeKey] ?? const [];
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
                          padding: EdgeInsetsDirectional.only(end: 8.w),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: specs.map((specKey) {
                      // نفس مفاتيح الترجمة المستخدمة في شاشة التسجيل
                      final specLabel = specKey.toUpperCase().tr();
                      final isOn = selectedSet.contains(specKey);
                      // وحدات التخصص بتظهر تحته، بتتمدد وتتقفل
                      final units =
                          SpecializationDisplayData.units(context, specKey);
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
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
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (isOn) ...[
                                      Icon(
                                        Icons.check,
                                        size: 14.sp,
                                        color: AppColors.white,
                                      ),
                                      Gap(4.w),
                                    ],
                                    Flexible(
                                      child: Text(
                                        specLabel,
                                        style: isOn
                                            ? AppStyles.white14Medium
                                            : AppStyles.black14Medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (units.isNotEmpty)
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    top: 4.h, start: 12.w, end: 12.w),
                                child: UnitsExpandableLine(units: units),
                              ),
                          ],
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
    if (widget.selectedAreas.any((a) => a.id == area.id)) {
      // كانت مضافة خلاص: نقول لليوزر بدل ما الزرار يبقى ساكت
      Toast.showErrorToast(
        msg: LangKeys.areaAlreadyAdded.tr(),
        context: context,
      );
      return;
    }
    final updated = [...widget.selectedAreas, area];
    widget.onChanged(updated);
    _save(updated);
  }

  void _remove(Areas area) {
    final updated = widget.selectedAreas.where((a) => a.id != area.id).toList();
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
              child: DropdownButton<int>(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                isExpanded: true,
                underline: const SizedBox.shrink(),
                // بالـ id مش بالاسم: مدينتين بنفس الاسم كانت بترمي assertion
                value: cubit.selectedCityObj?.id,
                hint: Text(
                  state is GetCitiesLoadingState
                      ? 'Loading...'
                      : LangKeys.selectCity.tr(),
                  style: const TextStyle(color: Color(0xFF969696), fontSize: 14),
                ),
                items: cubit.citiesList
                    .where((c) => c.id != null)
                    .map((c) => DropdownMenuItem<int>(
                          value: c.id,
                          child: Text(_name(c)),
                        ))
                    .toList(),
                onChanged: cubit.citiesList.isEmpty
                    ? null
                    : (id) {
                        if (id == null) return;
                        final city =
                            cubit.citiesList.firstWhere((c) => c.id == id);
                        cubit.selectCity(city);
                        cubit.getAreas(cityId: city.id!);
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
                child: DropdownButton<int>(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  isExpanded: true,
                  underline: const SizedBox.shrink(),
                  value: cubit.selectedAreaObj?.id,
                  hint: Text(
                    state is GetAreasLoadingState
                        ? 'Loading...'
                        : LangKeys.selectArea.tr(),
                    style:
                        const TextStyle(color: Color(0xFF969696), fontSize: 14),
                  ),
                  items: cubit.areasList
                      .where((a) => a.id != null)
                      .map((a) => DropdownMenuItem<int>(
                            value: a.id,
                            child: Text(_name(a)),
                          ))
                      .toList(),
                  onChanged: cubit.areasList.isEmpty
                      ? null
                      : (id) {
                          if (id == null) return;
                          final area =
                              cubit.areasList.firstWhere((a) => a.id == id);
                          cubit.selectArea(area);
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
