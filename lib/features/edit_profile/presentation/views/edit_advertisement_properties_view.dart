import 'package:easy_deal/features/edit_profile/presentation/views/widgets/specializations_areas_widgets/main_section.dart';
import 'package:easy_deal/main_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class EditAdvertisementAndPropertyDetailsView extends StatefulWidget {
  const EditAdvertisementAndPropertyDetailsView({super.key});

  @override
  State<EditAdvertisementAndPropertyDetailsView> createState() =>
      _EditAdvertisementAndPropertyDetailsViewState();
}

class _EditAdvertisementAndPropertyDetailsViewState
    extends State<EditAdvertisementAndPropertyDetailsView> {
  List<String> currentSpecializations = ['شقق للبيع', 'عقارات تجارية'];
  List<String> availableSpecializations = ['شقق للإيجار', 'أراضي', 'مكاتب'];

  List<String> currentAreas = ['مدينة نصر', 'الشروق'];
  List<String> availableAreas = ['التجمع الخامس', 'المعادي', 'مصر الجديدة'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: LangKeys.advertisementAndPropertyDetails.tr(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainSection(
                title: "التخصصات",
                currentItems: currentSpecializations,
                availableItems: availableSpecializations,
                onAddItem: (item) {
                  setState(() {
                    currentSpecializations.add(item);
                    availableSpecializations.remove(item);
                  });
                },
                onRemoveItem: (item) {
                  setState(() {
                    currentSpecializations.remove(item);
                    availableSpecializations.add(item);
                  });
                },
                onAddCustomItem: (item) {
                  setState(() {
                    currentSpecializations.add(item);
                  });
                },
              ),

              Gap(40.h),

              /// --- قسم المناطق ---
              MainSection(
                title: "المناطق",
                currentItems: currentAreas,
                availableItems: availableAreas,
                onAddItem: (item) {
                  setState(() {
                    currentAreas.add(item);
                    availableAreas.remove(item);
                  });
                },
                onRemoveItem: (item) {
                  setState(() {
                    currentAreas.remove(item);
                    availableAreas.add(item);
                  });
                },
                onAddCustomItem: (item) {
                  setState(() {
                    currentAreas.add(item);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }




}
