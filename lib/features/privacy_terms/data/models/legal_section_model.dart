/// One numbered section inside a legal document (terms / privacy).
class LegalSectionModel {
  const LegalSectionModel({
    required this.titleKey,
    this.bodyKey,
    this.bulletKeys = const [],
  });

  final String titleKey;

  /// Paragraph shown under the title, may also act as a lead-in for [bulletKeys].
  final String? bodyKey;

  final List<String> bulletKeys;
}
