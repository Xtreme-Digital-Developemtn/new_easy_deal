import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class BestSellerEmptyList extends StatelessWidget {
  const BestSellerEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 50, color: Colors.grey),
          SizedBox(height: 8.h),
          Text(
            LangKeys.noUnitsAvailable.tr(),
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
