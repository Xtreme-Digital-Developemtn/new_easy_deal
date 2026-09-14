import '../../../../../main_imports.dart';
import '../../../data/config/ap_fields.dart';
import '../../view_model/add_property_cubit.dart';
import 'ap_dropdown.dart';
import 'ap_multi_select.dart';

/// Renders a single dynamic field (step 2 / step 3) by its name, using the
/// cubit for options, current value, visibility and validation.
class ApDynamicField extends StatelessWidget {
  const ApDynamicField({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPropertyCubit>();
    final meta = ApFields.metaOf(name);
    final isArabic = context.isArabic;
    final label = meta.label.value(isArabic);
    final error = cubit.errorFor(name);

    Widget field;
    switch (meta.kind) {
      case ApFieldKind.text:
      case ApFieldKind.number:
      case ApFieldKind.textarea:
        field = _text(context, cubit, meta, label, error);
        break;
      case ApFieldKind.date:
        field = _date(context, cubit, label, error);
        break;
      case ApFieldKind.multiSelect:
        field = _multiSelect(cubit, label);
        break;
      case ApFieldKind.dropdown:
        field = ApDropdown(
          label: label,
          hint: label,
          required: cubit.isRequired(name),
          error: error,
          options: cubit.optionsForField(name),
          selectedValue: cubit.valueStr(name),
          onSelected: (v) {
            if (name == 'paymentSystem') {
              cubit.selectPaymentSystem(v);
            } else {
              cubit.setValue(name, v);
            }
          },
        );
        break;
    }

    return Padding(padding: EdgeInsets.only(bottom: 16.h), child: field);
  }

  Widget _text(BuildContext context, AddPropertyCubit cubit, ApFieldMeta meta, String label, String? error) {
    final isNumber = meta.kind == ApFieldKind.number;
    final isPricePerMeter = name == 'pricePerMeterInCash' || name == 'pricePerMeterInInstallment';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(cubit, label),
        Gap(8.h),
        CustomTextFormField(
          controller: cubit.controller(name),
          hintText: label,
          keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
          maxLines: meta.kind == ApFieldKind.textarea ? 4 : 1,
          borderRadius: 10.r,
          borderWidth: 1.5,
          errorText: error,
          onChanged: (v) {
            if (isPricePerMeter) {
              cubit.onPricePerMeterChanged(name, v);
            } else {
              cubit.setValue(name, v);
            }
          },
        ),
      ],
    );
  }

  Widget _date(BuildContext context, AddPropertyCubit cubit, String label, String? error) {
    final current = cubit.valueStr(name);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(cubit, label),
        Gap(8.h),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              cubit.setValue(name, date.toIso8601String().split('T').first);
            }
          },
          child: Container(
            width: double.infinity,
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: current != null ? AppColors.primaryDark.withValues(alpha: 0.35) : AppColors.blueLight,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              current ?? label,
              style: TextStyle(
                color: current != null ? AppColors.black : const Color(0xFF969696),
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _multiSelect(AddPropertyCubit cubit, String label) {
    if (name == 'otherExpenses') {
      return ApMultiSelect(
        label: label,
        hint: label,
        options: cubit.optionsForField('otherExpenses'),
        selectedValues: cubit.valueList('otherExpenses'),
        onToggle: cubit.toggleExpense,
        onToggleAll: cubit.toggleAllExpenses,
      );
    }
    return ApMultiSelect(
      label: label,
      hint: label,
      options: cubit.optionsForField('otherAccessories'),
      selectedValues: cubit.valueList('otherAccessories'),
      onToggle: cubit.toggleAccessory,
      onToggleAll: cubit.toggleAllAccessories,
    );
  }

  Widget _label(AddPropertyCubit cubit, String label) {
    if (!cubit.isRequired(name)) return Text(label, style: AppStyles.black14SemiBold);
    return Text.rich(
      TextSpan(
        text: label,
        style: AppStyles.black14SemiBold,
        children: [TextSpan(text: ' *', style: AppStyles.black14SemiBold.copyWith(color: Colors.red))],
      ),
    );
  }
}
