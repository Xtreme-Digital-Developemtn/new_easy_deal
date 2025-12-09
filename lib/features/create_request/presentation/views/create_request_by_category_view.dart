import 'package:easy_deal/features/create_request/presentation/view_model/create_request_cubit.dart';
import 'package:easy_deal/features/create_request/presentation/view_model/create_request_states.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_city_area_sub_area_address_location_link.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_specialization_and_deal_type_unit_type.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_unit_info_details.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/form_of_unit_upload_unit_documents.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/next_button.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/past_button.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/payment_system_price.dart';
import 'package:easy_deal/features/create_request/presentation/views/widgets/step_number.dart';
import 'package:easy_deal/main_imports.dart';
import '../../data/models/category_model.dart';

class CreateRequestByCategoryView extends StatelessWidget {
  const CreateRequestByCategoryView({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: category.name),

      // 1️⃣ هنا الجسم بس اللي يعمل Scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: BlocBuilder<CreateRequestCubit, CreateRequestStates>(
            builder: (context, state) {
              var cubit = context.read<CreateRequestCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepNumber(),
                  Gap(32.h),

                  if (cubit.currentStepNumber == 1)
                    FormOfSpecializationAndDealTypeAndUnitType(),

                  if (cubit.currentStepNumber == 2)
                    FormOfCityAreaSubAreaAddressLocationLink(),

                  if (cubit.currentStepNumber == 3)
                    FormOfUnitInfoDetails(),

                  if (cubit.currentStepNumber == 4)
                    FormOfUnitUploadUnitDocuments(),

                  if (cubit.currentStepNumber == 5)
                    PaymentSystemAndPrice(),

                  Gap(150.h), // مساحة علشان الزرار تحت
                ],
              );
            },
          ),
        ),
      ),

      bottomNavigationBar: BlocBuilder<CreateRequestCubit, CreateRequestStates>(
        builder: (context, state) {
          var cubit = context.read<CreateRequestCubit>();
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            color: Colors.white,
            child: Row(
              children: [
                if (cubit.currentStepNumber > 1)
                  Expanded(child: PastButton()),
                if (cubit.currentStepNumber > 1)
                  Gap(10.w),
                Expanded(child: NextButton()),
              ],
            ),
          );
        },
      ),
    );
  }
}

