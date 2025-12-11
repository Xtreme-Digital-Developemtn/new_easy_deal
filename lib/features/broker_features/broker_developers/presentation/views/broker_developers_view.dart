import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developers_table_data.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerDevelopersView extends StatelessWidget {
  const BrokerDevelopersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.developers.tr()),
      body: Column(
        children: [
          Expanded(child: DevelopersTableData()),
        ],
      ),
    );
  }
}
