import 'package:easy_localization/easy_localization.dart';
import '../../../../../main_imports.dart';

class RequestsFilterResult {
  final String? status;
  final String? type;
  final String? specializationScope;
  const RequestsFilterResult({
    this.status,
    this.type,
    this.specializationScope,
  });

  bool get hasFilters =>
      status != null || type != null || specializationScope != null;

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};
    if (status != null) params['status'] = status;
    if (type != null) params['type'] = type;
    if (specializationScope != null) {
      params['specializationScope'] = specializationScope;
    }
    return params;
  }
}

final _statusOptions = [
  'new',
  'in_processing',
  'finished',
];

final _typeOptions = [
  'sell',
  'purchasing',
  'rent_out',
  'rent_in',
];

final _specializationScopeOptions = [
  'purchase_sell_outside_compound',
  'primary_inside_compound',
  'resale_inside_compound',
  'rentals_outside_compound',
  'rentals_inside_compound',
];

Future<RequestsFilterResult?> showRequestsFilterSheet(
  BuildContext context,
  RequestsFilterResult? currentFilters,
) async {
  var selectedStatus = currentFilters?.status;
  var selectedType = currentFilters?.type;
  var selectedScope = currentFilters?.specializationScope;

  return showModalBottomSheet<RequestsFilterResult>(
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
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20.0.r)),
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
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          20.h,
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
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(LangKeys.filter.tr(),
                                style: AppStyles.black20Bold),
                            if (currentFilters != null &&
                                currentFilters.hasFilters)
                              InkWell(
                                onTap: () => setState(() {
                                  selectedStatus = null;
                                  selectedType = null;
                                  selectedScope = null;
                                }),
                                child: Text(LangKeys.clearAll.tr(),
                                    style: AppStyles.primary14Medium),
                              ),
                          ],
                        ),
                        Gap(24.h),

                        _buildDropdown(
                          label: 'حالة الطلب',
                          value: selectedStatus,
                          items: _statusOptions,
                          displayFn: _statusText,
                          onChanged: (v) =>
                              setState(() => selectedStatus = v),
                        ),
                        Gap(16.h),

                        _buildDropdown(
                          label: LangKeys.dealType.tr(),
                          value: selectedType,
                          items: _typeOptions,
                          displayFn: _typeText,
                          onChanged: (v) =>
                              setState(() => selectedType = v),
                        ),
                        Gap(16.h),

                        _buildDropdown(
                          label: LangKeys.scopeOfSpecialization.tr(),
                          value: selectedScope,
                          items: _specializationScopeOptions,
                          displayFn: _scopeText,
                          onChanged: (v) =>
                              setState(() => selectedScope = v),
                        ),
                        Gap(16.h),

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
                        color:
                            Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'إعادة تعيين',
                              gradientColors: false,
                              color: Colors.white,
                              textColor: AppColors.primaryDark,
                              borderColor: BorderSide(
                                  color: AppColors.primaryDark),
                              onPressed: () =>
                                  Navigator.pop(context, null),
                            ),
                          ),
                          Gap(12.w),
                          Expanded(
                            child: CustomButton(
                              text: LangKeys.apply.tr(),
                              onPressed: () {
                                final result = RequestsFilterResult(
                                  status: selectedStatus,
                                  type: selectedType,
                                  specializationScope: selectedScope,
                                );
                                Navigator.pop(context,
                                    result.hasFilters ? result : null);
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

Widget _buildDropdown({
  required String label,
  required String? value,
  required List<String> items,
  required String Function(String) displayFn,
  required void Function(String?) onChanged,
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
                  Text(LangKeys.clearSelection.tr(),
                      style: AppStyles.primary14Medium),
                  Gap(4.w),
                  Icon(Icons.close,
                      size: 16.sp, color: AppColors.primaryDark),
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
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            hint: Text(LangKeys.selectAll.tr(),
                style: AppStyles.black14Medium),
            items: [
              DropdownMenuItem<String>(
                value: null,
                child: Text(LangKeys.clearSelection.tr(),
                    style: AppStyles.black14Medium),
              ),
              ...items.map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(displayFn(item),
                      style: AppStyles.black14Medium),
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

String _statusText(String value) {
  switch (value) {
    case 'new':
      return 'جديد';
    case 'in_processing':
      return 'قيد المعالجة';
    case 'finished':
      return 'منتهي';
    default:
      return value;
  }
}

String _typeText(String value) {
  switch (value) {
    case 'sell':
      return 'بيع';
    case 'purchasing':
      return 'شراء';
    case 'rent_out':
      return 'تأجير';
    case 'rent_in':
      return 'استئجار';
    default:
      return value;
  }
}

String _scopeText(String value) {
  switch (value) {
    case 'purchase_sell_outside_compound':
      return 'بيع وشراء خارج كمبوند';
    case 'primary_inside_compound':
      return 'بيع أولي داخل كمبوند';
    case 'resale_inside_compound':
      return 'بيع ثانوي داخل كمبوند';
    case 'rentals_outside_compound':
      return 'إيجارات خارج كمبوند';
    case 'rentals_inside_compound':
      return 'إيجارات داخل كمبوند';
    default:
      return value;
  }
}
