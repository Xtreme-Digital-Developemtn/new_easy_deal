import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';

import '../../../../../main_imports.dart';
import '../../view_model/upload_broker_doc_states.dart';
import 'build_image_container.dart';

class BrokerIdNationalImages extends StatelessWidget {
  const BrokerIdNationalImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBrokerDocCubit , UploadBrokerDocStates>(
      listener: (context,state){},
      builder:  (context,state){
        var uploadBrokerDocCubit = context.read<UploadBrokerDocCubit>();
        return Column(
          children: [
            BuildImageContainer(
              isFront: true,
              imageFile: uploadBrokerDocCubit.frontIdCardImage,
              onPickImage: () => uploadBrokerDocCubit.pickIdCardImages(
                isFront: true,
                newEmit: UploadFrontCardIdPhotoSuccessState(),
              ),
              onClearImage: () => uploadBrokerDocCubit.clearIdCardImages(
                isFront: true,
                newEmit: ClearFrontCardIdPhotoSuccessState(),
              ),
            ),
            Gap(20.h),
            BuildImageContainer(
              isFront: false,
              imageFile: uploadBrokerDocCubit.backIdCardImage,
              onPickImage: () => uploadBrokerDocCubit.pickIdCardImages(
                isFront: false,
                newEmit: UploadBackCardIdPhotoSuccessState(),
              ),
              onClearImage: () => uploadBrokerDocCubit.clearIdCardImages(
                isFront: false,
                newEmit: ClearBackCardIdPhotoSuccessState(),
              ),
            ),


          ],
        );
      },

    );
  }
}