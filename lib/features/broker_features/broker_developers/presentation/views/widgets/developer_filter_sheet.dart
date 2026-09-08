import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import '../../../../../../main_imports.dart';

class DeveloperFilterResult {
  final String? compoundType;
  final int? city;
  final int? area;
  final String? unitType;
  final String? view;
  final int? areaFrom;
  final int? areaTo;
  final int? priceFrom;
  final int? priceTo;
  final String? search;

  const DeveloperFilterResult({
    this.compoundType,
    this.city,
    this.area,
    this.unitType,
    this.view,
    this.areaFrom,
    this.areaTo,
    this.priceFrom,
    this.priceTo,
    this.search,
  });

  bool get hasFilters =>
      compoundType != null ||
      city != null ||
      area != null ||
      unitType != null ||
      view != null ||
      areaFrom != null ||
      areaTo != null ||
      priceFrom != null ||
      priceTo != null ||
      search != null;

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};
    if (compoundType != null) params['compoundType'] = compoundType;
    if (city != null) params['city'] = city;
    if (area != null) params['area'] = area;
    if (unitType != null) params['unitType'] = unitType;
    if (view != null) params['view'] = view;
    if (areaFrom != null) params['areaFrom'] = areaFrom;
    if (areaTo != null) params['areaTo'] = areaTo;
    if (priceFrom != null) params['priceFrom'] = priceFrom;
    if (priceTo != null) params['priceTo'] = priceTo;
    if (search != null && search!.isNotEmpty) params['search'] = search;
    return params;
  }
}

final _compoundOptions = [
  'inside_compound',
  'outside_compound',
];

final _unitTypeOptions = [
  'apartments',
  'duplexes',
  'penthouses',
  'studios',
  'roofs',
  'basements',
  'villas',
  'chalets',
  'residential_buildings',
  'i_villa',
  'twin_houses',
  'town_houses',
  'standalone_villas',
  'administrative_units',
  'medical_clinics',
  'commercial_stores',
  'commercial_administrative_buildings',
  'commercial_administrative_lands',
  'residential_lands',
  'factory_lands',
  'warehouse_lands',
  'vacation_villa',
  'hotels',
];

final _viewOptions = [
  'water_view',
  'garden',
  'street',
  'pool',
  'lake',
  'park',
  'main_street',
  'corniche',
];

