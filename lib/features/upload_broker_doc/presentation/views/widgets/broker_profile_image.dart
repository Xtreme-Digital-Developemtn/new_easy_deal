import 'package:easy_deal/features/upload_broker_doc/data/repos/upload_broker_doc_repo_imple.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/app_services/remote_services/service_locator.dart';
import '../../../../../main_imports.dart';

class BrokerProfileImage extends StatelessWidget {
  const BrokerProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBrokerDocCubit, UploadBrokerDocStates>(
      builder: (context, state) {
        var uploadBrokerDocCubit = context.read<UploadBrokerDocCubit>();
        return Row(
          children: [
            GestureDetector(
              onTap: uploadBrokerDocCubit.uploadProfilePicture,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryLight.withValues(alpha: 0.3),
                  image: uploadBrokerDocCubit.profileImage != null
                      ? DecorationImage(
                          image: FileImage(
                            uploadBrokerDocCubit.profileImage!,
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: uploadBrokerDocCubit.profileImage != null
                    ? ClipOval(
                        child: CustomNetWorkImage(
                          fit: BoxFit.cover,
                          height: 84,
                          width: 84,
                          imageUrl:
                              "https://wallpapers.com/images/featured-full/cool-profile-picture-87h46gcobjl5e4xu.jpg",
                          raduis: 50,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset(
                          SvgImages.camera,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryDark,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
              ),
            ),
            Gap(20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LangKeys.profilePhoto.tr(),
                  style: AppStyles.black16SemiBold,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: uploadBrokerDocCubit.uploadProfilePicture,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryDark,
                      ),
                      child: Text(
                        LangKeys.changePhoto.tr(),
                        style: AppStyles.black14Medium,
                      ),
                    ),
                    if (uploadBrokerDocCubit.profileImage != null)
                      TextButton(
                        onPressed: uploadBrokerDocCubit.clearProfileImage,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryDark,
                        ),
                        child: Text(
                          LangKeys.deletePhoto.tr(),
                          style: AppStyles.black16SemiBold,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
