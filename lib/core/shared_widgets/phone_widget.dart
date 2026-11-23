import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../main_imports.dart';
import '../utils/phone/phone_utils.dart';
import 'custom_phone_text_field.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    super.key,
    required this.controller,
    required this.onPhoneChanged,
    required this.onPhoneChangedWithoutCode,
    this.label,
  });

  final TextEditingController controller;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onPhoneChangedWithoutCode;
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
        onPhoneChangedWithoutCode(controller.text);
      },
      onChanged: (v) {
        onPhoneChanged(v.completeNumber);
        onPhoneChangedWithoutCode(v.number);
      },
    );
  }
}

class EditPhoneWidget extends StatefulWidget {
  final String phone;
  final TextEditingController controller;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onPhoneChangedWithoutCode;
  final ValueChanged<String>? onDialCodeChanged;
  final String? label;

  const EditPhoneWidget({
    super.key,
    required this.phone,
    required this.controller,
    required this.onPhoneChanged,
    required this.onPhoneChangedWithoutCode,
    this.onDialCodeChanged,
    this.label,
  });

  @override
  State<EditPhoneWidget> createState() => _EditPhoneWidgetState();
}

class _EditPhoneWidgetState extends State<EditPhoneWidget> {
  late final ParsedPhone _parsed;

  @override
  void initState() {
    super.initState();
    // الرقم بييجي من الـ API بأشكال مختلفة (01012345678 أو +201012345678
    // أو 00201012345678)، فبنفكّكه لكود دولة + رقم محلي. لو سيبنا صفر البداية
    // الحقل بيحسب الرقم أطول من طول الدولة وبيعرض "رقم غير صالح" وهو أصلاً
    // رقم المستخدم، والحفظ كان بيفضل مرفوض.
    _parsed = PhoneUtils.parse(widget.phone);
    widget.controller.text = _parsed.local;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPhoneTextFormField(
      labelText: widget.label ?? LangKeys.phoneNumber.tr(),
      controller: widget.controller,
      initialCountryCode: _parsed.isoCode,
      onChanged: (PhoneNumber number) {
        widget.onPhoneChanged(number.completeNumber);
        widget.onPhoneChangedWithoutCode(number.number);
      },
      onCountry: (country) {
        widget.onDialCodeChanged?.call(country.dialCode);
        final fullNumber = '+${country.dialCode}${widget.controller.text}';
        widget.onPhoneChanged(fullNumber);
        widget.onPhoneChangedWithoutCode(widget.controller.text);
      },
      validator: (value) => AppValidators.phoneValidator(
        value?.number,
        countryCode: value == null ? null : '+${value.countryCode}',
      ),
    );
  }
}
