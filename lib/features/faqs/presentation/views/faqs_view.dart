import 'package:easy_deal/features/faqs/presentation/views/widgets/faqs_view_body.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.faqs.tr()),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(SvgImages.arrow),
        ),
      ),
      body: FaqsViewBody(),
    );
  }
}
