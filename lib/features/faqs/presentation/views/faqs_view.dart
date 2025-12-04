import 'package:easy_deal/features/faqs/presentation/views/widgets/faqs_view_body.dart';
import 'package:easy_deal/main_imports.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:GlobalAppBar(title: LangKeys.faqs),
      body: FaqsViewBody(),
    );
  }
}
