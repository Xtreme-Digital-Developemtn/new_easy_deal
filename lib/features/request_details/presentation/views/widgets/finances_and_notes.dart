import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class FinancesAndNotes extends StatelessWidget {
  const FinancesAndNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.money,color: AppColors.primaryDark,),
            Gap(12.w),
            Text(LangKeys.financesAndNotes.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: RequestDetailsItem(title: LangKeys.requiredPaymentSystem, value: "100",isLast: true,),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
