
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../main_imports.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_states.dart';

class PromoCodeBottomSheet extends StatelessWidget {
  final void Function(String code) onSubmit;

  PromoCodeBottomSheet({
    super.key,
    required this.onSubmit,
  });

  final TextEditingController promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: (){
              context.read<ProfileCubit>().openWhatsApp();
            },
            child: Text("اضغط هنا للحصول علي كود الخصم",style: TextStyle(
              color: AppColors.green,
            ),)

          ),
          Gap(20.h),
          CustomTextFormField(
            controller: promoController,
            hintText: 'اكتب كود الخصم',
          ),
          Gap(20.h),

          BlocConsumer<ProfileCubit, ProfileStates>(
            listener: (context, state) {
              if (state is ApplyPromoCodeSuccessState) {
                Navigator.pop(context);
                Toast.showSuccessToast(msg: state.applyPromoCodeModel.message ?? "تم تطبيق الكود بنجاح", context: context);
              }

              if (state is ApplyPromoCodeErrorState) {
                Toast.showErrorToast(msg: state.error, context: context);
              }
            },
            builder: (context, state) {
              if (state is ApplyPromoCodeLoadingState) {
                return CustomLoading();
              }

              return SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    final code = promoController.text.trim();

                    if (code.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('برجاء إدخال كود الخصم'),
                        ),
                      );
                      return;
                    }

                    onSubmit(code);
                  },
                  text: 'تأكيد',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}