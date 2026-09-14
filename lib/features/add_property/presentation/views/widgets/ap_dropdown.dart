import '../../../../../main_imports.dart';
import '../../../data/config/ap_option_item.dart';

/// Reusable labeled dropdown used across the add-property steps.
class ApDropdown extends StatefulWidget {
  const ApDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    this.required = false,
    this.error,
    this.enabled = true,
    this.disabledHint,
  });

  final String label;
  final String hint;
  final List<ApOptionItem> options;
  final String? selectedValue;
  final ValueChanged<String> onSelected;
  final bool required;
  final String? error;
  final bool enabled;
  final String? disabledHint;

  @override
  State<ApDropdown> createState() => _ApDropdownState();
}

class _ApDropdownState extends State<ApDropdown> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;
    final selected = widget.options.where((o) => o.value == widget.selectedValue);
    final hasValue = selected.isNotEmpty;
    final displayText = hasValue ? selected.first.label(isArabic) : widget.hint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(text: widget.label, required: widget.required),
        Gap(8.h),
        InkWell(
          onTap: widget.enabled ? () => setState(() => _open = !_open) : null,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 52.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: widget.enabled ? AppColors.white : Colors.grey[100],
              border: Border.all(
                color: widget.error != null
                    ? Colors.red
                    : hasValue
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
                    widget.enabled ? displayText : (widget.disabledHint ?? widget.hint),
                    style: TextStyle(
                      color: hasValue ? AppColors.black : const Color(0xFF969696),
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
        if (_open && widget.enabled)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.blueLight, width: 1.5),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
            ),
            child: Column(
              children: widget.options.map((o) {
                final isSelected = o.value == widget.selectedValue;
                return InkWell(
                  onTap: () {
                    widget.onSelected(o.value);
                    setState(() => _open = false);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    color: isSelected ? AppColors.primaryDark.withValues(alpha: 0.08) : null,
                    child: Text(
                      o.label(isArabic),
                      style: AppStyles.black14SemiBold.copyWith(
                        color: isSelected ? AppColors.primaryDark : AppColors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        if (widget.error != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(widget.error!, style: TextStyle(color: Colors.red, fontSize: 12.sp)),
          ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({required this.text, required this.required});
  final String text;
  final bool required;

  @override
  Widget build(BuildContext context) {
    if (!required) return Text(text, style: AppStyles.black14SemiBold);
    return Text.rich(
      TextSpan(
        text: text,
        style: AppStyles.black14SemiBold,
        children: [TextSpan(text: ' *', style: AppStyles.black14SemiBold.copyWith(color: Colors.red))],
      ),
    );
  }
}
