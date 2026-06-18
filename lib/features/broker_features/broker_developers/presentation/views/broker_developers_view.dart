import 'package:easy_deal/features/broker_features/broker_developers/presentation/views/widgets/developers_table_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import '../view_model/broker_developers_cubit.dart';
import '../view_model/broker_developers_states.dart';

class BrokerDevelopersView extends StatefulWidget {
  const BrokerDevelopersView({super.key});
  @override
  State<BrokerDevelopersView> createState() => _BrokerDevelopersViewState();
}

class _BrokerDevelopersViewState extends State<BrokerDevelopersView> {
  @override
  void initState() {
    super.initState();
    context.read<BrokerDevelopersCubit>().getDevelopers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.developers),
      body: BlocBuilder<BrokerDevelopersCubit, BrokerDevelopersStates>(
        builder: (context, state) {
          if (state is GetDevelopersLoadingState) {
            return const CustomLoading();
          } else if (state is GetDevelopersErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.error),
                  Gap(16.h),
                  CustomButton(
                    text: LangKeys.reload,
                    onPressed: () {
                      context.read<BrokerDevelopersCubit>().getDevelopers();
                    },
                  ),
                ],
              ),
            );
          } else if (state is GetDevelopersSuccessState) {
            var data = state.developersModel?.data ?? [];
            if (data.isEmpty) {
              return Center(
                child: Text(LangKeys.thereAreNoItemsCurrentlyAvailable.tr()),
              );
            }
            return DevelopersTableData(data: data);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}