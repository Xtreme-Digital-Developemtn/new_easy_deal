import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';


class EditEmailView extends StatefulWidget {
  const EditEmailView ({super.key,  });

  @override
  State<EditEmailView> createState() => _EditEmailViewState();
}

class _EditEmailViewState extends State<EditEmailView> {
  @override
  void initState() {
    final currentEmail = context.read<ProfileCubit>().clientProfileModel?.data?.email ?? "";
    context.read<EditProfileCubit>().emailCon = TextEditingController(text: currentEmail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.editEmailAddress),
      body: BlocConsumer<EditProfileCubit , EditProfileStates>(
        listener: (context,state){
          if(state is EditProfileDataSuccessState){
            Toast.showSuccessToast(msg: state.updateProfileDataModel.message.toString(), context: context);
            context.pop();
            context.read<ProfileCubit>().getClientProfile(clientId: CacheHelper.getData(key: "userId"));
          }
          else if(state is EditProfileDataErrorState){
            Toast.showErrorToast(msg: state.error.toString(), context: context);
          }
        },
        builder: (context,state){
          var editProfileCubit = context.read<EditProfileCubit>();
          return Padding(
            padding:   EdgeInsets.all(20.0.r),
            child: Form(
              key: editProfileCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.editEmailAddressMsg.tr()),
                  Gap(32.h),
                  Text(LangKeys.emailAddress.tr()),
                  Gap(8.h),
                  CustomTextFormField(
                    validator: (value) => AppValidators.emailValidator(editProfileCubit.emailCon.text),
                    hintText:   LangKeys.enterYourEmail.tr(),
                    controller: editProfileCubit.emailCon,
                    onChanged: (_) => editProfileCubit.onUserInteraction(),
                  ),
                  Gap(32.h),
                  ConditionalBuilder(
                    condition: state is ! EditProfileDataLoadingState,
                    fallback: (context)=>CustomLoading(),
                    builder: (context){
                      return CustomButton(
                        onPressed: (){
                          if(editProfileCubit.formKey.currentState!.validate()){
                            editProfileCubit.updateProfileData( );
                          }

                          // context.pushNamed(Routes.otpView,arguments: {
                          //   "contact" : "mostafa@gmail.com",
                          //   "isMobile" : false,
                          // });
                        },
                        text: LangKeys.save.tr(),
                      );
                    },

                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
