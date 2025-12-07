import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/broker_id_national_images.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/broker_profile_image.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/views/widgets/button_for_upload_images.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/app_services/remote_services/service_locator.dart';
import '../../data/repos/upload_broker_doc_repo_imple.dart';
import '../view_model/upload_broker_doc_cubit.dart';

class UploadBrokerDocView extends StatelessWidget {
  const UploadBrokerDocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.completeProfileInfo.tr()),
      body: BlocProvider(
        create: (context) =>
            UploadBrokerDocCubit(getIt.get<UploadBrokerDocRepoImpl>()),
        child: Padding(
          padding:   EdgeInsets.all(20.0.r),
          child: Column(
             children: [
               BrokerProfileImage(),
               Gap(24.h),
               BrokerIdNationalImages(),
               Spacer(),
               ButtonForUploadImages(),
               Gap(24.h),
             ],
          ),
        ),
      ),
    );
  }
}
