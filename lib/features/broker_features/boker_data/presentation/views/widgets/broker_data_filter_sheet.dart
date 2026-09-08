import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import '../../../../../../main_imports.dart';

class BrokerDataBasicFilterResult {
  final String? compoundType;
  final String? unitOperation;
  final String? unitType;

  const BrokerDataBasicFilterResult({
    this.compoundType,
    this.unitOperation,
    this.unitType,
  });

  bool get hasFilters =>
      compoundType != null || unitOperation != null || unitType != null;

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};
    if (compoundType != null) params['compoundType'] = compoundType;
    if (unitOperation != null) params['unitOperation'] = unitOperation;
    if (unitType != null) params['unitType'] = unitType;
    return params;
  }
}

class BrokerDataAdvancedFilterResult {
  final String? compoundType;
  final String? unitOperation;
  final String? unitType;
  final int? city;
  final int? area;
  final String? view;
  final int? areaFrom;
  final int? areaTo;
  final int? priceFrom;
  final int? priceTo;

  const BrokerDataAdvancedFilterResult({
    this.compoundType,
    this.unitOperation,
    this.unitType,
    this.city,
    this.area,
    this.view,
    this.areaFrom,
    this.areaTo,
    this.priceFrom,
    this.priceTo,
  });

  bool get hasFilters =>
      compoundType != null ||
      unitOperation != null ||
      unitType != null ||
      city != null ||
      area != null ||
      view != null ||
      areaFrom != null ||
      areaTo != null ||
      priceFrom != null ||
      priceTo != null;

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};
    if (compoundType != null) params['compoundType'] = compoundType;
    if (unitOperation != null) params['unitOperation'] = unitOperation;
    if (unitType != null) params['unitType'] = unitType;
    if (city != null) params['city'] = city;
    if (area != null) params['area'] = area;
    if (view != null) params['view'] = view;
    if (areaFrom != null) params['areaFrom'] = areaFrom;
    if (areaTo != null) params['areaTo'] = areaTo;
    if (priceFrom != null) params['priceFrom'] = priceFrom;
    if (priceTo != null) params['priceTo'] = priceTo;
    return params;
  }
}

final _compoundOptions = [
  'inside_compound',
  'outside_compound',
];

final _operationOptions = [
  'sell',
  'rent_out',
];

final _unitTypeOptions = [
  'apartments',
  'duplexes',
  'penthouses',
  'roofs',
  'studios',
  'basements',
  'residential_buildings',
  'villas',
  'i_villa',
  'administrative_units',
  'medical_clinics',
  'pharmacies',
  'commercial_stores',
  'residential_lands',
  'commercial_administrative_buildings',
  'commercial_administrative_lands',
  'factory_lands',
  'warehouse_lands',
  'chalets',
  'vacation_villa',
  'hotels',
  'twin_houses',
  'town_houses',
  'standalone_villas',
];

final _viewOptions = [
  'water_view',
  'gardens_and_landscape',
  'street',
  'entertainment_area',
  'garden',
  'main_street',
  'square',
  'side_street',
  'rear_view',
  'swimming_pool',
  'all_of_the_above',
];

// ==================== Basic Filter Sheet ====================

