import 'package:flutter/material.dart';

class ConsultantHeader extends StatelessWidget {
  const ConsultantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Mohamed Farouk',
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