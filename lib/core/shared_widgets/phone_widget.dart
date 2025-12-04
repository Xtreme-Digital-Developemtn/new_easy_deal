import 'package:easy_localization/easy_localization.dart';
 import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../main_imports.dart';
import 'custom_phone_text_field.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    super.key,
    required this.controller,
    required this.onPhoneChanged,
    this.label,
  });

  final TextEditingController controller;
  final ValueChanged<String> onPhoneChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return CustomPhoneTextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      hintText: label ?? LangKeys.phoneNumber.tr(),
      validator: (value) {
        if (value == null || value.number.isEmpty) {
          return label ?? LangKeys.phoneNumber.tr();
        }
        return null;
      },
      onCountry: (country) {
        final fullNumber = '+${country.dialCode}${controller.text}';
        onPhoneChanged(fullNumber);
      },
      onChanged: (v) {
        onPhoneChanged(v.completeNumber);
      },
    );
  }
}

class EditPhoneWidget extends StatefulWidget {
  final String phone;
  final TextEditingController controller;
  final ValueChanged<String> onPhoneChanged;
  final String? label;

  const EditPhoneWidget({
    super.key,
    required this.phone,
    required this.controller,
    required this.onPhoneChanged,
    this.label,
  });

  @override
  State<EditPhoneWidget> createState() => _EditPhoneWidgetState();
}

class _EditPhoneWidgetState extends State<EditPhoneWidget> {
  String? _initialCountryCode;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _parseAndSet(widget.phone);
  }

  void _parseAndSet(String fullPhone) {
    final normalized = fullPhone.replaceFirst('+', '');
    for (final country in countries) {
      final dialCode = country.dialCode.replaceAll('+', '');
      if (normalized.startsWith(dialCode)) {
        final localNumber = normalized.substring(dialCode.length);
        widget.controller.text = localNumber;
        _initialCountryCode = country.code;
        _isInitialized = true;
        setState(() {});
        return;
      }
    }


    widget.controller.text = normalized;
    _initialCountryCode = 'US';
    _isInitialized = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const CircularProgressIndicator();
    }

    return CustomPhoneTextFormField(
      labelText: widget.label ?? "phone".tr(),
      controller: widget.controller,
      initialCountryCode: _initialCountryCode,
      onChanged: (PhoneNumber number) {
        widget.onPhoneChanged(number.completeNumber);
      },
      onCountry: (country) {
        final fullNumber = '+${country.dialCode}${widget.controller.text}';
        widget.onPhoneChanged(fullNumber);
      },
      validator: (value) {
        if (value == null || value.number.isEmpty) {
          return LangKeys.phoneNumber.tr();
        }
        return null;
      },
    );
  }
}
