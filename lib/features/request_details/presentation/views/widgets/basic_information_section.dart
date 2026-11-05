import 'package:easy_localization/easy_localization.dart';
import 'package:easy_deal/features/request_details/data/config/display_value.dart';
import 'package:easy_deal/features/request_details/data/models/request_details_model.dart';
import 'package:easy_deal/features/request_details/presentation/views/widgets/request_section.dart';

import '../../../../../main_imports.dart';
import '../../../../requests/data/config/request_translations.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key, this.data});

  final Data? data;

  /// نفس الحقول القديمة بنفس الترتيب، بس كل صف بيختفي لو قيمته مش صالحة.
  static List<Widget?> _rows(Data? data) => [
        optionalInfoRow(
          title: LangKeys.operationType.tr(),
          value: DisplayValue.mapped(data?.type, RequestTranslations.type),
        ),
        optionalInfoRow(
          title: LangKeys.scopeOfSpecialization.tr(),
          value: DisplayValue.mapped(
            data?.specializationScope,
            RequestTranslations.specializationScope,
          ),
        ),
        optionalInfoRow(
          title: LangKeys.unitType.tr(),
          value: DisplayValue.mapped(data?.unit, RequestTranslations.unit),
        ),
      ];

  static bool hasData(Data? data) => hasVisibleRows(_rows(data));

  @override
  Widget build(BuildContext context) {
    return RequestSection(
      title: LangKeys.basicInformation.tr(),
      child: InfoCard(children: _rows(data)),
    );
  }
}
