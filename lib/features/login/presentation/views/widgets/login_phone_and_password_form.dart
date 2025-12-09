import 'package:easy_deal/core/shared_widgets/phone_widget.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';



class LoginPhoneAndPasswordForm extends StatelessWidget {
  const LoginPhoneAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit , LoginStates>(
      buildWhen: (previous, current){
        return current is ChangePasswordVisibleState;
      },
      builder: (context,state){
        var loginCubit = context.read<LoginCubit>();
        return Column(
          children: [
            /// Phone Number
            PhoneWidget(controller: loginCubit.phoneCon,
              onPhoneChanged: (v) {
                loginCubit.phoneNumber = v;
                loginCubit.validateForm();
              },
            ),
            Gap(20.h),
            /// Password Field
            CustomTextFormField(

              controller: loginCubit.passwordCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LangKeys.password.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.lock,),
              ),
              suffixIcon: IconButton(
                color: AppColors.gray,
                icon: SvgPicture.asset(loginCubit.isPasswordVisible ? SvgImages.eye : SvgImages.openEye),
                onPressed: loginCubit.changePasswordVisible,
              ),
              obscureText: loginCubit.isPasswordVisible,
              onChanged: (_) => loginCubit.validateForm(),
              validator: (String? value) {
                return AppValidators.passwordValidator(value);

              },
            ),
          ],
        );
      },

    );
  }
}
