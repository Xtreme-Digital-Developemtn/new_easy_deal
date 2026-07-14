import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/broker_text_helper.dart';
import '../../../../../../main_imports.dart';

class BrokerDataFilterResult {
  final String? unitType;
  final String? compoundType;
  final String? operation;

  const BrokerDataFilterResult({this.unitType, this.compoundType, this.operation});

  bool get hasFilters => unitType != null || compoundType != null || operation != null;
}

final _operationOptions = ['purchasing', 'sell'];

final _compoundOptions = [
  'INSIDE_COMPOUND',
  'OUTSIDE_COMPOUND',
  'PRIMARY_INSIDE_COMPOUND',
  'RESALE_INSIDE_COMPOUND',
  'RENTALS_OUTSIDE_COMPOUND',
  'RENTALS_INSIDE_COMPOUND',
  'village',
];

final _unitTypeOptions = [
  'apartments',
  'duplexes',
  'penthouses',
  'studios',
  'roofs',
  'basements',
  'villas',
  'chalets',
  'residential_buildings',
  'i_villa',
  'twin_houses',
  'town_houses',
  'standalone_villas',
  'administrative_units',
  'medical_clinics',
  'commercial_stores',
  'commercial_administrative_buildings',
  'commercial_administrative_lands',
  'residential_lands',
  'factory_lands',
  'warehouse_lands',
  'vacation_villa',
  'hotels',
];

Future<BrokerDataFilterResult?> showBrokerDataFilterSheet(
  BuildContext context,
  BrokerDataFilterResult? currentFilters,
) async {
  var selectedUnitType = currentFilters?.unitType;
  var selectedCompoundType = currentFilters?.compoundType;
  var selectedOperation = currentFilters?.operation;

  return showModalBottomSheet<BrokerDataFilterResult>(
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0.r)),
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
                            Text(LangKeys.filter.tr(), style: AppStyles.black20Bold),
                            if (selectedUnitType != null ||
                                selectedCompoundType != null ||
                                selectedOperation != null)
                              InkWell(
                                onTap: () => setState(() {
                                  selectedUnitType = null;
                                  selectedCompoundType = null;
                                  selectedOperation = null;
                                }),
                                child: Text(LangKeys.clearAll.tr(), style: AppStyles.primary14Medium),
                              ),
                          ],
                        ),
                        Gap(24.h),
                        _buildDropdown(
                          label: LangKeys.unitType.tr(),
                          value: selectedUnitType,
                          items: _unitTypeOptions,
                          displayFn: (v) => v.tr(),
                          onChanged: (v) => setState(() => selectedUnitType = v),
                        ),
                        Gap(16.h),
                        _buildDropdown(
                          label: LangKeys.compoundType.tr(),
                          value: selectedCompoundType,
                          items: _compoundOptions,
                          displayFn: (v) => BrokerTextHelper.projectTypeText(v),
                          onChanged: (v) => setState(() => selectedCompoundType = v),
                        ),
                        Gap(16.h),
                        _buildDropdown(
                          label: LangKeys.operationType.tr(),
                          value: selectedOperation,
                          items: _operationOptions,
                          displayFn: (v) => v.tr(),
                          onChanged: (v) => setState(() => selectedOperation = v),
                        ),
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
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: LangKeys.apply.tr(),
                        onPressed: () {
                          final result = BrokerDataFilterResult(
                            unitType: selectedUnitType,
                            compoundType: selectedCompoundType,
                            operation: selectedOperation,
                          );
                          Navigator.pop(context, result.hasFilters ? result : null);
                        },
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
                  Text(LangKeys.clearSelection.tr(), style: AppStyles.primary14Medium),
                  Gap(4.w),
                  Icon(Icons.close, size: 16.sp, color: AppColors.primaryDark),
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
            hint: Text(LangKeys.selectAll.tr(), style: AppStyles.black14Medium),
            items: [
              DropdownMenuItem<String>(
                value: null,
                child: Text(LangKeys.clearSelection.tr(), style: AppStyles.black14Medium),
              ),
              ...items.map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(displayFn(item), style: AppStyles.black14Medium),
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
