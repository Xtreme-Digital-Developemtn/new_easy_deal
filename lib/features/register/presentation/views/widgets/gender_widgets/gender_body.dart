import 'package:easy_deal/features/register/presentation/views/widgets/gender_widgets/select_gender_type.dart';
import 'package:easy_deal/features/register/presentation/views/widgets/gender_widgets/selection_gender_type_button.dart';
import 'package:easy_deal/main_imports.dart';

class GenderBody extends StatelessWidget {
  const GenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectGenderType(),
        Gap(24.h),
       SelectionGenderTypeButton(),
      ],
    );
  }
}
