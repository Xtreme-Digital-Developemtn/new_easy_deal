import 'dart:io';

import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../upload_broker_doc/presentation/views/widgets/build_image_container.dart';

class FormOfUnitUploadUnitDocuments extends StatelessWidget {
  const FormOfUnitUploadUnitDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestCubit, CreateRequestStates>(
      builder: (context, state) {
        var cubit = context.read<CreateRequestCubit>();

        return Column(
          children: [
            /// 🔵 MAIN IMAGE
            BuildImageContainer(
              height: 100.h,
              title: LangKeys.mainImage.tr(),
              isFront: true,
              imageFile: cubit.mainImage,
              onPickImage: () => cubit.pickMainImage(
                newEmit: UploadMainImageSuccessState(),
              ),
              onClearImage: () => cubit.clearMainImage(
                newEmit: ClearMainImageSuccessState(),
              ),
            ),

            Gap(20.h),

            /// 🟢 MASTER PLAN IMAGE
            BuildImageContainer(
              height: 100.h,
              title: LangKeys.masterPlanImage.tr(),
              isFront: true,
              imageFile: cubit.masterPlanImage,
              onPickImage: () => cubit.pickMasterPlanImage(
                newEmit: UploadMasterPlanSuccessState(),
              ),
              onClearImage: () => cubit.clearMasterPlanImage(
                newEmit: ClearMasterPlanSuccessState(),
              ),
            ),

            Gap(20.h),

            /// 🟣 FINANCIAL STATEMENT IMAGE
            BuildImageContainer(
              height: 100.h,
              title: LangKeys.financialStatementImage.tr(),
              isFront: true,
              imageFile: cubit.financialStatementImage,
              onPickImage: () => cubit.pickFinancialStatementImage(
                newEmit: UploadFinancialStatementSuccessState(),
              ),
              onClearImage: () => cubit.clearFinancialStatementImage(
                newEmit: ClearFinancialStatementSuccessState(),
              ),
            ),

            Gap(20.h),

            /// 🔴 VIDEO UPLOAD
            BuildImageContainer(
              height: 100.h,
              title: LangKeys.video.tr(),
              isFront: true,
              // الفيديو مش صورة → هنعمل thumbnail بسيطة
              imageFile: cubit.video != null ? File(cubit.video!.path) : null,
              onPickImage: () => cubit.pickVideo(
                newEmit: UploadVideoSuccessState(),
              ),
              onClearImage: () => cubit.clearVideo(
                newEmit: ClearVideoSuccessState(),
              ),
            ),

            Gap(20.h),
          ],
        );
      },
    );
  }
}

