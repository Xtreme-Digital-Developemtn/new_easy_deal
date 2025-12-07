import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'build_image_container.dart';

class BrokerDocumentsImages extends StatelessWidget {
  final bool isCompany;

  const BrokerDocumentsImages({super.key, required this.isCompany});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBrokerDocCubit, UploadBrokerDocStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var uploadBrokerDocCubit = context.read<UploadBrokerDocCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isCompany
                  ? LangKeys.companyLegalDocuments.tr()
                  : LangKeys.nationalIdDocuments.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
            Gap(8.h),

            Text(
              isCompany
                  ? LangKeys.uploadRequiredLegalDocuments.tr()
                  : LangKeys.uploadFrontAndBackId.tr(),
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.gray,
              ),
            ),
            Gap(20.h),

            if (isCompany) ...[
              _buildCompanyDocuments(uploadBrokerDocCubit),
            ] else ...[
              _buildIndividualDocuments(uploadBrokerDocCubit),
            ],
          ],
        );
      },
    );
  }

  Widget _buildCompanyDocuments(UploadBrokerDocCubit cubit) {
    return Column(
      children: [
        BuildImageContainer(
          title: LangKeys.commercialFile.tr(),
          isFront: true,
          imageFile: cubit.commercialFile,
          onPickImage: () => cubit.pickCommercialFile(
            newEmit: UploadCommercialFileSuccessState(),
          ),
          onClearImage: () => cubit.clearCommercialFile(
            newEmit: ClearCommercialFileSuccessState(),
          ),
        ),
        Gap(20.h),

        BuildImageContainer(
          title: LangKeys.taxFile.tr(),
          isFront: false,
          imageFile: cubit.taxFile,
          onPickImage: () => cubit.pickTaxFile(
            newEmit: UploadTaxFileSuccessState(),
          ),
          onClearImage: () => cubit.clearTaxFile(
            newEmit: ClearTaxFileSuccessState(),
          ),
        ),
      ],
    );
  }

  Widget _buildIndividualDocuments(UploadBrokerDocCubit cubit) {
    return Column(
      children: [
        BuildImageContainer(
          title: LangKeys.idFrontSide.tr(),
          isFront: true,
          imageFile: cubit.frontIdCardImage,
          onPickImage: () => cubit.pickIdCardImages(
            isFront: true,
            newEmit: UploadFrontCardIdPhotoSuccessState(),
          ),
          onClearImage: () => cubit.clearIdCardImages(
            isFront: true,
            newEmit: ClearFrontCardIdPhotoSuccessState(),
          ),
        ),
        Gap(20.h),

        BuildImageContainer(
          title: LangKeys.idBackSide.tr(),
          isFront: false,
          imageFile: cubit.backIdCardImage,
          onPickImage: () => cubit.pickIdCardImages(
            isFront: false,
            newEmit: UploadBackCardIdPhotoSuccessState(),
          ),
          onClearImage: () => cubit.clearIdCardImages(
            isFront: false,
            newEmit: ClearBackCardIdPhotoSuccessState(),
          ),
        ),
      ],
    );
  }
}