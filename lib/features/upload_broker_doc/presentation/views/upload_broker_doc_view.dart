import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/broker_documents_images.dart';
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
            ? LangKeys.completeCompanyInfo.tr()
            : LangKeys.completeProfileInfo.tr(),
      ),
      body: BlocProvider(
        create: (context) =>
            UploadBrokerDocCubit(getIt.get<UploadBrokerDocRepoImpl>()),
        child: BlocBuilder<UploadBrokerDocCubit, UploadBrokerDocStates>(
          builder: (context, uploadState) {
            var docCubit = context.read<UploadBrokerDocCubit>();
            return Padding(
              padding: EdgeInsets.all(20.0.r),
              child: ListView(
                children: [
                  BrokerProfileImage(isCompany: isCompany),
                  Gap(24.h),
                  BrokerDocumentsImages(isCompany: isCompany),
                  Gap(32.h),
                  CustomButton(
                    text: LangKeys.next.tr(),
                    onPressed: _isFormValid(docCubit, isCompany)
                        ? () {
                            if (isCompany) {
                              // Company: submit directly with register
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
                                  'profileImagePath': docCubit.companyLogo?.path,
                                  'commercialRegistryImagePath': docCubit.commercialFile?.path,
                                  'taxCardImagePath': docCubit.taxFile?.path,
                                },
                              );
                            } else {
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
                                  'profileImagePath': docCubit.profileImage?.path,
                                  'frontIdPath': docCubit.frontIdCardImage?.path,
                                  'backIdPath': docCubit.backIdCardImage?.path,
                                },
                              );
                            }
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

  bool _isFormValid(UploadBrokerDocCubit docCubit, bool isCompany) {
    if (isCompany) return docCubit.isCompanyDocumentsValid;
    return docCubit.isIndividualDocumentsValid;
  }
}