Future<BrokerDataBasicFilterResult?> showBrokerDataBasicFilterSheet(
  BuildContext context,
  BrokerDataBasicFilterResult? currentFilters,
) async {
  var selectedCompoundType = currentFilters?.compoundType;
  var selectedUnitOperation = currentFilters?.unitOperation;
  var selectedUnitType = currentFilters?.unitType;

  return showModalBottomSheet<BrokerDataBasicFilterResult>(
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
                            Text('فلتر سريع',
                                style: AppStyles.black20Bold),
                            if (currentFilters != null &&
                                currentFilters.hasFilters)
                              InkWell(
                                onTap: () => setState(() {
                                  selectedCompoundType = null;
                                  selectedUnitOperation = null;
                                  selectedUnitType = null;
                                }),
                                child: Text(LangKeys.clearAll.tr(),
                                    style: AppStyles.primary14Medium),
                              ),
                          ],
                        ),
                        Gap(24.h),

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

                        _buildDropdown(
                          label: 'نوع العملية',
                          value: selectedUnitOperation,
                          items: _operationOptions,
                          displayFn: (v) => _operationText(v),
                          onChanged: (v) => setState(
                              () => selectedUnitOperation = v),
                        ),
                        Gap(16.h),

                        _buildDropdown(
                          label: LangKeys.unitType.tr(),
                          value: selectedUnitType,
                          items: _unitTypeOptions,
                          displayFn: (v) => _unitTypeText(v),
                          onChanged: (v) => setState(
                              () => selectedUnitType = v),
                        ),
                        Gap(24.h),
                      ],
                    ),
                  ),
                ),
                _buildBottomButtons(
                  onReset: () => Navigator.pop(context, null),
                  onApply: () {
                    final result = BrokerDataBasicFilterResult(
                      compoundType: selectedCompoundType,
                      unitOperation: selectedUnitOperation,
                      unitType: selectedUnitType,
                    );
                    Navigator.pop(
                        context, result.hasFilters ? result : null);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

// ==================== Advanced Filter Sheet ====================

Future<BrokerDataAdvancedFilterResult?> showBrokerDataAdvancedFilterSheet(
  BuildContext context,
  BrokerDataAdvancedFilterResult? currentFilters, {
  List<Map<String, dynamic>> cities = const [],
  Future<List<Map<String, dynamic>>> Function(int cityId)? loadAreas,
}) async {
  var selectedCompoundType = currentFilters?.compoundType;
  var selectedUnitOperation = currentFilters?.unitOperation;
  var selectedUnitType = currentFilters?.unitType;
  int? selectedCity = currentFilters?.city;
  int? selectedArea = currentFilters?.area;
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
  final cityIds = cities.map((c) => c['id'] as int).toSet().toList();
  if (selectedCity != null && !cityIds.contains(selectedCity)) {
    selectedCity = null;
  }

  return showModalBottomSheet<BrokerDataAdvancedFilterResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final currentCityIds =
              cities.map((c) => c['id'] as int).toSet().toList();
          final areaIds =
              loadedAreas.map((a) => a['id'] as int).toSet().toList();
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
                            Text('فلتر متقدم',
                                style: AppStyles.black20Bold),
                            if (currentFilters != null &&
                                currentFilters.hasFilters)
                              InkWell(
                                onTap: () => setState(() {
                                  selectedCompoundType = null;
                                  selectedUnitOperation = null;
                                  selectedUnitType = null;
                                  selectedCity = null;
                                  selectedArea = null;
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

                        _buildDropdown(
                          label: 'نوع العملية',
                          value: selectedUnitOperation,
                          items: _operationOptions,
                          displayFn: (v) => _operationText(v),
                          onChanged: (v) => setState(
                              () => selectedUnitOperation = v),
                        ),
                        Gap(16.h),

                        _buildDropdown(
                          label: LangKeys.unitType.tr(),
                          value: selectedUnitType,
                          items: _unitTypeOptions,
                          displayFn: (v) => _unitTypeText(v),
                          onChanged: (v) => setState(
                              () => selectedUnitType = v),
                        ),
                        Gap(16.h),

                        // City
                        _buildDropdown<int>(
                          label: LangKeys.city.tr(),
                          value: currentCityIds.contains(selectedCity)
                              ? selectedCity
                              : null,
                          items: currentCityIds,
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
                          value: areaIds.contains(selectedArea)
                              ? selectedArea
                              : null,
                          items: areaIds,
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

                        _buildDropdown(
                          label: 'الإطلالة',
                          value: selectedView,
                          items: _viewOptions,
                          displayFn: (v) => _viewText(v),
                          onChanged: (v) =>
                              setState(() => selectedView = v),
                        ),
                        Gap(16.h),

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
                _buildBottomButtons(
                  onReset: () => Navigator.pop(context, null),
                  onApply: () {
                    final result = BrokerDataAdvancedFilterResult(
                      compoundType: selectedCompoundType,
                      unitOperation: selectedUnitOperation,
                      unitType: selectedUnitType,
                      city: selectedCity,
                      area: selectedArea,
                      view: selectedView,
                      areaFrom: int.tryParse(areaFromController.text),
                      areaTo: int.tryParse(areaToController.text),
                      priceFrom: int.tryParse(priceFromController.text),
                      priceTo: int.tryParse(priceToController.text),
                    );
                    Navigator.pop(
                        context, result.hasFilters ? result : null);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

// ==================== Shared Widgets ====================

Widget _buildBottomButtons({
  required VoidCallback onReset,
  required VoidCallback onApply,
}) {
  return Container(
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
                borderColor:
                    BorderSide(color: AppColors.primaryDark),
                onPressed: onReset,
              ),
            ),
            Gap(12.w),
            Expanded(
              child: CustomButton(
                text: LangKeys.apply.tr(),
                onPressed: onApply,
              ),
            ),
          ],
        ),
      ),
    ),
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

String _operationText(String value) {
  switch (value) {
    case 'sell':
      return 'بيع';
    case 'rent_out':
      return 'تأجير';
    default:
      return value;
  }
}

String _unitTypeText(String value) {
  switch (value) {
    case 'apartments':
      return 'شقق';
    case 'duplexes':
      return 'دوبلكس';
    case 'penthouses':
      return 'بنتهاوس';
    case 'roofs':
      return 'أسطح';
    case 'studios':
      return 'ستوديوهات';
    case 'basements':
      return 'أقبية';
    case 'residential_buildings':
      return 'مباني سكنية';
    case 'villas':
      return 'فيلات';
    case 'i_villa':
      return 'آي فيلا';
    case 'administrative_units':
      return 'وحدات إدارية';
    case 'medical_clinics':
      return 'عيادات طبية';
    case 'pharmacies':
      return 'صيدليات';
    case 'commercial_stores':
      return 'محلات تجارية';
    case 'residential_lands':
      return 'أراضي سكنية';
    case 'commercial_administrative_buildings':
      return 'مباني إدارية تجارية';
    case 'commercial_administrative_lands':
      return 'أراضي إدارية تجارية';
    case 'factory_lands':
      return 'أراضي مصانع';
    case 'warehouse_lands':
      return 'أراضي مخازن';
    case 'chalets':
      return 'شاليهات';
    case 'vacation_villa':
      return 'فيلا إجازات';
    case 'hotels':
      return 'فنادق';
    case 'twin_houses':
      return 'توين هاوس';
    case 'town_houses':
      return 'تاون هاوس';
    case 'standalone_villas':
      return 'فيلات مستقلة';
    default:
      return value;
  }
}

String _viewText(String value) {
  switch (value) {
    case 'water_view':
      return 'اطلاله مائيه';
    case 'gardens_and_landscape':
      return 'حدائق ولاندسكيب';
    case 'street':
      return 'شارع';
    case 'entertainment_area':
      return 'منطقة ترفيهية';
    case 'garden':
      return 'حديقة';
    case 'main_street':
      return 'شارع رئيسي';
    case 'square':
      return 'ميدان';
    case 'side_street':
      return 'شارع جانبي';
    case 'rear_view':
      return 'خلفية';
    case 'swimming_pool':
      return 'حمام سباحة';
    case 'all_of_the_above':
      return 'كل ما سبق';
    default:
      return value;
  }
}
