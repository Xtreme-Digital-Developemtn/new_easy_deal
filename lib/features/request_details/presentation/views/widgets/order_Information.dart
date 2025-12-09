import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.info,color: AppColors.primaryDark,),
            Gap(12.w),
            Text(LangKeys.orderInformation.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: RequestDetailsItem(title: LangKeys.dateOfCreation, value: "100",isLast: true,),
          ),
        ),
      ],
    );
  }
}
