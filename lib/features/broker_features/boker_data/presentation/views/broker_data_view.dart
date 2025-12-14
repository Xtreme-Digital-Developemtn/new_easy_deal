import 'package:easy_deal/features/broker_features/boker_data/presentation/views/widgets/data_table_widget.dart';
import '../../../../../main_imports.dart';

class BrokerDataView extends StatelessWidget {
  const BrokerDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.developers),
      body: Column(
        children: [
          Expanded(child: DataTableWidget()),
        ],
      ),
    );
  }
}
