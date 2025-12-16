 import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/broker_documents_images.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/broker_profile_image.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/button_for_upload_images.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/app_services/remote_services/service_locator.dart';
import '../../data/repos/upload_broker_doc_repo_imple.dart';
import '../view_model/upload_broker_doc_cubit.dart';

class UploadBrokerDocView extends StatelessWidget {
  final int? selectedIndex;

  const UploadBrokerDocView({super.key, this.selectedIndex});

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
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: ListView(
            children: [
              BrokerProfileImage(isCompany: isCompany),
              Gap(24.h),
              BrokerDocumentsImages(isCompany: isCompany),
              Gap(24.h),
              ButtonForUploadImages(isCompany: isCompany),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}