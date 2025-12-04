import 'package:easy_deal/features/register/presentation/views/widgets/broker_type_widget/select_broker_type.dart';

import '../../../../../../main_imports.dart';

class BrokerTypeBody extends StatelessWidget {
  const BrokerTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectBrokerType(),
        Gap(MediaQuery.of(context).size.height*0.5),
        // SelectionGenderTypeButton(),
      ],
    );
  }
}
