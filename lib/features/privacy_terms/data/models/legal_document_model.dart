import 'package:easy_deal/features/privacy_terms/data/models/legal_section_model.dart';

/// A full legal document: title, intro paragraph and its numbered sections.
class LegalDocumentModel {
  const LegalDocumentModel({
    required this.titleKey,
    required this.introKey,
    required this.sections,
  });

  final String titleKey;
  final String introKey;
  final List<LegalSectionModel> sections;
}
