import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';

import '../../../../core/utils/toast/toast.dart';

class EditNameView extends StatefulWidget {
  const EditNameView({super.key});
  @override
  State<EditNameView> createState() => _EditNameViewState();
}

class _EditNameViewState extends State<EditNameView> {
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
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.editName),
      body: BlocConsumer<EditProfileCubit, EditProfileStates>(
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
          return SingleChildScrollView(
            padding: EdgeInsets.all(20.r),
            child: Form(
              key: context.read<EditProfileCubit>().formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: context.read<EditProfileCubit>().nameCon,
                    validator: (value) => AppValidators.displayNameValidator(value),
                    hintText: LangKeys.enterYourName.tr(),
                    onChanged: (_) => context.read<EditProfileCubit>().onUserInteraction(),
                  ),
                  Gap(12.h),
                  ConditionalBuilder(
                    condition: state is! EditProfileDataLoadingState,
                    fallback: (context) => CustomLoading(),
                    builder: (context) {
                      return CustomButton(
                        onPressed: () {
                          if (context.read<EditProfileCubit>().formKey.currentState!.validate()) {
                            context.read<EditProfileCubit>().updateProfileData();
                          }
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