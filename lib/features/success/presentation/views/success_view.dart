import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.name, required this.email, required this.password, required this.confirmPassword, required this.gender, required this.role, required this.phone});
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String role;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.success.tr()),
      ),
      body: Padding(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            Image.asset(PngImages.success,height: 300.h,width: 300.w,fit: BoxFit.cover,),
            Gap(12.h),
            Text("تم تفعيل حسابك بنجاح اضغط هنا لتكملة انشاء الحساب",textAlign: TextAlign.center,
            style: AppStyles.black16Medium,),
            Spacer(),
            BlocConsumer<RegisterCubit , RegisterStates>(
              listener: (context,state){
                if(state is SignUpSuccess){
                  context.pushNamedAndRemoveUntil(Routes.layoutView);
                  Toast.showSuccessToast(msg: state.registerModel.message.toString(), context: context);
                }
                else if (state is SignUpError){
                  Toast.showErrorToast(msg: state.message.toString(), context: context);
                }
              },
              builder:  (context,state){
                return ConditionalBuilder(
                  condition: state is ! SignUpLoading,
                  fallback: (context)=>CustomLoading(),
                  builder: (context){
                    return CustomButton(
                      text: LangKeys.signUp.tr(),
                      onPressed: (){
                        context.read<RegisterCubit>().register(
                            fullName: name,
                            phone: phone,
                            password: password,
                            passwordConfirmation: confirmPassword,
                            gender: gender,
                            email: email,
                            image: null,
                        );
                      },
                    );
                  },

                );
              },

            ),
            Gap(12.h),

          ],
        ),
      ),
    );
  }
}
