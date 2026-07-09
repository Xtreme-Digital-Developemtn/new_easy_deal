import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

class RequestsFilterResult {
  final String? status;
  final String? specialization;
  final String? dealType;
  final String? unitType;

  const RequestsFilterResult({
    this.status,
    this.specialization,
    this.dealType,
    this.unitType,
  });

  bool get hasFilters =>
      status != null || specialization != null || dealType != null || unitType != null;
}

Future<RequestsFilterResult?> showFilterBottomSheet(BuildContext context) async {
  String? selectedStatus;
  String? selectedSpecialization;
  String? selectedDealType;
  String? selectedUnitType;

  final statusOptions = [
    {'label': 'Pending', 'value': 'pending'},
    {'label': 'Accepted', 'value': 'accepted'},
    {'label': 'Rejected', 'value': 'rejected'},
    {'label': 'Completed', 'value': 'completed'},
  ];

  final specializationOptions = [
    {'label': 'Real Estate', 'value': 'real_estate'},
    {'label': 'Cars', 'value': 'cars'},
    {'label': 'Electronics', 'value': 'electronics'},
    {'label': 'Furniture', 'value': 'furniture'},
    {'label': 'Services', 'value': 'services'},
  ];

  final dealTypeOptions = [
    {'label': 'Sale', 'value': 'sale'},
    {'label': 'Rent', 'value': 'rent'},
    {'label': 'Exchange', 'value': 'exchange'},
    {'label': 'Investment', 'value': 'investment'},
  ];

  final unitTypeOptions = [
    {'label': 'Apartment', 'value': 'apartment'},
    {'label': 'Villa', 'value': 'villa'},
    {'label': 'Land', 'value': 'land'},
    {'label': 'Office', 'value': 'office'},
    {'label': 'Shop', 'value': 'shop'},
  ];

  final result = await showModalBottomSheet<RequestsFilterResult>(
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
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0.r),
              ),
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
                            if (selectedStatus != null ||
                                selectedSpecialization != null ||
                                selectedDealType != null ||
                                selectedUnitType != null)
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedStatus = null;
                                    selectedSpecialization = null;
                                    selectedDealType = null;
                                    selectedUnitType = null;
                                  });
                                },
                                child: Text(
                                  'Clear All',
                                  style: AppStyles.primary14Medium,
                                ),
                              ),
                          ],
                        ),
                        Gap(24.h),
                        _buildFilterSection(
                          label: 'Request Status',
                          selectedValue: selectedStatus,
                          options: statusOptions,
                          onChanged: (value) {
                            setState(() => selectedStatus = value);
                          },
                        ),
                        Gap(16.h),
                        _buildFilterSection(
                          label: LangKeys.scopeOfSpecialization.tr(),
                          selectedValue: selectedSpecialization,
                          options: specializationOptions,
                          onChanged: (value) {
                            setState(() => selectedSpecialization = value);
                          },
                        ),
                        Gap(16.h),
                        _buildFilterSection(
                          label: LangKeys.dealType.tr(),
                          selectedValue: selectedDealType,
                          options: dealTypeOptions,
                          onChanged: (value) {
                            setState(() => selectedDealType = value);
                          },
                        ),
                        Gap(16.h),
                        _buildFilterSection(
                          label: LangKeys.unitType.tr(),
                          selectedValue: selectedUnitType,
                          options: unitTypeOptions,
                          onChanged: (value) {
                            setState(() => selectedUnitType = value);
                          },
                        ),
                        Gap(24.h),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedStatus = null;
                              selectedSpecialization = null;
                              selectedDealType = null;
                              selectedUnitType = null;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            side: BorderSide(color: AppColors.blueLight),
                          ),
                          child: Text(
                            'Clear',
                            style: AppStyles.black14Medium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                      Gap(12.w),
                      Expanded(
                        child: CustomButton(
                          text: 'Apply',
                          onPressed: () {
                            Navigator.pop(
                              context,
                              RequestsFilterResult(
                                status: selectedStatus,
                                specialization: selectedSpecialization,
                                dealType: selectedDealType,
                                unitType: selectedUnitType,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );

  return result;
}

Widget _buildFilterSection({
  required String label,
  required String? selectedValue,
  required List<Map<String, String>> options,
  required ValueChanged<String?> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppStyles.black14SemiBold),
      Gap(8.h),
      Container(
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: selectedValue != null
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
          value: selectedValue,
          hint: Text(
            'Select $label',
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
          items: options.map((item) {
            return DropdownMenuItem<String>(
              value: item['value'],
              child: Text(item['label']!),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ],
  );
}