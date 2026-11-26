import 'package:flutter/material.dart';

class ConsultantHeader extends StatelessWidget {
  const ConsultantHeader({super.key, this.brokerName});

  final String? brokerName;

  @override
  Widget build(BuildContext context) {
    final name = (brokerName != null && brokerName!.trim().isNotEmpty)
        ? brokerName!.trim()
        : 'Mohamed Farouk';
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF222222),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'مستشار عقاري أول',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(width: 10),

        CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFFE4E4E4),
          child: Icon(
            Icons.person,
            size: 35,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}