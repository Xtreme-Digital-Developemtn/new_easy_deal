import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';
import '../../../data/config/ap_option_item.dart';
import '../../view_model/add_property_cubit.dart';
import 'ap_dropdown.dart';

/// Step 1 – owner + location information.
class ApStep1Location extends StatelessWidget {
  const ApStep1Location({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final isArabic = context.isArabic;
    final attempted = cubit.validationAttempted;

    final cityOptions = cubit.citiesList
        .map((c) => ApOptionItem(value: '${c.id}', ar: c.nameAr ?? c.nameEn ?? '', en: c.nameEn ?? c.nameAr ?? ''))
        .toList();
    final areaOptions = cubit.areasList
        .map((a) => ApOptionItem(value: '${a.id}', ar: a.nameAr ?? a.nameEn ?? '', en: a.nameEn ?? a.nameAr ?? ''))
        .toList();
    final subAreaOptions = cubit.subAreasList
        .map((s) => ApOptionItem(value: '${s.id}', ar: s.nameAr ?? s.nameEn ?? '', en: s.nameEn ?? s.nameAr ?? ''))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text(cubit, name: 'ownerName', label: isArabic ? 'اسم المالك' : 'Owner Name'),
        Gap(16.h),
        _text(
          cubit,
          name: 'ownerPhone',
          label: isArabic ? 'هاتف المالك' : 'Owner Phone',
          required: true,
          keyboard: TextInputType.phone,
          error: cubit.liveTextError('ownerPhone'),
        ),
        Gap(16.h),
        ApDropdown(
          label: isArabic ? 'المدينة' : 'City',
          hint: isArabic ? 'اختر المدينة' : 'Select City',
          required: true,
          options: cityOptions,
          selectedValue: cubit.selectedCity == null ? null : '${cubit.selectedCity!.id}',
          error: attempted && cubit.selectedCity == null ? LangKeys.fieldRequired.tr() : null,
          onSelected: (v) {
            final city = cubit.citiesList.firstWhere((c) => '${c.id}' == v);
            cubit.selectCityItem(city);
          },
        ),
        Gap(16.h),
        ApDropdown(
          label: isArabic ? 'المنطقة' : 'Area',
          hint: isArabic ? 'اختر المنطقة' : 'Select Area',
          required: true,
          enabled: cubit.areasList.isNotEmpty,
          options: areaOptions,
          selectedValue: cubit.selectedArea == null ? null : '${cubit.selectedArea!.id}',
          error: attempted && cubit.selectedArea == null ? LangKeys.fieldRequired.tr() : null,
          onSelected: (v) {
            final area = cubit.areasList.firstWhere((a) => '${a.id}' == v);
            cubit.selectAreaItem(area);
          },
        ),
        Gap(16.h),
        ApDropdown(
          label: isArabic ? 'المنطقة الفرعية' : 'Sub Area',
          hint: isArabic ? 'اختر المنطقة الفرعية' : 'Select Sub Area',
          enabled: cubit.subAreasList.isNotEmpty,
          options: subAreaOptions,
          selectedValue: cubit.selectedSubArea == null ? null : '${cubit.selectedSubArea!.id}',
          onSelected: (v) {
            cubit.selectSubAreaItem(cubit.subAreasList.firstWhere((s) => '${s.id}' == v));
          },
        ),
        if (cubit.isOtherSubArea) ...[
          Gap(12.h),
          _text(cubit, name: 'otherSubArea', label: isArabic ? 'منطقة فرعية مخصصة' : 'Custom Sub Area'),
        ],
        Gap(16.h),
        _text(
          cubit,
          name: 'detailedAddress',
          label: isArabic ? 'العنوان التفصيلي' : 'Detailed Address',
          required: true,
          error: cubit.liveTextError('detailedAddress', required: true),
        ),
        if (cubit.shouldShowField('mallName')) ...[
          Gap(16.h),
          _text(cubit, name: 'mallName', label: isArabic ? 'اسم المول' : 'Mall Name'),
        ],
        if (cubit.shouldShowField('villageName')) ...[
          Gap(16.h),
          _text(cubit, name: 'villageName', label: isArabic ? 'اسم القرية' : 'Village Name'),
        ],
        if (cubit.shouldShowField('compoundName')) ...[
          Gap(16.h),
          _text(cubit, name: 'compoundName', label: isArabic ? 'اسم الكمبوند' : 'Compound Name'),
        ],
        Gap(16.h),
        _text(
          cubit,
          name: 'location',
          label: isArabic ? 'رابط خرائط جوجل' : 'Google Maps Link',
          keyboard: TextInputType.url,
          error: cubit.liveTextError('location'),
        ),
      ],
    );
  }

  Widget _text(
    AddPropertyCubit cubit, {
    required String name,
    required String label,
    bool required = false,
    TextInputType? keyboard,
    String? error,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (required)
          Text.rich(TextSpan(
            text: label,
            style: AppStyles.black14SemiBold,
            children: [TextSpan(text: ' *', style: AppStyles.black14SemiBold.copyWith(color: Colors.red))],
          ))
        else
          Text(label, style: AppStyles.black14SemiBold),
        Gap(8.h),
        CustomTextFormField(
          controller: cubit.controller(name),
          hintText: label,
          keyboardType: keyboard,
          borderRadius: 10.r,
          borderWidth: 1.5,
          errorText: error,
          onChanged: (v) => cubit.setValue(name, v),
        ),
      ],
    );
  }
}
