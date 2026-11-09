import 'package:easy_deal/core/shared_widgets/general_bottom_sheet.dart';
import 'package:easy_deal/core/shared_widgets/units_expandable_line.dart';

import '../../../../../main_imports.dart';

/// عنصر واحد في الخلية: اسم التخصص (أو التخصص الفرعي) والوحدات اللي جواه
class MultiValueItem {
  const MultiValueItem({required this.label, this.units = const []});

  final String label;

  /// أنواع الوحدات اللي التخصص ده بيغطيها، مترجمة
  final List<String> units;
}

/// خلية جدول بتعرض أول قيمة بس (التخصص / التخصص الفرعي) وجانبها عدد الباقي،
/// وبالضغط عليها يفتح بوتوم شيت فيه كل القيم منفصلة - عشان الجدول يفضل مضغوط
/// ومايبقاش فيه نص طويل متلصق بـ " - ".
class MultiValuesCell extends StatelessWidget {
  const MultiValuesCell({
    super.key,
    required this.values,
    required this.title,
    this.subtitle,
  });

  /// العناصر بعد الترجمة، أي عنصر اسمه فاضي بيتشال جوه الويدجت نفسها
  final List<MultiValueItem> values;

  /// عنوان الشيت، زي "التخصص" أو "التخصص الفرعي"
  final String title;

  /// سطر صغير تحت العنوان في الشيت، عادة اسم الوسيط
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final items = values
        .where((e) => e.label.trim().isNotEmpty)
        .toList();

    if (items.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        child: Text(
          '-',
          textAlign: TextAlign.center,
          style: AppStyles.black12Medium.copyWith(
            fontSize: 10.sp,
            color: AppColors.gray,
          ),
        ),
      );
    }

    final remaining = items.length - 1;
    // الشيت بيتفتح كمان لو تخصص واحد بس وله وحدات نعرضها
    final hasMore = remaining > 0;
    final canOpenSheet = hasMore || items.first.units.isNotEmpty;

    return InkWell(
      onTap: canOpenSheet
          ? () => MultiValuesSheet.show(
              context: context,
              title: title,
              subtitle: subtitle,
              values: items,
            )
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // أول تخصص بيظهر كامل وواضح: بيلف على أكتر من سطر لو طويل
            Flexible(
              child: Text(
                items.first.label,
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppStyles.black12Medium.copyWith(
                  fontSize: 11.sp,
                  height: 1.3,
                ),
              ),
            ),
            if (canOpenSheet) ...[
              Gap(4.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasMore)
                      Text(
                        '+$remaining',
                        style: AppStyles.black12Medium.copyWith(
                          fontSize: 9.sp,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 12.sp,
                      color: AppColors.primaryDark,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// بوتوم شيت بيعرض القيم كلها منفصلة كل واحدة في سطر
class MultiValuesSheet extends StatelessWidget {
  const MultiValuesSheet({
    super.key,
    required this.title,
    required this.values,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final List<MultiValueItem> values;

  static Future<void> show({
    required BuildContext context,
    required String title,
    required List<MultiValueItem> values,
    String? subtitle,
  }) {
    return StandardBottomSheet.show<void>(
      context: context,
      isScrollControlled: true,
      child: MultiValuesSheet(
        title: title,
        values: values,
        subtitle: subtitle,
      ),
    ).then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Container(
                width: 44.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.grayLightest,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppStyles.black16SemiBold),
                        if (subtitle != null && subtitle!.trim().isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              subtitle!,
                              style: AppStyles.black12Medium.copyWith(
                                color: AppColors.gray,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, size: 20.sp),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xffEEEEEE)),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
                itemCount: values.length,
                separatorBuilder: (_, __) => Gap(8.h),
                itemBuilder: (context, index) {
                  final item = values[index];
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 6.w,
                              height: 6.w,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryDark,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Gap(8.w),
                            Expanded(
                              child: Text(
                                item.label,
                                style: AppStyles.black14Medium,
                              ),
                            ),
                          ],
                        ),
                        // الوحدات اللي التخصص ده بيغطيها، بتتمدد وتتقفل
                        if (item.units.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: 6.h, right: 14.w, left: 14.w),
                            child: UnitsExpandableLine(units: item.units),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
