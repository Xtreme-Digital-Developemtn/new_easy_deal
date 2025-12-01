import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../main_imports.dart';


class PinCodeFieldsWidget extends StatelessWidget {
  final TextEditingController controller;

  const PinCodeFieldsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        keyboardType : TextInputType.number,
        controller: controller,
        length: 4,
        appContext: context,
        onChanged: (_) {},
        onCompleted: (_) => FocusScope.of(context).unfocus(),
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          selectedColor: AppColors.primaryDark,
          selectedFillColor: AppColors.primaryDark,
          inactiveColor: AppColors.primaryDark,
          inactiveFillColor: AppColors.white,
          activeColor: AppColors.primaryDark,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 60,
          fieldWidth: 60,
          activeFillColor: Colors.white,
        ),
        cursorColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        beforeTextPaste: (text) => true,
      ),
    );
  }
}