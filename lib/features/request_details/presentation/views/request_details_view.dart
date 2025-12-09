import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.language.tr()),
    );
  }
}
