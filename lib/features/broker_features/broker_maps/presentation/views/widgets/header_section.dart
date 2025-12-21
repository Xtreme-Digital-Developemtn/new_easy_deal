import 'package:easy_localization/easy_localization.dart';

import '../../../../../../main_imports.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.mapLocations.tr(),
          style: AppStyles.black20SemiBold,
        ),
        Gap(8.h),
        Text(
          LangKeys.tapAnyLocationToOpenInMapsApp.tr(),
          style:AppStyles.grayDark14Medium,
        ),
      ],
    );
  }
}
