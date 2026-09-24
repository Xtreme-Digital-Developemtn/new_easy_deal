import 'package:flutter/material.dart';

import '../widgets/consultant_header.dart';
import '../widgets/contact_buttons.dart';
import '../widgets/consultation_form.dart';

class ConsultationView extends StatelessWidget {
  const ConsultationView({super.key, this.brokerPhone});
  final String? brokerPhone;

  @override
  Widget build(BuildContext context) {
    // إزالة Scaffold/SingleChildScrollView المتداخلة داخل ListView - كانت تسبب '!_debugDoingThisLayout' و scrollExtent Infinity
    final phone = (brokerPhone ?? '').trim();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ConsultantHeader(),
            const SizedBox(height: 20),
            ContactButtons(brokerPhone: phone),
            const SizedBox(height: 22),
            const ConsultationForm(),
          ],
        ),
      ),
    );
  }
}