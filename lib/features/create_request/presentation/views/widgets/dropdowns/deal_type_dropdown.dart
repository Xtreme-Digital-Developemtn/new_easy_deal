import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/create_request_cubit.dart';

class DealTypeDropdown extends StatelessWidget {
  final CreateRequestCubit cubit;
  final List<dynamic> transactionTypes;

  const DealTypeDropdown({required this.cubit, required this.transactionTypes, super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dealTypeItems = [];
    if (cubit.selectedSpecializationValue != null) {
      final selectedTransaction = transactionTypes.firstWhere(
        (item) => item['value'] == cubit.selectedSpecializationValue,
      );
      final subtypes = selectedTransaction['subtypes'] as List<dynamic>;
      dealTypeItems = subtypes.map<Map<String, String>>((sub) {
        return {
          'label': sub['label'] as String,
          'value': sub['value'] as String,
        };
      }).toList();
    }

    final bool hasItems = dealTypeItems.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: LangKeys.dealType.tr(),
            style: AppStyles.black14SemiBold,
            children: [
              TextSpan(
                text: ' *',
                style: AppStyles.black14SemiBold.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
        Gap(8.h),
        Container(
          width: double.infinity,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: cubit.selectedDealTypeValue != null
                  ? AppColors.primaryDark.withValues(alpha: 0.35)
                  : AppColors.blueLight,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButton<String>(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            isExpanded: true,
            underline: const SizedBox.shrink(),
            value: cubit.selectedDealTypeLabel,
            hint: Text(
              LangKeys.dealType.tr(),
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
            items: dealTypeItems.map((item) {
              return DropdownMenuItem<String>(
                value: item['label'],
                child: Text(item['label']!.tr()),
              );
            }).toList(),
            onChanged: hasItems
                ? (selectedLabel) {
                    if (selectedLabel != null) {
                      final selectedItem = dealTypeItems.firstWhere(
                        (e) => e['label'] == selectedLabel,
                      );
                      cubit.selectDealType(
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
