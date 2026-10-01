import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class RequestDetailsItem extends StatelessWidget {
  const RequestDetailsItem({super.key, required this.title, required this.value,   this.isLast = false});
  final String title;
  final String value;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${title.tr()} : "),
            Gap(12.w),
            // القيمة ممكن تطول (أكتر من منطقة مثلاً) فلازم تاخد الباقي وتلفّ
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        if(!isLast)
        Gap(12.h),
      ],
    );
  }
}
