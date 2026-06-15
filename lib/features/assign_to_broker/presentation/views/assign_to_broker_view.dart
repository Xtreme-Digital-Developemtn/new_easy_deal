import 'package:easy_deal/features/assign_to_broker/presentation/view_model/assign_to_broker_cubit.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/assign_button.dart';
import 'package:easy_deal/features/assign_to_broker/presentation/views/widgets/brokers_list.dart';
import 'package:easy_deal/main_imports.dart';

class AssignToBrokerView extends StatefulWidget {
  const AssignToBrokerView({super.key});

  @override
  State<AssignToBrokerView> createState() => _AssignToBrokerViewState();
}

class _AssignToBrokerViewState extends State<AssignToBrokerView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final requestId = args?['requestId'] as int? ?? 0;
      final userId = CacheHelper.getData(key: "userId");
      final cubit = context.read<AssignToBrokerCubit>();
      cubit.setRequestId(requestId);
      cubit.setSenderId(userId is int ? userId : int.tryParse(userId.toString()) ?? 0);
      cubit.getRecommendedBrokers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.assignToBroker),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: AssignBrokersList(),
        ),
      ),
      bottomNavigationBar: AssignButton(),
    );
  }
}
