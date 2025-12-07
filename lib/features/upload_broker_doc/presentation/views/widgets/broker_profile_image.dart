import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:easy_deal/main_imports.dart';

class BrokerProfileImage extends StatelessWidget {
  final bool isCompany;

  const BrokerProfileImage({super.key, required this.isCompany});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBrokerDocCubit, UploadBrokerDocStates>(
      builder: (context, state) {
        var uploadBrokerDocCubit = context.read<UploadBrokerDocCubit>();

        return Row(
          children: [
            GestureDetector(
              onTap: isCompany
                  ? uploadBrokerDocCubit.uploadCompanyLogo
                  : uploadBrokerDocCubit.uploadProfilePicture,
              child: Container(
                height: 84.r,
                width: 84.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryLight.withValues(alpha: 0.3),
                  image: isCompany
                      ? (uploadBrokerDocCubit.companyLogo != null
                      ? DecorationImage(
                    image: FileImage(uploadBrokerDocCubit.companyLogo!),
                    fit: BoxFit.cover,
                  )
                      : null)
                      : (uploadBrokerDocCubit.profileImage != null
                      ? DecorationImage(
                    image: FileImage(uploadBrokerDocCubit.profileImage!),
                    fit: BoxFit.cover,
                  )
                      : null),
                ),
                child: _buildImageContent(uploadBrokerDocCubit),
              ),
            ),
            Gap(20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCompany
                      ? LangKeys.companyLogo.tr()
                      : LangKeys.profilePhoto.tr(),
                  style: AppStyles.black16SemiBold,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: isCompany
                          ? uploadBrokerDocCubit.uploadCompanyLogo
                          : uploadBrokerDocCubit.uploadProfilePicture,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryDark,
                      ),
                      child: Text(
                        isCompany
                            ? LangKeys.changeLogo.tr()
                            : LangKeys.changePhoto.tr(),
                        style: AppStyles.black14Medium,
                      ),
                    ),
                    if ((isCompany && uploadBrokerDocCubit.companyLogo != null) ||
                        (!isCompany && uploadBrokerDocCubit.profileImage != null))
                      TextButton(
                        onPressed: isCompany
                            ? uploadBrokerDocCubit.clearCompanyLogo
                            : uploadBrokerDocCubit.clearProfileImage,
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

  Widget _buildImageContent(UploadBrokerDocCubit cubit) {
    final imageFile = isCompany ? cubit.companyLogo : cubit.profileImage;

    if (imageFile != null) {
      return ClipOval(
        child: Image.file(
          imageFile,
          fit: BoxFit.cover,
          height: 84.r,
          width: 84.r,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(20.r),
        child: SvgPicture.asset(
          SvgImages.camera,
          colorFilter: ColorFilter.mode(
            AppColors.primaryDark,
            BlendMode.srcIn,
          ),
        ),
      );
    }
  }
}