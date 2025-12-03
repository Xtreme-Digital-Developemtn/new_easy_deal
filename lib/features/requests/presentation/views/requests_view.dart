import 'package:easy_deal/features/requests/presentation/views/widgets/requests_count.dart';
import 'package:easy_deal/features/requests/presentation/views/widgets/requests_list.dart';
import 'package:easy_deal/main_imports.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RequestsCount(),
              Gap(24.h),
              RequestsList(),

            ],
          ),
        ),
      ),

      // زر إضافة طلب جديد
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryDark,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }


}