import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

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
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.black16SemiBold),
        Gap(12.h),
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
            : Center(child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr(), style: AppStyles.gray12Medium)),

        Gap(20.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LangKeys.addElement.tr(), style: AppStyles.gray14Medium),
            IconButton(
              onPressed: () {
                openAddSheet(
                  title: "${LangKeys.add.tr()} $title",
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
