import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/broker_location_section.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/broker_profile_image.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/app_services/remote_services/service_locator.dart';
import '../../data/repos/upload_broker_doc_repo_imple.dart';
import '../view_model/upload_broker_doc_cubit.dart';

class UploadBrokerDocView extends StatelessWidget {
  final int selectedIndex;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final String role;
  final String phone;

  const UploadBrokerDocView({
    super.key,
    required this.selectedIndex,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.role,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final isCompany = selectedIndex == 2;

    return Scaffold(
      appBar: GlobalAppBar(
        title: isCompany
            ? LangKeys.completeCompanyInfo
            : LangKeys.completeProfileInfo,
      ),
      body: BlocProvider(
        create: (context) =>
            UploadBrokerDocCubit(getIt.get<UploadBrokerDocRepoImpl>())
              ..getAllCities(),
        child: BlocConsumer<UploadBrokerDocCubit, UploadBrokerDocStates>(
          listener: (context, uploadState) {
            if (uploadState is UploadFileValidationErrorState) {
              Toast.showErrorToast(msg: uploadState.message, context: context);
            }
          },
          builder: (context, uploadState) {
            var docCubit = context.read<UploadBrokerDocCubit>();
            final isImageValid = isCompany
                ? docCubit.isCompanyDocumentsValid
                : docCubit.isIndividualDocumentsValid;
            final isValid = isImageValid && docCubit.isLocationValid;
            return Padding(
              padding: EdgeInsets.all(20.0.r),
              child: ListView(
                children: [
                  BrokerProfileImage(isCompany: isCompany),
                  Gap(12.h),
                  if (!isImageValid)
                    Text(
                      isCompany
                          ? LangKeys.uploadCompanyLogoToContinue.tr()
                          : LangKeys.uploadProfilePhotoToContinue.tr(),
                      style:
                          TextStyle(fontSize: 12.sp, color: AppColors.errorDark),
                    ),
                  Gap(24.h),
                  const BrokerLocationSection(),
                  Gap(12.h),
                  if (isImageValid && !docCubit.isLocationValid)
                    Text(
                      LangKeys.selectWorkAreaToContinue.tr(),
                      style:
                          TextStyle(fontSize: 12.sp, color: AppColors.errorDark),
                    ),
                  Gap(20.h),
                  CustomButton(
                    text: LangKeys.next.tr(),
                    onPressed: isValid
                        ? () {
                            context.pushNamed(
                              Routes.brokerSpecializationView,
                              arguments: {
                                'selectedIndex': selectedIndex,
                                'name': name,
                                'email': email,
                                'password': password,
                                'confirmPassword': confirmPassword,
                                'gender': gender,
                                'role': role,
                                'phone': phone,
                                'profileImagePath': isCompany
                                    ? docCubit.companyLogo?.path
                                    : docCubit.profileImage?.path,
                                'areaId': docCubit.selectedArea?.id,
                                'subAreaId': docCubit.selectedSubArea?.id,
                              },
                            );
                          }
                        : null,
                  ),
                  Gap(24.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
