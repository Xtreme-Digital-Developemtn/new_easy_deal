import 'package:easy_deal/features/request_details/presentation/views/widgets/request_details_item.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key, required this.typeOfOperation, required this.scopeOfSpecialization, required this.unitType});
  final String typeOfOperation;
  final String scopeOfSpecialization;
  final String unitType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Icon(Icons.question_mark,color: AppColors.primaryDark,),
            Gap(12.w),
            Text(LangKeys.basicInformation.tr()),
          ],
        ),
        Gap(6.h),
        Card(
          color: AppColors.white,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                RequestDetailsItem(title: LangKeys.typeOfOperation, value: typeOfOperation),
                RequestDetailsItem(title: LangKeys.scopeOfSpecialization, value: scopeOfSpecialization),
                RequestDetailsItem(title: LangKeys.unitType, value: unitType,isLast: true,),
              ],
            ),
          ),
        ),
        Gap(12.h),
      ],
    );
  }
}
