import 'package:flutter/material.dart';

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

    // Send consultation
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: sendConsultation,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFF339F6D),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
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
  }
}