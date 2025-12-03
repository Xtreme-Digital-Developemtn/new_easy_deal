import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class ClientInfoForm extends StatelessWidget {
  const ClientInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                registerCubit.phoneNumber = number;
                registerCubit.updatePhone(number);
              },
              validator: (value)=> AppValidators.phoneValidator(registerCubit.phoneNumber),
            ),
            Gap(20.h),
            CustomTextFormField(
              validator: (value)=> AppValidators.displayNameValidator(registerCubit.nameCon.text),
              hintText: LangKeys.enterYourName.tr(),
              controller: registerCubit.nameCon,
              onChanged: (value) {
                registerCubit.updateName(value);
              },
            ),
          ],
        );
      },

    );
  }
}
