import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/create_request_cubit.dart';

class UnitTypeDropdown extends StatelessWidget {
  final CreateRequestCubit cubit;
  final List<dynamic> transactionTypes;

  const UnitTypeDropdown({required this.cubit, required this.transactionTypes, super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> unitTypeItems = [];
    if (cubit.selectedSpecializationValue != null && cubit.selectedDealTypeValue != null) {
      final selectedTransaction = transactionTypes.firstWhere(
        (item) => item['value'] == cubit.selectedSpecializationValue,
      );
      final subtypes = selectedTransaction['subtypes'] as List<dynamic>;
      final selectedSubtype = subtypes.firstWhere(
        (sub) => sub['value'] == cubit.selectedDealTypeValue,
      );
      final units = selectedSubtype['units'] as List<dynamic>;
      unitTypeItems = units.map<Map<String, String>>((unit) {
        return {
          'label': unit['label'] as String,
          'value': unit['value'] as String,
        };
      }).toList();
    }

    final bool hasItems = unitTypeItems.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.unitType.tr(), style: AppStyles.black14SemiBold),
        Gap(8.h),
        Container(
          width: double.infinity,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: cubit.selectedUnitTypeValue != null
                  ? AppColors.primaryDark
                  : AppColors.blueLight,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButton<String>(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            isExpanded: true,
            underline: const SizedBox.shrink(),
            value: cubit.selectedUnitTypeLabel,
            hint: Text(
              LangKeys.unitType.tr(),
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
              color: hasItems ? AppColors.primaryDark : AppColors.grayLight,
              size: 24.sp,
            ),
            items: unitTypeItems.map((item) {
              return DropdownMenuItem<String>(
                value: item['label'],
                child: Text(item['label']!.tr()),
              );
            }).toList(),
            onChanged: hasItems
                ? (selectedLabel) {
                    if (selectedLabel != null) {
                      final selectedItem = unitTypeItems.firstWhere(
                        (e) => e['label'] == selectedLabel,
                      );
                      cubit.selectUnitType(
                        value: selectedItem['value'],
                        label: selectedItem['label'],
                      );
                    }
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
