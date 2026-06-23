import 'package:easy_deal/core/utils/toast/toast.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_cubit.dart';
import 'package:easy_deal/features/register/presentation/view_model/register_states.dart';
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
            return BlocConsumer<RegisterCubit, RegisterStates>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  context.pushNamedAndRemoveUntil(Routes.layoutView);
                } else if (state is SignUpError) {
                  Toast.showErrorToast(msg: state.message, context: context);
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: ListView(
                    children: [
                      BrokerProfileImage(isCompany: isCompany),
                      Gap(24.h),
                      BrokerDocumentsImages(isCompany: isCompany),
                      Gap(24.h),
                      if (state is! SignUpLoading)
                        CustomButton(
                          text: LangKeys.signUp.tr(),
                          onPressed: docCubit.isIndividualDocumentsValid
                              ? () {
                                  context.read<RegisterCubit>().register(
                                    fullName: name,
                                    phone: phone,
                                    password: password,
                                    passwordConfirmation: confirmPassword,
                                    gender: gender,
                                    email: email,
                                    image: docCubit.profileImage,
                                    idFront: docCubit.frontIdCardImage,
                                    idBack: docCubit.backIdCardImage,
                                    brokerTypeIndex: selectedIndex,
                                  );
                                }
                              : null,
                        )
                      else
                        CustomLoading(),
                      Gap(24.h),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}