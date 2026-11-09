import 'package:easy_localization/easy_localization.dart';

import '../../main_imports.dart';

/// سطر صغير بيعرض وحدات التخصص: بيبان منه أول كام وحدة وجانبها عدد الباقي،
/// وبالضغط يتمدد ويعرض كل الوحدات كشيبس صغيرة، وبالضغط تاني يتقفل.
class UnitsExpandableLine extends StatefulWidget {
  const UnitsExpandableLine({
    super.key,
    required this.units,
    this.collapsedCount = 3,
    this.label,
  });

  /// أسماء الوحدات مترجمة
  final List<String> units;

  /// عدد الوحدات اللي تبان وهو مقفول
  final int collapsedCount;

  /// عنوان السطر، الافتراضي "الوحدات"
  final String? label;

  @override
  State<UnitsExpandableLine> createState() => _UnitsExpandableLineState();
}

class _UnitsExpandableLineState extends State<UnitsExpandableLine> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final units = widget.units
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    if (units.isEmpty) return const SizedBox.shrink();

    final label = widget.label ?? LangKeys.unitsIncluded.tr();
    final hidden = units.length - widget.collapsedCount;
    final canExpand = hidden > 0;
    final visible = _expanded || !canExpand
        ? units
        : units.take(widget.collapsedCount).toList();

    return InkWell(
      onTap: canExpand ? () => setState(() => _expanded = !_expanded) : null,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.home_work_outlined,
                  size: 13.sp,
                  color: AppColors.gray,
                ),
                Gap(4.w),
                Text(
                  label,
                  style: AppStyles.black12Medium.copyWith(
                    color: AppColors.gray,
                  ),
                ),
                if (canExpand) ...[
                  Gap(4.w),
                  Text(
                    _expanded ? '' : '+$hidden',
                    style: AppStyles.black12Medium.copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 16.sp,
                    color: AppColors.primaryDark,
                  ),
                ],
              ],
            ),
            Gap(4.h),
            AnimatedSize(
              duration: const Duration(milliseconds: 180),
              alignment: Alignment.topCenter,
              child: Wrap(
                spacing: 6.w,
                runSpacing: 6.h,
                children: visible
                    .map(
                      (unit) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.grayLightest.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          unit,
                          style: AppStyles.black12Medium.copyWith(
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
