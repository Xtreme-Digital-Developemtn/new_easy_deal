import 'package:easy_deal/main_imports.dart';

class BrokerSpecializationsList extends StatelessWidget {
  const BrokerSpecializationsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> brokerSpecializationsList = ["Nasr City" , "New Cairo" , "Obour" , "Commercial" , "Admission"];
    return LayoutBuilder(builder:  (context, constraints) {
      final screenWidth = constraints.maxWidth;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: screenWidth,
        ),
        child: Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          alignment: WrapAlignment.start,
          children: brokerSpecializationsList.map((item) {
            final isSelected = brokerSpecializationsList.contains(item);
            return IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.blueDark
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12.r),

                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                child: Text(
                  item,
                  style:  AppStyles.white14SemiBold  ,
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
