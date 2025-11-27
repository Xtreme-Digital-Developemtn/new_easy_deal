import 'package:easy_deal/features/login/presentation/view_model/login_cubit.dart';
import 'package:easy_deal/features/login/presentation/view_model/login_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';


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
            IntlPhoneField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: LangKeys.phoneNumber.tr(),
                labelStyle: const TextStyle(color: AppColors.gray),
                contentPadding:   EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
                filled: true,
                fillColor: AppColors.white,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(150, 150, 150, 1),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(SvgImages.mobile,
                    colorFilter: ColorFilter.mode(AppColors.primaryDark,
                        BlendMode.srcIn),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.blueLight),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.blueLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.blueLight),
                ),
              ),
              initialCountryCode: 'EG',
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (PhoneNumber phone) {
                String number = phone.number ;
                if (number.isNotEmpty && !number.startsWith('0')) {
                  number = '0$number';
                }
                loginCubit.phoneNumber = number;
                loginCubit.validateFields();
              },
              validator: (value)=> AppValidators.phoneValidator(loginCubit.phoneNumber),
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
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return LangKeys.passwordValidate.tr();
              //   }
              //   return null;
              // },
              validator: (String? value) {
                loginCubit.validateFields();
                return AppValidators.passwordValidator(value);

              },
            ),
          ],
        );
      },

    );
  }
}