Future<DeveloperFilterResult?> showDeveloperFilterSheet(
  BuildContext context,
  DeveloperFilterResult? currentFilters, {
  List<Map<String, dynamic>> cities = const [],
  Future<List<Map<String, dynamic>>> Function(int cityId)? loadAreas,
}) async {
  var selectedCompoundType = currentFilters?.compoundType;
  int? selectedCity = currentFilters?.city;
  int? selectedArea = currentFilters?.area;
  var selectedUnitType = currentFilters?.unitType;
  var selectedView = currentFilters?.view;
  final areaFromController = TextEditingController(
    text: currentFilters?.areaFrom?.toString() ?? '',
  );
  final areaToController = TextEditingController(
    text: currentFilters?.areaTo?.toString() ?? '',
  );
  final priceFromController = TextEditingController(
    text: currentFilters?.priceFrom?.toString() ?? '',
  );
  final priceToController = TextEditingController(
    text: currentFilters?.priceTo?.toString() ?? '',
  );
  List<Map<String, dynamic>> loadedAreas = [];

  return showModalBottomSheet<DeveloperFilterResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20.0.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 20.h,
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 45.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                        Gap(20.h),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(LangKeys.filter.tr(),
                                style: AppStyles.black20Bold),
                            if (currentFilters != null &&
                                currentFilters.hasFilters)
                              InkWell(
                                onTap: () => setState(() {
                                  selectedCompoundType = null;
                                  selectedCity = null;
                                  selectedArea = null;
                                  selectedUnitType = null;
                                  selectedView = null;
                                  areaFromController.clear();
                                  areaToController.clear();
                                  priceFromController.clear();
                                  priceToController.clear();
                                }),
                                child: Text(LangKeys.clearAll.tr(),
                                    style: AppStyles.primary14Medium),
                              ),
                          ],
                        ),
                        Gap(24.h),

                        // Compound Type
                        _buildDropdown(
                          label: LangKeys.compoundType.tr(),
                          value: selectedCompoundType,
                          items: _compoundOptions,
                          displayFn: (v) =>
                              BrokerTextHelper.projectTypeText(v),
                          onChanged: (v) => setState(
                              () => selectedCompoundType = v),
                        ),
                        Gap(16.h),

                        // City
                        _buildDropdown<int>(
                          label: LangKeys.city.tr(),
                          value: selectedCity,
                          items: cities
                              .map((c) => c['id'] as int)
                              .toList(),
                          displayFn: (id) {
                            final city = cities.firstWhere(
                              (c) => c['id'] == id,
                              orElse: () => {'name_ar': id.toString()},
                            );
                            return city['name_ar']?.toString() ??
                                id.toString();
                          },
                          onChanged: (v) async {
                            selectedCity = v;
                            selectedArea = null;
                            loadedAreas.clear();
                            if (v != null && loadAreas != null) {
                              final areas = await loadAreas(v);
                              loadedAreas.addAll(areas);
                            }
                            setState(() {});
                          },
                        ),
                        Gap(16.h),

                        // Area
                        _buildDropdown<int>(
                          label: LangKeys.area.tr(),
                          value: selectedArea,
                          items: loadedAreas
                              .map((a) => a['id'] as int)
                              .toList(),
                          displayFn: (id) {
                            final area = loadedAreas.firstWhere(
                              (a) => a['id'] == id,
                              orElse: () => {'name_ar': id.toString()},
                            );
                            return area['name_ar']?.toString() ??
                                id.toString();
                          },
                          onChanged: (v) =>
                              setState(() => selectedArea = v),
                        ),
                        Gap(16.h),

                        // Unit Type
                        _buildDropdown(
                          label: LangKeys.unitType.tr(),
                          value: selectedUnitType,
                          items: _unitTypeOptions,
                          displayFn: (v) => v.tr(),
                          onChanged: (v) => setState(
                              () => selectedUnitType = v),
                        ),
                        Gap(16.h),

                        // View
                        _buildDropdown(
                          label: 'الإطلالة',
                          value: selectedView,
                          items: _viewOptions,
                          displayFn: (v) => v.tr(),
                          onChanged: (v) =>
                              setState(() => selectedView = v),
                        ),
                        Gap(16.h),

                        // Area Range
                        Text('المساحة (م²)',
                            style: AppStyles.black16SemiBold),
                        Gap(8.h),
                        Row(
                          children: [
                            Expanded(
                              child: _buildNumberField(
                                label: 'من',
                                controller: areaFromController,
                              ),
                            ),
                            Gap(12.w),
                            Expanded(
                              child: _buildNumberField(
                                label: 'الي',
                                controller: areaToController,
                              ),
                            ),
                          ],
                        ),
                        Gap(16.h),

                        // Price Range
                        Text('السعر (ج.م)',
                            style: AppStyles.black16SemiBold),
                        Gap(8.h),
                        Row(
                          children: [
                            Expanded(
                              child: _buildNumberField(
                                label: 'من',
                                controller: priceFromController,
                              ),
                            ),
                            Gap(12.w),
                            Expanded(
                              child: _buildNumberField(
                                label: 'الي',
                                controller: priceToController,
                              ),
                            ),
                          ],
                        ),
                        Gap(24.h),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'إعادة تعيين',
                              gradientColors: false,
                              color: Colors.white,
                              textColor: AppColors.primaryDark,
                              borderColor: BorderSide(color: AppColors.primaryDark),
                              onPressed: () {
                                Navigator.pop(context, null);
                              },
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: CustomButton(
                              text: LangKeys.apply.tr(),
                              onPressed: () {
                                final result = DeveloperFilterResult(
                                  compoundType: selectedCompoundType,
                                  city: selectedCity,
                                  area: selectedArea,
                                  unitType: selectedUnitType,
                                  view: selectedView,
                                  areaFrom: int.tryParse(
                                      areaFromController.text),
                                  areaTo: int.tryParse(
                                      areaToController.text),
                                  priceFrom: int.tryParse(
                                      priceFromController.text),
                                  priceTo: int.tryParse(
                                      priceToController.text),
                                );
                                Navigator.pop(
                                    context,
                                    result.hasFilters ? result : null);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _buildDropdown<T>({
  required String label,
  required T? value,
  required List<T> items,
  required String Function(T) displayFn,
  required void Function(T?) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppStyles.black16SemiBold),
          if (value != null)
            GestureDetector(
              onTap: () => onChanged(null),
              child: Row(
                children: [
                  Text(LangKeys.clearSelection.tr(),
                      style: AppStyles.primary14Medium),
                  Gap(4.w),
                  Icon(Icons.close,
                      size: 16.sp, color: AppColors.primaryDark),
                ],
              ),
            ),
        ],
      ),
      Gap(8.h),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true,
            hint: Text(LangKeys.selectAll.tr(),
                style: AppStyles.black14Medium),
            items: [
              DropdownMenuItem<T>(
                value: null,
                child: Text(LangKeys.clearSelection.tr(),
                    style: AppStyles.black14Medium),
              ),
              ...items.map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(displayFn(item),
                      style: AppStyles.black14Medium),
                ),
              ),
            ],
            onChanged: onChanged,
          ),
        ),
      ),
    ],
  );
}

Widget _buildNumberField({
  required String label,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      hintText: label,
      hintStyle: AppStyles.black14Medium.copyWith(
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primaryDark),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ),
    ),
    style: AppStyles.black14Medium,
  );
}
