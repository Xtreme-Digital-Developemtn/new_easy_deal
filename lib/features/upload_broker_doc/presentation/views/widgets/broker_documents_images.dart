import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'build_image_container.dart';

void showDocImageSourcePicker(
  BuildContext context,
  Future<void> Function(ImageSource source) onPick,
) {
  showModalBottomSheet(
    context: context,
    builder: (_) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('الكاميرا'),
            onTap: () {
              Navigator.pop(context);
              onPick(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('المعرض'),
            onTap: () {
              Navigator.pop(context);
              onPick(ImageSource.gallery);
            },
          ),
        ],
      ),
    ),
  );
}

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
              _buildCompanyDocuments(uploadBrokerDocCubit, context),
            ] else ...[
              _buildIndividualDocuments(uploadBrokerDocCubit, context),
            ],
          ],
        );
      },
    );
  }

  Widget _buildCompanyDocuments(UploadBrokerDocCubit cubit, BuildContext context) {
    return Column(
      children: [
        BuildImageContainer(
          title: LangKeys.commercialFile.tr(),
          isFront: true,
          imageFile: cubit.commercialFile,
          onPickImage: () => showDocImageSourcePicker(
            context,
            (s) => cubit.pickCommercialFile(
              newEmit: UploadCommercialFileSuccessState(),
              source: s,
            ),
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
          onPickImage: () => showDocImageSourcePicker(
            context,
            (s) => cubit.pickTaxFile(
              newEmit: UploadTaxFileSuccessState(),
              source: s,
            ),
          ),
          onClearImage: () => cubit.clearTaxFile(
            newEmit: ClearTaxFileSuccessState(),
          ),
        ),
      ],
    );
  }

  Widget _buildIndividualDocuments(UploadBrokerDocCubit cubit, BuildContext context) {
    return Column(
      children: [
        BuildImageContainer(
          title: LangKeys.idFrontSide.tr(),
          isFront: true,
          imageFile: cubit.frontIdCardImage,
          onPickImage: () => showDocImageSourcePicker(
            context,
            (s) => cubit.pickIdCardImages(
              isFront: true,
              newEmit: UploadFrontCardIdPhotoSuccessState(),
              source: s,
            ),
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
          onPickImage: () => showDocImageSourcePicker(
            context,
            (s) => cubit.pickIdCardImages(
              isFront: false,
              newEmit: UploadBackCardIdPhotoSuccessState(),
              source: s,
            ),
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