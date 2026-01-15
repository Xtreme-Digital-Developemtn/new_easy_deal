import 'package:easy_deal/features/faqs/presentation/view_model/faqs_cubit.dart';
import 'package:easy_deal/features/faqs/presentation/views/widgets/faqs_view_body.dart';
import 'package:easy_deal/main_imports.dart';

import '../../../../core/app_services/remote_services/service_locator.dart';
import '../../data/repos/faqs_repo_imple.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:GlobalAppBar(title: LangKeys.faqs),
      body: BlocProvider(
          create: (context) => FAQsCubit(getIt.get<FAQsRepoImpl>())..getAllFaqs(),
          child: FaqsViewBody()),
    );
  }
}
