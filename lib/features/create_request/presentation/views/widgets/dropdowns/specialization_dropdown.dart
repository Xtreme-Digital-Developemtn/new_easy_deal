import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';
import '../../../view_model/create_request_cubit.dart';

class SpecializationDropdown extends StatelessWidget {
  final CreateRequestCubit cubit;
  final List<dynamic> transactionTypes;

  const SpecializationDropdown({required this.cubit, required this.transactionTypes, super.key});

  @override
  Widget build(BuildContext context) {
    final specializationItems = transactionTypes.map<Map<String, String>>((item) {
      return {
        'label': item['label'] as String,
        'value': item['value'] as String,
      };
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: LangKeys.scopeOfSpecialization.tr(),
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
              color: cubit.selectedSpecializationValue != null
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
            value: cubit.selectedSpecializationLabel,
            hint: Text(
              LangKeys.scopeOfSpecialization.tr(),
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
            items: specializationItems.map((item) {
              return DropdownMenuItem<String>(
                value: item['label'],
                child: Text(item['label']!.tr()),
              );
            }).toList(),
            onChanged: (selectedLabel) {
              if (selectedLabel != null) {
                final selectedItem = specializationItems.firstWhere(
                  (e) => e['label'] == selectedLabel,
                );
                cubit.selectSpecialization(
                  value: selectedItem['value'],
                  label: selectedItem['label'],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
