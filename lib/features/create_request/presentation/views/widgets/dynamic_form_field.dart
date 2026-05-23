import 'dart:io';
import 'package:easy_deal/features/create_request/data/stepper_config/input_config_model.dart';
import 'package:easy_deal/features/create_request/data/stepper_config/stepper_constants.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';

class DynamicFormField extends StatelessWidget {
  final InputConfig config;

  const DynamicFormField({super.key, required this.config});

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
    if (!config.isVisible()) return false;
    switch (config.name) {
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
    switch (config.type) {
      case InputFieldType.text:
      case InputFieldType.url:
        return _buildTextField(cubit, keyboardType: config.type == InputFieldType.url ? TextInputType.url : TextInputType.text);
      case InputFieldType.number:
        return _buildTextField(cubit, keyboardType: TextInputType.number);
      case InputFieldType.textarea:
        return _buildTextField(cubit, maxLines: 4);
      case InputFieldType.date:
        return _buildDateField(context, cubit);
      case InputFieldType.select:
        return _buildDropdown(context, cubit);
      case InputFieldType.multiSelect:
        return _buildMultiSelect(context, cubit);
      case InputFieldType.checkbox:
        return _buildCheckbox(context, cubit);
      case InputFieldType.file:
        return _buildFileField(context, cubit);
    }
  }

  Widget _buildTextField(CreateRequestCubit cubit, {TextInputType? keyboardType, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.label, style: AppStyles.black14Regular),
        Gap(6.h),
        CustomTextFormField(
          controller: cubit.getOrCreateController(config.name),
          hintText: config.label,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: (val) => cubit.setFormValue(config.name, val),
        ),
        Gap(12.h),
      ],
    );
  }

  Widget _buildDropdown(BuildContext context, CreateRequestCubit cubit) {
    final options = config.options ?? [];
    final currentValue = cubit.getFormValueString(config.name);

    String? displayValue;
    if (currentValue != null) {
      final match = options.cast<OptionItem?>().firstWhere(
        (o) => o!.value == currentValue,
        orElse: () => null,
      );
      displayValue = match?.key ?? currentValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.label, style: AppStyles.black14Regular),
        Gap(6.h),
        CustomDropdown<String>(
          value: displayValue,
          items: options.map((o) => o.key).toList(),
          onChanged: (val) {
            if (val != null) {
              final matched = options.cast<OptionItem?>().firstWhere(
                (o) => o!.key == val,
              );
              cubit.setFormValue(config.name, matched!.value);
            }
          },
          hint: config.label,
          itemDisplayBuilder: (v) => v,
        ),
        Gap(12.h),
      ],
    );
  }

  Widget _buildMultiSelect(BuildContext context, CreateRequestCubit cubit) {
    final options = config.options ?? [];
    final selectedValues = cubit.getFormValueList(config.name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.label, style: AppStyles.black14Regular),
        Gap(6.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 4.h,
          children: options.map((o) {
            final isSelected = selectedValues.contains(o.value);
            return FilterChip(
              label: Text(o.key),
              selected: isSelected,
              onSelected: (selected) {
                final updated = List<String>.from(selectedValues);
                if (selected) {
                  updated.add(o.value);
                } else {
                  updated.remove(o.value);
                }
                cubit.setFormValue(config.name, updated);
              },
              selectedColor: AppColors.primaryDark.withValues(alpha: 0.2),
              checkmarkColor: AppColors.primaryDark,
            );
          }).toList(),
        ),
        Gap(12.h),
      ],
    );
  }

  Widget _buildCheckbox(BuildContext context, CreateRequestCubit cubit) {
    final value = cubit.getFormValue(config.name) as bool? ?? false;
    return Column(
      children: [
        CheckboxListTile(
          value: value,
          onChanged: (v) => cubit.setFormValue(config.name, v ?? false),
          activeColor: AppColors.primaryDark,
          checkColor: AppColors.white,
          title: Text(config.label, style: AppStyles.black14Regular),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        Gap(12.h),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, CreateRequestCubit cubit) {
    final currentValue = cubit.getFormValueString(config.name);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(config.label, style: AppStyles.black14Regular),
        Gap(6.h),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              cubit.setFormValue(config.name, date.toIso8601String().split('T')[0]);
            }
          },
          child: Container(
            width: double.infinity,
            height: 56.h,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blueLight),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                currentValue ?? config.label,
                style: TextStyle(
                  color: currentValue != null ? AppColors.black : AppColors.gray,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Gap(12.h),
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

    switch (config.name) {
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

    final fileCount = (config.name == 'galleryImages') ? cubit.galleryImages.length : (isEmpty ? 0 : 1);
    final isVideo = config.name == 'video';

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
                    config.label,
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
