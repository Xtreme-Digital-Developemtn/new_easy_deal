import 'package:easy_deal/main_imports.dart';

class UnitInquiryParms {
  final String name;
  final String phone;
  final String message;
  final dynamic unitId;
  final BuildContext context;

  UnitInquiryParms({
    required this.name,
    required this.phone,
    required this.message,
    required this.unitId,
    required this.context,
  });
}
