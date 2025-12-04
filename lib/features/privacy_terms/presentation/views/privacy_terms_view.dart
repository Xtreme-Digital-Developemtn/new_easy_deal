import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class PrivacyTermsView extends StatelessWidget {
  const PrivacyTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.privacyAndTerms),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.whoWeAre.tr(),style: AppStyles.black16SemiBold,),
            Gap(20.h),
            Text("text"*100),
          ],
        ),
      ),
    );
  }
}
