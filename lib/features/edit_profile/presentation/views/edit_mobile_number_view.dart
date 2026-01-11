import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/shared_widgets/phone_widget.dart';


class EditMobileNumberView extends StatefulWidget {
  const EditMobileNumberView ({super.key,  });

  @override
  State<EditMobileNumberView> createState() => _EditMobileNumberViewState();
}

class _EditMobileNumberViewState extends State<EditMobileNumberView> {
  @override
  void initState() {
    final currentMobileNumber = context.read<ProfileCubit>().clientProfileModel?.data?.phone ?? "";
    context.read<EditProfileCubit>().mobileNumberCon = TextEditingController(text: currentMobileNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.editMobileNumber),
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
                  Text(LangKeys.editMobileNumberMsg.tr()),
                  Gap(32.h),
                  Text(LangKeys.mobileNumber.tr()),
                  Gap(8.h),
                  PhoneWidget(
                    controller: editProfileCubit.mobileNumberCon,
                    onPhoneChanged: (v) {
                      editProfileCubit.phoneNumber = v;
                      editProfileCubit.validateForm();
                    },
                    onPhoneChangedWithoutCode: (v){
                      editProfileCubit.mobileNumberCon.text = v;
                      editProfileCubit.validateForm();
                    },
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
