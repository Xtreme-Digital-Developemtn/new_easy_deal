import 'package:easy_deal/core/app_services/remote_services/service_locator.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/specializations_areas_widgets/chip_item.dart';
import 'package:easy_deal/features/edit_profile/presentation/views/widgets/specializations_areas_widgets/main_section.dart';
import 'package:easy_deal/features/search/data/models/areas_model.dart';
import 'package:easy_deal/features/search/data/models/cities_model.dart';
import 'package:easy_deal/features/search/data/repos/search_repo_imple.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_cubit.dart';
import 'package:easy_deal/features/search/presentation/view_model/search_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../create_request/data/repos/create_request_repo_imple.dart';
import '../../../create_request/presentation/view_model/create_request_cubit.dart';
import '../../../create_request/presentation/views/widgets/form_of_city_area_sub_area_address_location_link.dart';

class EditAdvertisementAndPropertyDetailsView extends StatefulWidget {
  const EditAdvertisementAndPropertyDetailsView({super.key });

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

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.advertisementAndPropertyDetails.tr(),
      ),
      body: Padding(
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
                  create: (context)=>CreateRequestCubit(getIt.get<CreateRequestRepoImpl>()),
                  child: FormOfCityAreaSubAreaAddressLocationLink(
                    showSubArea: false,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _CityAreaSelector extends StatefulWidget {
  final List<Areas> selectedAreas;
  final ValueChanged<List<Areas>> onChanged;
  const _CityAreaSelector({required this.selectedAreas, required this.onChanged});

  @override
  State<_CityAreaSelector> createState() => _CityAreaSelectorState();
}

class _CityAreaSelectorState extends State<_CityAreaSelector> {
  Cities? _selectedCity;
  Areas? _selectedArea;

  String _name(dynamic model, bool isArabic) =>
      isArabic ? (model.nameAr ?? '') : (model.nameEn ?? '');

  void _add() {
    if (_selectedArea == null) return;
    if (widget.selectedAreas.any((a) => a.id == _selectedArea!.id)) return;
    widget.onChanged([...widget.selectedAreas, _selectedArea!]);
    setState(() => _selectedArea = null);
  }

  void _remove(Areas area) {
    widget.onChanged(
        widget.selectedAreas.where((a) => a.id != area.id).toList());
  }

  @override
  Widget build(BuildContext context) {
    final isArabic =
        EasyLocalization.of(context)!.currentLocale!.languageCode == "ar";

    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        final cities = cubit.citiesModel?.data ?? [];
        final areas = cubit.areasModel?.data ?? [];

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
                          text: _name(a, isArabic),
                          onRemove: () => _remove(a),
                        ))
                    .toList(),
              ),
            Gap(12.h),
            CustomDropdown<Cities>(
              value: _selectedCity,
              items: cities,
              hint: LangKeys.selectCity.tr(),
              itemDisplayBuilder: (c) => _name(c, isArabic),
              onChanged: (city) {
                if (city != null) {
                  setState(() {
                    _selectedCity = city;
                    _selectedArea = null;
                  });
                  cubit.selectTheCity(city);
                }
              },
            ),
            Gap(12.h),
            if (_selectedCity != null)
              CustomDropdown<Areas>(
                value: _selectedArea,
                items: areas,
                hint: LangKeys.selectArea.tr(),
                itemDisplayBuilder: (a) => _name(a, isArabic),
                onChanged: (area) => setState(() => _selectedArea = area),
              ),
            Gap(12.h),
            if (_selectedCity != null && _selectedArea != null)
              CustomButton(
                text: LangKeys.add.tr(),
                onPressed: _add,
              ),
          ],
        );
      },
    );
  }
}
