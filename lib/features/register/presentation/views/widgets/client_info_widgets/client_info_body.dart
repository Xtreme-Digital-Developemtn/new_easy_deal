import 'package:easy_deal/features/register/presentation/views/widgets/client_info_widgets/send_code_button.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../view_model/register_cubit.dart';
import 'client_info_form.dart';

class ClientInfoBody extends StatelessWidget {
  const ClientInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return Form(
      key: registerCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LangKeys.completeProfileInfo.tr(), style: AppStyles.black16SemiBold),
          Gap(24.h),
          ClientInfoForm(),
          Gap(24.h),
          SendCodeButton(formKey: registerCubit.formKey),
        ],
      ),
    );
  }
}

