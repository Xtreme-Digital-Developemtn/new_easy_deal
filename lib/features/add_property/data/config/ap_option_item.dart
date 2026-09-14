/// A selectable option in the add-property stepper.
///
/// Self-contained bilingual model so the whole feature stays standalone: it
/// carries both Arabic and English labels and resolves the right one from the
/// current locale (mirrors the frontend `getTranslatedOption`).
class ApOptionItem {
  final String value;
  final String ar;
  final String en;

  const ApOptionItem({required this.value, required this.ar, required this.en});

  String label(bool isArabic) => isArabic ? ar : en;
}

/// Bilingual label used for field titles / placeholders.
class ApText {
  final String ar;
  final String en;

  const ApText(this.ar, this.en);

  String value(bool isArabic) => isArabic ? ar : en;
}
