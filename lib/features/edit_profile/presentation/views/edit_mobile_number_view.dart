import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_deal/core/utils/phone/phone_utils.dart';
import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:easy_deal/features/edit_profile/presentation/view_model/edit_profile_states.dart';
import 'package:easy_deal/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/shared_widgets/phone_widget.dart';

class EditMobileNumberView extends StatefulWidget {
  const EditMobileNumberView({super.key});

  @override
  State<EditMobileNumberView> createState() => _EditMobileNumberViewState();
}

class _EditMobileNumberViewState extends State<EditMobileNumberView> {
  late final String _currentPhone;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileCubit>().clientProfileModel?.data;
    final cubit = context.read<EditProfileCubit>();
    _currentPhone = profile?.phone ?? "";

    // بنفكّك الرقم المحفوظ لكود دولة + رقم محلي، عشان الحقل يتعمّر بالرقم
    // المحلي بس (لو دخل بصفر البداية أو بكود الدولة الحقل بيعتبره رقم غلط).
    final parsed = PhoneUtils.parse(_currentPhone);
    cubit.mobileNumberCon.text = parsed.local;
    cubit.phoneDialCode = parsed.dialCode;
    cubit.phoneNumber = parsed.apiValue;
    cubit.nameCon.clear();
    cubit.emailCon.clear();
    // الكيوبت عايش طول عمر التطبيق، فلو المستخدم تفاعل مع شاشة تانية قبل كده
    // بنصفّر الحالة عشان مانعملش validate والفورم لسه بيتبني.
    cubit.hasUserInteracted = false;
    cubit.role = profile?.role;
    cubit.profileModel = context.read<ProfileCubit>().clientProfileModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.editMobileNumber),
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
            Toast.showErrorToast(msg: state.error.toString(), context: context);
          }
        },
        builder: (context, state) {
          var editProfileCubit = context.read<EditProfileCubit>();
          return Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Form(
              key: editProfileCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.editMobileNumberMsg.tr()),
                  Gap(32.h),
                  Text(LangKeys.mobileNumber.tr()),
                  Gap(8.h),
                  EditPhoneWidget(
                    phone: _currentPhone,
                    controller: editProfileCubit.mobileNumberCon,
                    onPhoneChanged: (v) {
                      editProfileCubit.phoneNumber = v;
                      editProfileCubit.onUserInteraction();
                    },
                    onPhoneChangedWithoutCode: (v) {
                      // مبنكتبش في الكونترولر هنا، هو أصلاً كونترولر الحقل
                      // والكتابة فيه بترجّع الكيرسور لأول الحقل.
                      editProfileCubit.onUserInteraction();
                    },
                    onDialCodeChanged: (dialCode) {
                      editProfileCubit.phoneDialCode = dialCode;
                    },
                  ),
                  Gap(32.h),
                  ConditionalBuilder(
                    condition: state is! EditProfileDataLoadingState,
                    fallback: (context) => CustomLoading(),
                    builder: (context) {
                      return CustomButton(
                        onPressed: () {
                          if (editProfileCubit.formKey.currentState!
                              .validate()) {
                            final profile = context
                                .read<ProfileCubit>()
                                .clientProfileModel!
                                .data!;
                            final local =
                                editProfileCubit.mobileNumberCon.text.trim();
                            editProfileCubit.updateProfileData(
                              id: CacheHelper.getData(key: "userId"),
                              email: profile.email,
                              // بنبعت الرقم كامل بكود دولته، مش النص المحلي
                              // بس، وإلا الرقم المحفوظ بيتغيّر لدولة تانية.
                              phone: local.isEmpty
                                  ? profile.phone
                                  : PhoneUtils.toApiValue(
                                      dialCode: editProfileCubit.phoneDialCode,
                                      local: local,
                                    ),
                              fullName: profile.fullName,
                            );
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
