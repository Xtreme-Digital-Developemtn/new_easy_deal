import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';
import '../../view_model/upload_broker_doc_cubit.dart';
import '../../view_model/upload_broker_doc_states.dart';

class ButtonForUploadImages extends StatelessWidget {
  const ButtonForUploadImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBrokerDocCubit, UploadBrokerDocStates>(
      builder: (context, state) {
        var cubit = context.read<UploadBrokerDocCubit>();

        return ValueListenableBuilder<bool>(
          valueListenable: cubit.isImagesValid,
          builder: (context, isValid, child) {
            return CustomButton(
              text: LangKeys.continuee.tr(),
              onPressed: isValid
                  ? () {
                context.pushNamedAndRemoveUntil(Routes.successView);
              }
                  : null,
            );
          },
        );
      },
    );
  }
}
