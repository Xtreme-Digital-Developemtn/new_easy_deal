import 'package:easy_localization/easy_localization.dart';

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
            if (available.isNotEmpty)
              ...available.map(
                    (item) =>    Padding(
                      padding:   EdgeInsets.symmetric(vertical: 6.h),
                      child: InkWell(
                        onTap: (){
                          onAddItem(item);
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(12.r),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal:20.w,vertical: 10.h),
                          decoration: BoxDecoration(
                            color: AppColors.blueLight,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item,style: AppStyles.primary16SemiBold,),
                              Icon(Icons.add, color: AppColors.primaryDark),
                            ],
                          ),
                        ),
                      ),
                    ),
              )
            else
              Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr()),

            Gap(20.h),
            Divider(),
            Gap(20.h),
            CustomTextFormField(
              controller: customController,
              hintText: LangKeys.addNewElement.tr(),
            ),
            Gap(16.h),
            CustomButton(
              text: LangKeys.add.tr(),
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