import 'package:easy_deal/features/home/presentation/views/widgets/service_item.dart';
import 'package:easy_deal/main_imports.dart';


class ServicesBottomSheet extends StatelessWidget {
  const ServicesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ServiceItem(),
          Gap(24.h),
          ServiceItem(),
          Gap(24.h),
          ServiceItem(),
          Gap(24.h),
        ],
      ),
    );
  }
}
