import 'dart:io';
import 'package:easy_deal/features/create_request/data/stepper_config/input_config_model.dart';
import 'package:easy_deal/features/create_request/data/stepper_config/stepper_constants.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class DynamicFormField extends StatefulWidget {
  final InputConfig config;

  const DynamicFormField({super.key, required this.config});

  @override
  State<DynamicFormField> createState() => _DynamicFormFieldState();
}

class _DynamicFormFieldState extends State<DynamicFormField> {
  bool _touched = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        final cubit = context.read<CreateRequestCubit>();
        if (!_isVisible(cubit)) return SizedBox.shrink();
        return _buildField(context, cubit);
      },
    );
  }

  bool _isVisible(CreateRequestCubit cubit) {
    if (!widget.config.isVisible()) return false;
    switch (widget.config.name) {
      case 'cashPrice':
        return cubit.shouldShowCashPrice;
      case 'installmentPrice':
        return cubit.shouldShowInstallmentPrice;
      case 'floorNumber':
        return cubit.shouldShowFloorNumber;
      case 'deliveryDate':
        return cubit.shouldShowDeliveryDate;
      default:
        return true;
    }
  }

  Widget _buildField(BuildContext context, CreateRequestCubit cubit) {
    final error = _touched || cubit.validationAttempted ? cubit.getFieldError(widget.config) : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldContent(context, cubit, error),
        if (error != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(error, style: TextStyle(color: Colors.red, fontSize: 12.sp)),
          ),
        Gap(12.h),
      ],
    );
  }

  Widget _buildFieldContent(BuildContext context, CreateRequestCubit cubit, String? error) {
    switch (widget.config.type) {
      case InputFieldType.text:
      case InputFieldType.url:
        return _buildTextField(cubit, error, keyboardType: widget.config.type == InputFieldType.url ? TextInputType.url : TextInputType.text);
      case InputFieldType.number:
        return _buildTextField(cubit, error, keyboardType: TextInputType.number);
      case InputFieldType.textarea:
        return _buildTextField(cubit, error, maxLines: 4);
      case InputFieldType.date:
        return _buildDateField(context, cubit, error);
      case InputFieldType.select:
        return _buildDropdown(context, cubit, error);
      case InputFieldType.multiSelect:
        return _buildMultiSelect(context, cubit);
      case InputFieldType.checkbox:
        return _buildCheckbox(context, cubit);
      case InputFieldType.file:
        return _buildFileField(context, cubit);
    }
  }

  Widget _buildRequiredLabel(String label) {
    if (widget.config.required) {
      return Text.rich(
        TextSpan(
          text: label.tr(),
          style: AppStyles.black14SemiBold,
          children: [
            TextSpan(
              text: ' *',
              style: AppStyles.black14SemiBold.copyWith(color: Colors.red),
            ),
          ],
        ),
      );
    }
    return Text(label.tr(), style: AppStyles.black14SemiBold);
  }

  Widget _buildTextField(CreateRequestCubit cubit, String? error, {TextInputType? keyboardType, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRequiredLabel(widget.config.label),
        Gap(8.h),
        CustomTextFormField(
          controller: cubit.getOrCreateController(widget.config.name),
          hintText: widget.config.label.tr(),
          keyboardType: keyboardType,
          maxLines: maxLines,
          height: 52.h,
          borderRadius: 10.r,
          borderWidth: 1.5,
          onChanged: (val) {
            cubit.setFormValue(widget.config.name, val);
            if (!_touched) setState(() => _touched = true);
          },
          onTap: () { if (!_touched) setState(() => _touched = true); },
        ),
      ],
    );
  }

  Widget _buildDropdown(BuildContext context, CreateRequestCubit cubit, String? error) {
    final options = widget.config.options ?? [];
    final currentValue = cubit.getFormValueString(widget.config.name);
    final hasValue = currentValue != null && currentValue.isNotEmpty;

    String? displayValue;
    if (currentValue != null) {
      final match = options.cast<OptionItem?>().firstWhere(
        (o) => o!.value == currentValue,
        orElse: () => null,
      );
      displayValue = match?.key.tr() ?? currentValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRequiredLabel(widget.config.label),
        Gap(8.h),
        Container(
          width: double.infinity,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: hasValue ? AppColors.primaryDark.withValues(alpha: 0.35) : AppColors.blueLight,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButton<String>(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            isExpanded: true,
            underline: const SizedBox.shrink(),
            value: displayValue,
            hint: Text(
              widget.config.label.tr(),
              style: TextStyle(
                color: const Color(0xFF969696),
                fontSize: 14.sp,
              ),
            ),
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.primaryDark,
              size: 24.sp,
            ),
            items: options.map((o) {
              return DropdownMenuItem<String>(
                value: o.key.tr(),
                child: Text(o.key.tr()),
              );
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                final matched = options.cast<OptionItem?>().firstWhere(
                  (o) => o!.key.tr() == val,
                );
                cubit.setFormValue(widget.config.name, matched!.value);
                if (!_touched) setState(() => _touched = true);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMultiSelect(BuildContext context, CreateRequestCubit cubit) {
    final options = widget.config.options ?? [];
    final selectedValues = cubit.getFormValueList(widget.config.name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRequiredLabel(widget.config.label),
        Gap(8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 4.h,
          children: options.map((o) {
            final isSelected = selectedValues.contains(o.value);
            return FilterChip(
              label: Text(o.key.tr()),
              selected: isSelected,
              onSelected: (selected) {
                final updated = List<String>.from(selectedValues);
                if (selected) {
                  updated.add(o.value);
                } else {
                  updated.remove(o.value);
                }
                cubit.setFormValue(widget.config.name, updated);
                if (!_touched) setState(() => _touched = true);
              },
              selectedColor: AppColors.primaryDark.withValues(alpha: 0.2),
              checkmarkColor: AppColors.primaryDark,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCheckbox(BuildContext context, CreateRequestCubit cubit) {
    final value = cubit.getFormValue(widget.config.name) as bool? ?? false;
    return Column(
      children: [
        CheckboxListTile(
          value: value,
          onChanged: (v) => cubit.setFormValue(widget.config.name, v ?? false),
          activeColor: AppColors.primaryDark,
          checkColor: AppColors.white,
          title: _buildRequiredLabel(widget.config.label),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, CreateRequestCubit cubit, String? error) {
    final currentValue = cubit.getFormValueString(widget.config.name);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRequiredLabel(widget.config.label),
        Gap(8.h),
        GestureDetector(
          onTap: () async {
            if (!_touched) setState(() => _touched = true);
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              cubit.setFormValue(widget.config.name, date.toIso8601String().split('T')[0]);
            }
          },
          child: Container(
            width: double.infinity,
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: error != null ? Colors.red : currentValue != null ? AppColors.primaryDark.withValues(alpha: 0.35) : AppColors.blueLight,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                currentValue ?? widget.config.label.tr(),
                style: TextStyle(
                  color: currentValue != null ? AppColors.black : const Color(0xFF969696),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileField(BuildContext context, CreateRequestCubit cubit) {
    return _buildFileUploadCard(context, cubit);
  }

  Widget _buildFileUploadCard(BuildContext context, CreateRequestCubit cubit) {
    final File? file;
    bool isEmpty;
    VoidCallback? onPick;
    VoidCallback? onClear;

    switch (widget.config.name) {
      case 'mainImage':
        file = cubit.mainImage;
        isEmpty = file == null;
        onPick = () => cubit.pickMainImage(newEmit: UploadMainImageSuccessState());
        onClear = () => cubit.clearMainImage(newEmit: ClearMainImageSuccessState());
        break;
      case 'unitInMasterPlanImage':
        file = cubit.unitInMasterPlanImage;
        isEmpty = file == null;
        onPick = () => cubit.pickUnitInMasterPlanImage(newEmit: UploadUnitInMasterPlanSuccessState());
        onClear = () => cubit.clearUnitInMasterPlanImage(newEmit: ClearUnitInMasterPlanSuccessState());
        break;
      case 'galleryImages':
        isEmpty = cubit.galleryImages.isEmpty;
        onPick = () => cubit.pickGalleryImages(newEmit: UploadGalleryImagesSuccessState());
        onClear = () => cubit.clearGalleryImages(newEmit: ClearGalleryImagesSuccessState());
        file = null;
        break;
      case 'video':
        file = cubit.video;
        isEmpty = file == null;
        onPick = () => cubit.pickVideo(newEmit: UploadVideoSuccessState());
        onClear = () => cubit.clearVideo(newEmit: ClearVideoSuccessState());
        break;
      default:
        return SizedBox.shrink();
    }

    final fileCount = (widget.config.name == 'galleryImages') ? cubit.galleryImages.length : (isEmpty ? 0 : 1);
    final isVideo = widget.config.name == 'video';

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: onPick,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isEmpty ? AppColors.gray : AppColors.primaryDark,
              width: 2,
            ),
            color: isEmpty ? Colors.grey[50] : Colors.white,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Icon(
                    isEmpty ? Icons.cloud_upload_outlined : Icons.check_circle,
                    size: 40,
                    color: isEmpty ? Colors.grey : AppColors.primaryDark,
                  ),
                  Gap(8.h),
                  Text(
                    widget.config.label.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: Colors.black87),
                  ),
                  Gap(4.h),
                  Text(
                    isEmpty ? (isVideo ? 'Select videos' : 'Select images') : '$fileCount files uploaded successfully',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  if (!isEmpty) ...[
                    Gap(6.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(color: AppColors.primaryDark, borderRadius: BorderRadius.circular(12)),
                      child: Text('$fileCount files', style: TextStyle(fontSize: 11.sp, color: Colors.white)),
                    ),
                  ],
                ],
              ),
              if (!isEmpty)
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: onClear,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.1), shape: BoxShape.circle),
                      child: Icon(Icons.close, size: 18, color: Colors.red),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}