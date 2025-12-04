import 'package:easy_deal/features/register/presentation/views/widgets/account_type_widgets/select_account_type.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/account_type_widgets/selection_account_type_button.dart';
import 'package:easy_deal/main_imports.dart';

class AccountTypeBody extends StatelessWidget {
  const AccountTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectAccountType(),
        Gap(MediaQuery.of(context).size.height*0.5),
        SelectionAccountTypeButton(),
      ],
    );
  }
}
