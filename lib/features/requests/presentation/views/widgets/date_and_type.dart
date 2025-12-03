import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class DateAndType extends StatelessWidget {
  const DateAndType({super.key, required this.date, required this.type});
  final DateTime date;
  final String type;
  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        SvgPicture.asset(SvgImages.calendar,colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),),
        Gap(8.w),
        Text(
          DateFormat('yyyy-MM-dd').format(date),
          style: AppStyles.black14Medium,
        ),
        Gap(16.w),
        Text(
          type,
          style: AppStyles.primary14Medium,
        ),
      ],
    );
  }
}
