import '../../../../../main_imports.dart';
import '../../../data/config/ap_options.dart';
import '../../view_model/add_property_cubit.dart';
import 'ap_dropdown.dart';

/// Step 0 – the three category dropdowns: compound type, operation, unit type.
class ApStep0Category extends StatelessWidget {
  const ApStep0Category({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final isArabic = context.isArabic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ApDropdown(
          label: isArabic ? 'نوع الكمبوند' : 'Compound Type',
          hint: isArabic ? 'اختر النوع' : 'Select Type',
          required: true,
          options: ApOptions.compoundTypes,
          selectedValue: cubit.compoundType,
          onSelected: (v) => cubit.selectStep0('compoundType', v),
        ),
        Gap(20.h),
        ApDropdown(
          label: isArabic ? 'النوع' : 'Property Type',
          hint: isArabic ? 'اختر النوع' : 'Select Type',
          required: true,
          options: ApOptions.propertyOperations,
          selectedValue: cubit.unitOperation,
          onSelected: (v) => cubit.selectStep0('unitOperation', v),
        ),
        Gap(20.h),
        ApDropdown(
          label: isArabic ? 'نوع الوحدة' : 'Unit Type',
          hint: isArabic ? 'اختر نوع الوحدة' : 'Select Unit Type',
          required: true,
          enabled: cubit.filteredUnitTypes.isNotEmpty,
          disabledHint: isArabic ? 'اختر النوع أولاً' : 'Select type first',
          options: cubit.filteredUnitTypes,
          selectedValue: cubit.unitType,
          onSelected: (v) => cubit.selectStep0('type', v),
        ),
      ],
    );
  }
}
