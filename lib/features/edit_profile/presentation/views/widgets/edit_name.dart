import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';

import '../../../../../core/utils/toast/toast.dart';

class EditName extends StatefulWidget {
  const EditName({super.key});

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  @override
  void initState() {
    super.initState();
    final currentName = context.read<ProfileCubit>().clientProfileModel?.data?.fullName ?? "";
    context.read<EditProfileCubit>().nameCon = TextEditingController(text: currentName);
  }

  @override
  void dispose() {
    context.read<EditProfileCubit>().nameCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileStates>(
      listener: (context, state) {
        if (state is EditProfileDataSuccessState) {
          Toast.showSuccessToast(
            msg: state.updateProfileDataModel.message.toString(),
            context: context,
          );
          context.pop();
          context.read<ProfileCubit>().getClientProfile(
            clientId: CacheHelper.getData(key: "userId"),
          );
        } else if (state is EditProfileDataErrorState) {
          Toast.showErrorToast(
            msg: state.error.toString(),
            context: context,
          );
        }
      },
      builder: (context, state) {
        final editProfileCubit = context.read<EditProfileCubit>();

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LangKeys.editName.tr(), style: AppStyles.black16SemiBold),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(SvgImages.close),
                    ),
                  ],
                ),
                Gap(12.h),
                CustomTextFormField(
                  controller: editProfileCubit.nameCon,
                  validator: (value) => AppValidators.displayNameValidator(value),
                  hintText: LangKeys.enterYourName.tr(),
                  onChanged: (_) => editProfileCubit.onUserInteraction(),
                ),
                Gap(12.h),
                ConditionalBuilder(
                  condition: state is! EditProfileDataLoadingState,
                  fallback: (context) => CustomLoading(),
                  builder: (context) {
                    return CustomButton(
                      onPressed: () {
                        if(editProfileCubit.formKey.currentState!.validate()){
                          editProfileCubit.updateProfileData( );
                        }
                      },
                      text: LangKeys.save.tr(),
                    );
                  },
                ),
                Gap(MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        );
      },
    );
  }
}