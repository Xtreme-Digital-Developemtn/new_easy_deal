import 'package:easy_deal/main_imports.dart';
import 'broker_categories.dart';

class BrokerMainSections extends StatelessWidget {
  const BrokerMainSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BrokerCategories(),
      ],
    );
  }
}
