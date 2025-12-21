import 'package:easy_deal/features/broker_features/broker_maps/presentation/views/widgets/header_section.dart';
import 'package:easy_deal/features/broker_features/broker_maps/presentation/views/widgets/locations_grid_view.dart';
import '../../../../../main_imports.dart';

class BrokerMapsView extends StatelessWidget {
  const BrokerMapsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.maps),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            Gap(12.h),
            Expanded(
              child: LocationsGridView(),
            ),
          ],
        ),
      ),
    );
  }




}


