import 'package:easy_deal/features/broker_features/broker_ads/presentation/views/widgets/ads_table_widget.dart';
import '../../../../../main_imports.dart';

class BrokerAdsView extends StatelessWidget {
  const BrokerAdsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.myAds),
      body: Column(
        children: [
          Expanded(child: AdsTableWidget()),
        ],
      ),
    );
  }
}
