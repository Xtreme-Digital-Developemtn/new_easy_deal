import 'package:easy_deal/main_imports.dart';

class ReportIssueParms {
  final String phone;
  final String email;
  final String title;
  final String description;
  final bool isActive;
  final String type;
  final BuildContext context;

  ReportIssueParms({
    required this.phone,
    required this.email,
    required this.title,
    required this.description,
    required this.isActive,
    required this.type,
    required this.context,
  });
}
