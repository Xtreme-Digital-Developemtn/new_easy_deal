import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class RememberMeAndForgetPassword extends StatelessWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LoginCubit, LoginStates>(
          buildWhen: (previous, current) {
            return current is ChangeRememberValueState;
          },
          builder: (context, state) {
            final loginCubit = context.read<LoginCubit>();
            final currentValue = state is ChangeRememberValueState
                ? state.value
                : loginCubit.rememberMe;

            return Checkbox(
              value: currentValue,
              onChanged: (v) {
                context.read<LoginCubit>().changeRememberMeValue(v ?? false);
              },
              side: BorderSide(color: AppColors.primaryDark),
              activeColor: AppColors.primaryDark,
            );
          },
        ),
        Text(LangKeys.rememberMe.tr(), style: AppStyles.primary14Medium),
        const Spacer(),
        InkWell(
          onTap: () {
            // context.pushNamed(Routes.forgotpasswordScreen);
          },
          child: Text(
            LangKeys.forgotPassword.tr(),
            style: AppStyles.black14Medium,
          ),
        ),
      ],
    );
  }
}
