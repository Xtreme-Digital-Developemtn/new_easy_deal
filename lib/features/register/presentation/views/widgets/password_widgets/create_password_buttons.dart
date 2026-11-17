import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/layout/presentation/view_model/layout_cubit.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';

class CreatePasswordButtons extends StatelessWidget {
  const CreatePasswordButtons({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          // نفس حالة تسجيل الدخول: البروفايل العام لازم يتحمّل بهوية
          // الأكونت الجديد قبل الانتقال للاي أوت.
          context.read<ProfileCubit>().loadCurrentUser();
          LayoutCubit.pageIndex = 0;
          context.pushNamedAndRemoveUntil(Routes.layoutView);
          Toast.showSuccessToast(
            msg: state.registerModel.message.toString(),
            context: context,
          );
        } else if (state is SignUpError) {
          Toast.showErrorToast(msg: state.message.toString(), context: context);
        }
      },
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        if (state is SignUpLoading) {
          return const CustomLoading();
        }
        return CustomButton(
          onPressed: () {
            if (!(formKey.currentState?.validate() ?? false)) return;
            if (registerCubit.role == "broker") {
              context.pushNamed(
                Routes.uploadBrokerDocView,
                arguments: {
                  "selectIndex": registerCubit.selectBrokerIndex,
                  "gender": registerCubit.gender,
                  "role": registerCubit.role,
                  "name": registerCubit.nameCon.text,
                  "email": registerCubit.emailCon.text,
                  "password": registerCubit.passwordCon.text,
                  "confirmPassword": registerCubit.confirmPasswordCon.text,
                  "phone": registerCubit.phoneCon.text,
                },
              );
            } else {
              registerCubit.register(
                fullName: registerCubit.nameCon.text,
                phone: registerCubit.phoneCon.text,
                password: registerCubit.passwordCon.text,
                passwordConfirmation: registerCubit.confirmPasswordCon.text,
                gender: registerCubit.gender ?? '',
                email: registerCubit.emailCon.text,
                image: null,
                brokerTypeIndex: registerCubit.selectBrokerIndex,
              );
            }
          },
          text: LangKeys.next.tr(),
        );
      },
    );
  }
}