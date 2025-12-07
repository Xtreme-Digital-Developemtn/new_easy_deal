import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_cubit.dart';
import 'package:easy_deal/features/upload_broker_doc/presentation/view_model/upload_broker_doc_states.dart';

class ButtonForUploadImages extends StatelessWidget {
  final bool isCompany;

  const ButtonForUploadImages({super.key, required this.isCompany});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBrokerDocCubit, UploadBrokerDocStates>(
      builder: (context, state) {
        var cubit = context.read<UploadBrokerDocCubit>();

        return ValueListenableBuilder<bool>(
          valueListenable: isCompany
              ? cubit.isCompanyDocumentsValid
              : cubit.isIndividualDocumentsValid,
          builder: (context, isValid, child) {
            return CustomButton(
              text: LangKeys.continuee.tr(),
              onPressed: isValid
                  ? () {
                // هنا يمكنك إضافة منطق مختلف للشركة والفرد
                if (isCompany) {
                  cubit.submitCompanyDocuments();
                } else {
                  cubit.submitIndividualDocuments();
                }
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