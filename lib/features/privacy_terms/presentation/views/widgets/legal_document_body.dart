import 'package:easy_deal/features/privacy_terms/data/models/legal_document_model.dart';
import 'package:easy_deal/features/privacy_terms/presentation/views/widgets/legal_contact_card.dart';
import 'package:easy_deal/features/privacy_terms/presentation/views/widgets/legal_document_header.dart';
import 'package:easy_deal/features/privacy_terms/presentation/views/widgets/legal_section_item.dart';
import 'package:easy_deal/main_imports.dart';

class LegalDocumentBody extends StatelessWidget {
  const LegalDocumentBody({
    super.key,
    required this.document,
    this.showWorkingHours = false,
  });

  final LegalDocumentModel document;
  final bool showWorkingHours;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
      itemCount: document.sections.length + 2,
      separatorBuilder: (context, index) => Gap(22.h),
      itemBuilder: (context, index) {
        if (index == 0) {
          return LegalDocumentHeader(
            titleKey: document.titleKey,
            introKey: document.introKey,
          );
        }
        if (index == document.sections.length + 1) {
          return LegalContactCard(showWorkingHours: showWorkingHours);
        }
        return LegalSectionItem(
          section: document.sections[index - 1],
          number: index,
        );
      },
    );
  }
}
