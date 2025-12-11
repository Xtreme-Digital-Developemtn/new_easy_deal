import '../../../../../../main_imports.dart';

void openAddSheet({
  required String title,
  required BuildContext context,
  required List<String> available,
  required Function(String) onAddItem,
  required Function(String) onAddCustomItem,
}) {
  TextEditingController customController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20.w,
          right: 20.w,
          top: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: AppStyles.black16SemiBold),
            Gap(20.h),

            /// ---- العناصر المتاحة ----
            if (available.isNotEmpty)
              ...available.map(
                    (item) => ListTile(
                  title: Text(item),
                  trailing: Icon(Icons.add, color: AppColors.primaryDark),
                  onTap: () {
                    onAddItem(item);
                    Navigator.pop(context);
                  },
                ),
              )
            else
              Text("لا توجد عناصر متاحة"),

            Gap(20.h),
            Divider(),
            Gap(20.h),

            /// ---- إضافة عنصر مخصص ----
            TextField(
              controller: customController,
              decoration: InputDecoration(
                hintText: "إضافة عنصر جديد",
                border: OutlineInputBorder(),
              ),
            ),
            Gap(16.h),
            CustomButton(
              text: "إضافة",
              onPressed: () {
                if (customController.text.trim().isNotEmpty) {
                  onAddCustomItem(customController.text.trim());
                  Navigator.pop(context);
                }
              },
            ),
            Gap(20.h),
          ],
        ),
      );
    },
  );
}