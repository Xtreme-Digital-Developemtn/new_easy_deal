// import 'package:match_kora_app/core/utils/app_strings/app_strings.dart';
//
// class MyValidators {
//   static String? displayNameValidator(String? displayName) {
//     if (displayName == null || displayName.trim().isEmpty) {
//       return AppStrings.nameValidate; // "Name is required"
//     }
//
//     final trimmed = displayName.trim();
//
//     if (trimmed.length < 2) {
//       return AppStrings.nameTooShort; // "Name must be at least 2 characters"
//     }
//
//     if (trimmed.length > 50) {
//       return AppStrings.nameTooLong; // "Name cannot exceed 50 characters"
//     }
//
//     if (RegExp(r'[0-9]').hasMatch(trimmed)) {
//       return AppStrings.nameNoNumbers; // "Name cannot contain numbers"
//     }
//
//     if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(trimmed)) {
//       return AppStrings.nameNoSpecialChars; // "Name cannot contain special characters"
//     }
//
//     return null;
//   }
//
//   static String? displayMessageValidator(String? message) {
//     if (message == null || message.isEmpty) {
//       return AppStrings.messageValidate; // "Message is required"
//     }
//
//     if (message.length < 10) {
//       return AppStrings.messageTooShort; // "Message must be at least 10 characters"
//     }
//
//     if (message.length > 500) {
//       return AppStrings.messageTooLong; // "Message cannot exceed 500 characters"
//     }
//
//     return null;
//   }
//
//   static String? emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return AppStrings.emailValidate; // "Email is required"
//     }
//
//     final emailRegex = RegExp(
//         r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'
//     );
//
//     if (!emailRegex.hasMatch(value)) {
//       return AppStrings.emailValidate2; // "Please enter a valid email"
//     }
//
//     // Additional checks for common email issues
//     if (value.contains(' ')) {
//       return AppStrings.emailNoSpaces; // "Email cannot contain spaces"
//     }
//
//     if (value.startsWith('.') || value.endsWith('.')) {
//       return AppStrings.emailInvalidDots; // "Email cannot start or end with a dot"
//     }
//
//     if ('@.'.allMatches(value).length > 1) {
//       return AppStrings.emailMultipleAt; // "Email can only contain one @ symbol"
//     }
//
//     return null;
//   }
//
//   static String? passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return AppStrings.passwordValidate; // "Password is required"
//     }
//
//     // Detailed password requirements
//     final requirements = <String>[];
//
//     if (value.length < 8) {
//       requirements.add(AppStrings.passwordMinLength); // "8 characters minimum"
//     }
//
//     if (value.length > 30) {
//       requirements.add(AppStrings.passwordMaxLength); // "30 characters maximum"
//     }
//
//     if (!RegExp(r'[A-Z]').hasMatch(value)) {
//       requirements.add(AppStrings.passwordRequireUppercase); // "1 uppercase letter"
//     }
//
//     if (!RegExp(r'[a-z]').hasMatch(value)) {
//       requirements.add(AppStrings.passwordRequireLowercase); // "1 lowercase letter"
//     }
//
//     if (!RegExp(r'\d').hasMatch(value)) {
//       requirements.add(AppStrings.passwordRequireNumber); // "1 number"
//     }
//
//     if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
//       requirements.add(AppStrings.passwordRequireSpecial); // "1 special character"
//     }
//
//     if (requirements.isNotEmpty) {
//       return '${AppStrings.passwordRequirements}:\n${requirements.join('\n')}';
//     }
//
//     return null;
//   }
//
//   static String? urlValidator(String? value, {bool isRequired = false}) {
//     if (isRequired && (value == null || value.isEmpty)) {
//       return AppStrings.urlRequired; // "URL is required"
//     }
//
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//
//     final urlRegex = RegExp(
//         r'^(https?://)?' // http:// or https://
//         r'([\w-]+\.)+[\w-]+' // Domain
//         r'(:\d+)?' // Port
//         r'(/[\w-./?%&=]*)?$' // Path and query
//     );
//
//     if (!urlRegex.hasMatch(value)) {
//       return AppStrings.urlInvalid; // "Please enter a valid URL"
//     }
//
//     if (!value.startsWith('http://') && !value.startsWith('https://')) {
//       return AppStrings.urlMissingProtocol; // "URL must start with http:// or https://"
//     }
//
//     return null;
//   }
//
//   static String? repeatPasswordValidator({String? value, String? password}) {
//     if (value == null || value.isEmpty) {
//       return AppStrings.repeatPasswordRequired; // "Please repeat your password"
//     }
//
//     if (password == null || password.isEmpty) {
//       return AppStrings.enterPasswordFirst; // "Please enter your password first"
//     }
//
//     if (value != password) {
//       return AppStrings.passwordsDontMatch; // "Passwords don't match"
//     }
//
//     return null;
//   }
//
//   static String? phoneValidator(String? value, {String? countryCode}) {
//     if (value == null || value.isEmpty) {
//       return AppStrings.phoneRequired; // "Phone number is required"
//     }
//
//     final numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');
//
//     // Country-specific validation
//     switch (countryCode) {
//       case '+20': // Egypt
//         if (!RegExp(r'^01[0-9]{9}$').hasMatch(numericValue)) {
//           return AppStrings.phoneEgyptInvalid; // "Egyptian numbers must be 11 digits starting with 01"
//         }
//         break;
//       case '+1': // US/Canada
//         if (numericValue.length != 10) {
//           return AppStrings.phoneUSInvalid; // "US/Canada numbers must be 10 digits"
//         }
//         break;
//       default: // International
//         if (numericValue.length < 8 || numericValue.length > 15) {
//           return AppStrings.phoneInternationalInvalid; // "Phone number must be 8-15 digits"
//         }
//     }
//
//     return null;
//   }
// }