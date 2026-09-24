import 'package:flutter/material.dart';

import '../widgets/consultant_header.dart';
import '../widgets/contact_buttons.dart';
import '../widgets/consultation_form.dart';

class ConsultationView extends StatelessWidget {
  const ConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ConsultantHeader(),

                  SizedBox(height: 20),

                  ContactButtons(),

                  SizedBox(height: 22),

                  ConsultationForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}