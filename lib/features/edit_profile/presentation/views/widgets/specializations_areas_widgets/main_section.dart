import 'package:easy_deal/main_imports.dart';

import 'add_bottom_sheet.dart';
import 'chip_item.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key, required this.title, required this.currentItems, required this.availableItems, required this.onAddItem, required this.onRemoveItem, required this.onAddCustomItem});
  final String title;
  final List<String> currentItems;
  final List<String> availableItems;
  final Function(String) onAddItem;
      final Function(String) onRemoveItem;
      final Function(String) onAddCustomItem;
  @override
  Widget build(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.primary16SemiBold),
        Gap(12.h),

        /// ---- القائمة الحالية ----
        currentItems.isNotEmpty
            ? Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: currentItems
              .map((e) => ChipItem(
            text: e,
            onRemove: () => onRemoveItem(e),
          ))
              .toList(),
        )
            : Text("لا توجد عناصر حالياً", style: AppStyles.gray12Medium),

        Gap(20.h),

        /// ---- زر الإضافة ----
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("إضافة عنصر:", style: AppStyles.gray14Medium),
            IconButton(
              onPressed: () {
                openAddSheet(
                  title: "إضافة $title",
                  available: availableItems,
                  onAddItem: onAddItem,
                  onAddCustomItem: onAddCustomItem,
                  context: context
                );
              },
              icon: Icon(Icons.add_circle_outline,
                  size: 26.r, color: AppColors.primaryDark),
            ),
          ],
        ),
      ],
    );
  }
}
