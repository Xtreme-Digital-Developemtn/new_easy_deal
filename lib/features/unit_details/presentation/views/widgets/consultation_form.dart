import '../../../../../core/utils/params/unit_inquiry_parms.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../main_imports.dart';
import '../../view_model/unit_details_cubit.dart';
import '../../view_model/unit_details_states.dart';
import 'custom_text_field.dart';

class ConsultationForm extends StatefulWidget {
  const ConsultationForm({super.key});

  @override
  State<ConsultationForm> createState() => _ConsultationFormState();
}

class _ConsultationFormState extends State<ConsultationForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void sendConsultation() {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final message = messageController.text.trim();

    if (name.isEmpty || phone.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك قم بملء جميع البيانات'),
        ),
      );
      return;
    }

    final unitDetailsCubit = context.read<UnitDetailsCubit>();
    unitDetailsCubit.sendInquiry(
      unitInquiryParms: UnitInquiryParms(
        name: name,
        phone: phone,
        message: message,
        unitId: unitDetailsCubit.unitDetailsModel?.data?.id,
        context: context,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnitDetailsCubit, UnitDetailsStates>(
      listenWhen: (previous, current) =>
          current is SendUnitInquirySuccessState ||
          current is SendUnitInquiryErrorState,
      listener: (context, state) {
        if (state is SendUnitInquirySuccessState) {
          nameController.clear();
          phoneController.clear();
          messageController.clear();
          FocusScope.of(context).unfocus();
          Toast.showSuccessToast(
            msg: 'تم إرسال استفسارك بنجاح، هيتم التواصل معك قريبًا',
            context: context,
          );
        } else if (state is SendUnitInquiryErrorState) {
          Toast.showErrorToast(msg: state.error, context: context);
        }
      },
      buildWhen: (previous, current) =>
          current is SendUnitInquiryLoadingState ||
          current is SendUnitInquirySuccessState ||
          current is SendUnitInquiryErrorState,
      builder: (context, state) {
        final isSending = state is SendUnitInquiryLoadingState;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'أو أرسل استفسارك',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
              ),
            ),

            const SizedBox(height: 14),

            CustomTextField(
              controller: nameController,
              hintText: 'الاسم',
              keyboardType: TextInputType.name,
            ),

            const SizedBox(height: 10),

            CustomTextField(
              controller: phoneController,
              hintText: 'رقم الهاتف',
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 10),

            CustomTextField(
              controller: messageController,
              hintText: 'اكتب رسالتك...',
              maxLines: 4,
              textInputAction: TextInputAction.newline,
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: isSending ? null : sendConsultation,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF339F6D),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF339F6D),
                  disabledForegroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: isSending
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        'إرسال الاستفسار',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
