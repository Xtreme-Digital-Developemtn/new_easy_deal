import '../../../../../main_imports.dart';
import '../../../data/config/ap_option_item.dart';
import '../../../data/config/ap_options.dart';

/// Multi-select dropdown with an "All the above are suitable" master checkbox.
/// Used for [otherAccessories] and [otherExpenses].
class ApMultiSelect extends StatefulWidget {
  const ApMultiSelect({
    super.key,
    required this.label,
    required this.hint,
    required this.options,
    required this.selectedValues,
    required this.onToggle,
    required this.onToggleAll,
  });

  final String label;
  final String hint;
  final List<ApOptionItem> options;
  final List<String> selectedValues;
  final ValueChanged<String> onToggle;
  final ValueChanged<bool> onToggleAll;

  @override
  State<ApMultiSelect> createState() => _ApMultiSelectState();
}

class _ApMultiSelectState extends State<ApMultiSelect> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;
    final allSelected = widget.options.isNotEmpty &&
        widget.options.every((o) => widget.selectedValues.contains(o.value));
    final summary = widget.selectedValues.isEmpty
        ? widget.hint
        : widget.options
            .where((o) => widget.selectedValues.contains(o.value))
            .map((o) => o.label(isArabic))
            .join('، ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppStyles.black14SemiBold),
        Gap(8.h),
        InkWell(
          onTap: () => setState(() => _open = !_open),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 52.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: widget.selectedValues.isNotEmpty
                    ? AppColors.primaryDark.withValues(alpha: 0.35)
                    : AppColors.blueLight,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    summary,
                    style: TextStyle(
                      color: widget.selectedValues.isEmpty ? const Color(0xFF969696) : AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  _open ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                  color: AppColors.primaryDark,
                  size: 24.sp,
                ),
              ],
            ),
          ),
        ),
        if (_open)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            padding: EdgeInsets.symmetric(vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.blueLight, width: 1.5),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
            ),
            child: Column(
              children: [
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.primaryDark,
                  value: allSelected,
                  onChanged: (v) => widget.onToggleAll(v ?? false),
                  title: Text(ApOptions.allTheAboveAreSuitable.label(isArabic), style: AppStyles.black14SemiBold),
                ),
                const Divider(height: 1),
                ...widget.options.map((o) {
                  final selected = widget.selectedValues.contains(o.value);
                  return CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: AppColors.primaryDark,
                    value: selected,
                    onChanged: (_) => widget.onToggle(o.value),
                    title: Text(o.label(isArabic), style: AppStyles.black14SemiBold),
                  );
                }),
              ],
            ),
          ),
      ],
    );
  }
}
