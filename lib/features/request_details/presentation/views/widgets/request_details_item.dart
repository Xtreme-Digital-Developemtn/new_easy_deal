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
          children: [
            Text("${title.tr()} : "),
            Gap(24.w),
            Text("150"),
          ],
        ),
        if(!isLast)
        Gap(12.h),
      ],
    );
  }
}
