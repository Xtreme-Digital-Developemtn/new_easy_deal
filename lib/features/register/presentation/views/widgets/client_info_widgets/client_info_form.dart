import 'package:easy_deal/core/shared_widgets/phone_widget.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ClientInfoForm extends StatelessWidget {
  const ClientInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        final registerCubit = context.read<RegisterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Phone Number
            PhoneWidget(
              controller: registerCubit.phoneCon,
              onPhoneChanged: (v) {
                registerCubit.phoneNumber = v;
                registerCubit.validateForm();
              },
            ),
            Gap(20.h),
            CustomTextFormField(
              validator: (value) =>
                  AppValidators.displayNameValidator(registerCubit.nameCon.text),
              hintText:  registerCubit.selectBrokerIndex ==2 ?  LangKeys.enterCompanyName.tr() : LangKeys.enterYourName.tr(),
              controller: registerCubit.nameCon,
              onChanged: (_) => registerCubit.onUserInteraction(),

              // onChanged: (_) => registerCubit.validateForm(),
            ),
            
          ],
        );
      },
    );
  }
}