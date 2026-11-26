import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import '../../../../../../main_imports.dart';

class DeveloperFilterResult {
  final String? compoundType;
  final int? city;
  final int? area;
  final int? subArea;

  /// اسم منطقة فرعية كتبه المستخدم بنفسه عند اختيار «أخرى».
  final String? otherSubAreas;
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
    this.subArea,
    this.otherSubAreas,
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
      subArea != null ||
      (otherSubAreas != null && otherSubAreas!.trim().isNotEmpty) ||
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
    if (subArea != null) params['subArea'] = subArea;
    // منطقة فرعية «أخرى» مكتوبة بالنص — بتتبعت بنفس اسم الحقل للـ API
    if (otherSubAreas != null && otherSubAreas!.trim().isNotEmpty) {
      params['otherSubAreas'] = otherSubAreas!.trim();
    }
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

final _compoundOptions = ['inside_compound', 'outside_compound'];

/// قيمة وهمية لعنصر «أخرى» في قائمة المنطقة الفرعية — مش بتتبعت للـ API،
/// بس بتفتح خانة النص اللي بتتبعت باسم `otherSubAreas`.
const _otherSubAreaId = -1;

/// نفس قائمة أنواع الوحدات المستخدمة في فلتر بيانات الوسيط (مطابقة للويب:
/// نفس القيم، نفس الترتيب، نفس المسميات) — بتبدأ بـ «شقة».
const _unitTypeOptions = [
  // سكني
  'apartments',
  'duplexes',
  'studios',
  'penthouses',
  'basements',
  'roofs',
  // فيلات
  'i_villa',
  'town_houses',
  'twin_houses',
  'standalone_villas',
  'villas',
  'residential_buildings',
  // تجاري / إداري
  'administrative_units',
  'medical_clinics',
  'commercial_stores',
  'pharmacies',
  'commercial_administrative_buildings',
  // صناعي وأراضي
  'warehouse_lands',
  'factory_lands',
  'residential_lands',
  'commercial_administrative_lands',
  // وحدات مصايف
  'chalets',
  'vacation_villa',
  'hotels',
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
];

Future<DeveloperFilterResult?> showDeveloperFilterSheet(
  BuildContext context,
  DeveloperFilterResult? currentFilters, {
  List<Map<String, dynamic>> cities = const [],
  Future<List<Map<String, dynamic>>> Function(int cityId)? loadAreas,
  Future<List<Map<String, dynamic>>> Function(int areaId)? loadSubAreas,
}) async {
  var selectedCompoundType = currentFilters?.compoundType;
  int? selectedCity = currentFilters?.city;
  int? selectedArea = currentFilters?.area;
  int? selectedSubArea = currentFilters?.subArea;
  // «أخرى» في المنطقة الفرعية: بنلغي الـ id ونفتح خانة نص اسمها otherSubAreas
  var isSubAreaOther =
      (currentFilters?.otherSubAreas?.trim().isNotEmpty ?? false);
  final otherSubAreaController = TextEditingController(
    text: currentFilters?.otherSubAreas ?? '',
  );
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
  List<Map<String, dynamic>> loadedSubAreas = [];

  // لو الشيت فتحت وفيها فلاتر مطبّقة، بنحمّل المناطق والمناطق الفرعية
  // الأول عشان القوائم تبان بالقيمة المختارة.
  if (selectedCity != null && loadAreas != null) {
    loadedAreas = await loadAreas(selectedCity);
  }
  if (selectedArea != null && loadSubAreas != null) {
    loadedSubAreas = await loadSubAreas(selectedArea);
  }
  if (!context.mounted) return null;

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
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0.r)),
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
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LangKeys.filter.tr(),
                              style: AppStyles.black20Bold,
                            ),
                            if (currentFilters != null &&
                                currentFilters.hasFilters)
                              InkWell(
                                onTap: () => setState(() {
                                  selectedCompoundType = null;
                                  selectedCity = null;
                                  selectedArea = null;
                                  selectedSubArea = null;
                                  isSubAreaOther = false;
                                  otherSubAreaController.clear();
                                  loadedAreas.clear();
                                  loadedSubAreas.clear();
                                  selectedUnitType = null;
                                  selectedView = null;
                                  areaFromController.clear();
                                  areaToController.clear();
                                  priceFromController.clear();
                                  priceToController.clear();
                                }),
                                child: Text(
                                  LangKeys.clearAll.tr(),
                                  style: AppStyles.primary14Medium,
                                ),
                              ),
                          ],
                        ),
                        Gap(24.h),

                        // Compound Type
                        _buildDropdown(
                          label: LangKeys.compoundType.tr(),
                          value: selectedCompoundType,
                          items: _compoundOptions,
                          displayFn: (v) => BrokerTextHelper.projectTypeText(v),
                          onChanged: (v) =>
                              setState(() => selectedCompoundType = v),
                        ),
                        Gap(16.h),

                        // City
                        _buildDropdown<int>(
                          label: LangKeys.city.tr(),
                          value: selectedCity,
                          items: cities.map((c) => c['id'] as int).toList(),
                          displayFn: (id) {
                            final city = cities.firstWhere(
                              (c) => c['id'] == id,
                              orElse: () => {'name_ar': id.toString()},
                            );
                            return city['name_ar']?.toString() ?? id.toString();
                          },
                          onChanged: (v) async {
                            selectedCity = v;
                            selectedArea = null;
                            selectedSubArea = null;
                            isSubAreaOther = false;
                            otherSubAreaController.clear();
                            loadedAreas.clear();
                            loadedSubAreas.clear();
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
                            return area['name_ar']?.toString() ?? id.toString();
                          },
                          onChanged: (v) async {
                            selectedArea = v;
                            selectedSubArea = null;
                            isSubAreaOther = false;
                            otherSubAreaController.clear();
                            loadedSubAreas.clear();
                            if (v != null && loadSubAreas != null) {
                              final subAreas = await loadSubAreas(v);
                              loadedSubAreas.addAll(subAreas);
                            }
                            setState(() {});
                          },
                        ),
                        Gap(16.h),

                        // Sub Area — «أخرى» دايمًا آخر عنصر في القائمة
                        _buildDropdown<int>(
                          label: LangKeys.subArea.tr(),
                          value: isSubAreaOther
                              ? _otherSubAreaId
                              : selectedSubArea,
                          items: [
                            ...loadedSubAreas.map((s) => s['id'] as int),
                            _otherSubAreaId,
                          ],
                          displayFn: (id) {
                            if (id == _otherSubAreaId) {
                              return LangKeys.other.tr();
                            }
                            final subArea = loadedSubAreas.firstWhere(
                              (s) => s['id'] == id,
                              orElse: () => {'name_ar': id.toString()},
                            );
                            return subArea['name_ar']?.toString() ??
                                id.toString();
                          },
                          onChanged: (v) => setState(() {
                            if (v == _otherSubAreaId) {
                              isSubAreaOther = true;
                              selectedSubArea = null;
                            } else {
                              isSubAreaOther = false;
                              otherSubAreaController.clear();
                              selectedSubArea = v;
                            }
                          }),
                        ),

                        // خانة كتابة المنطقة الفرعية عند اختيار «أخرى»
                        if (isSubAreaOther) ...[
                          Gap(8.h),
                          _buildTextField(
                            label: LangKeys.otherSubArea.tr(),
                            controller: otherSubAreaController,
                          ),
                        ],
                        Gap(16.h),

                        // Unit Type
                        _buildDropdown(
                          label: LangKeys.unitType.tr(),
                          value: selectedUnitType,
                          items: _unitTypeOptions,
                          displayFn: (v) => v.tr(),
                          onChanged: (v) =>
                              setState(() => selectedUnitType = v),
                        ),
                        Gap(16.h),

                        // View
                        _buildDropdown(
                          label: 'الإطلالة',
                          value: selectedView,
                          items: _viewOptions,
                          displayFn: (v) => _viewText(v),
                          onChanged: (v) => setState(() => selectedView = v),
                        ),
                        Gap(16.h),

                        // Area Range
                        Text('المساحة (م²)', style: AppStyles.black16SemiBold),
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
                        Text('السعر (ج.م)', style: AppStyles.black16SemiBold),
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
                              borderColor: BorderSide(
                                color: AppColors.primaryDark,
                              ),
                              onPressed: () {
                                // نتيجة فاضية (مش null) عشان الشاشة تفرّق بين
                                // «إعادة تعيين» وبين قفل الشيت من غير قرار.
                                Navigator.pop(
                                  context,
                                  const DeveloperFilterResult(),
                                );
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
                                  subArea: selectedSubArea,
                                  otherSubAreas: isSubAreaOther
                                      ? otherSubAreaController.text.trim()
                                      : null,
                                  unitType: selectedUnitType,
                                  view: selectedView,
                                  areaFrom: int.tryParse(
                                    areaFromController.text,
                                  ),
                                  areaTo: int.tryParse(areaToController.text),
                                  priceFrom: int.tryParse(
                                    priceFromController.text,
                                  ),
                                  priceTo: int.tryParse(priceToController.text),
                                );
                                Navigator.pop(context, result);
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
                  Text(
                    LangKeys.clearSelection.tr(),
                    style: AppStyles.primary14Medium,
                  ),
                  Gap(4.w),
                  Icon(Icons.close, size: 16.sp, color: AppColors.primaryDark),
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
            hint: Text(LangKeys.selectAll.tr(), style: AppStyles.black14Medium),
            items: [
              DropdownMenuItem<T>(
                value: null,
                child: Text(
                  LangKeys.clearSelection.tr(),
                  style: AppStyles.black14Medium,
                ),
              ),
              ...items.map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(displayFn(item), style: AppStyles.black14Medium),
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

/// خانة نص عادية (المنطقة الفرعية «أخرى») — بنفس شكل خانات الأرقام.
Widget _buildTextField({
  required String label,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      hintText: label,
      hintStyle: AppStyles.black14Medium.copyWith(color: Colors.grey),
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
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    ),
    style: AppStyles.black14Medium,
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
      hintStyle: AppStyles.black14Medium.copyWith(color: Colors.grey),
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
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    ),
    style: AppStyles.black14Medium,
  );
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
      return 'إطلالة خلفية';
    default:
      return value;
  }
}
